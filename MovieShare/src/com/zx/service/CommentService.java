package com.zx.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import com.zx.dao.CommentDao;
import com.zx.dao.FilmmakerDao;
import com.zx.dao.FilmmakerMovieDao;
import com.zx.dao.JobDao;
import com.zx.dao.MovieDao;
import com.zx.dao.ReplyDao;
import com.zx.dao.TypeDao;
import com.zx.dao.UserDao;
import com.zx.javabean.Comment;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.FilmmakerMovie;
import com.zx.javabean.Job;
import com.zx.javabean.Movie;
import com.zx.javabean.Reply;
import com.zx.javabean.TheType;
import com.zx.javabean.User;
import com.zx.serviceinterface.ICommentService;
import com.zx.utils.JdbcUtils;


public class CommentService implements ICommentService {
	private CommentDao commentDao = new CommentDao();
	private UserDao userDao = new UserDao();
	private ReplyDao replyDao = new ReplyDao();
	private MovieDao movieDao = new MovieDao();
	private FilmmakerMovieDao filmmakerMovieDao = new FilmmakerMovieDao();
	private FilmmakerDao filmmakerDao = new FilmmakerDao();
	private JobDao jobDao = new JobDao();
	private TypeDao typeDao = new TypeDao();
	@Override
	public boolean commentMovie(Comment comment) {
		Connection conn = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			commentDao.saveMovieComment(conn,comment);
			conn.commit();
		}catch(Exception e){
			JdbcUtils.connRollBack(conn);
			return false;
		}finally {
			JdbcUtils.closeConnection(conn);
		}
		
		return true;
	}
	@Override
	public Comment checkComment(Integer commentID) {
		Comment comment = commentDao.getCommentByID(commentID);
		User cUser = userDao.getUserByID(comment.getUser().getUserID());
		comment.setUser(cUser);
		List<Reply> replys = replyDao.getReplyByComment(commentID);
		comment.setReplyList(replys);
		Movie movie = movieDao.getMovieByComment(commentID);
		comment.setMovie(movie);
		List<FilmmakerMovie> fms = filmmakerMovieDao.getFilmmakerIDByMovie(movie.getMovieID());
		if (fms != null){		
			Iterator<FilmmakerMovie> fmIt = fms.iterator();
			List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
			while (fmIt.hasNext()) {
				FilmmakerMovie fm = fmIt.next();
				Filmmaker filmmaker = filmmakerDao.getFilmmakerByID(fm.getFilmmakerID());
				List<Job> jobs = new ArrayList<Job>();
				Job job = jobDao.getJobByName(fm.getFilmmakerJob());
				jobs.add(job);
				filmmaker.setJobList(jobs);
				filmmakers.add(filmmaker);			
			}
			movie.setFilmmakerList(filmmakers);
		}
		List<TheType> types = typeDao.getTypeByMovie(movie.getMovieID());//µÃµ½type
		if (types != null){
			movie.setTypeList(types);
		}
		comment.setMovie(movie);
		return comment;
	}
	@Override
	public List<Comment> getCommentByDate() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE,-1);
		//String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		List<Comment> comments = commentDao.getCommentByDate("2018-02-02");
		Iterator<Comment> cIt = comments.iterator();
		while(cIt.hasNext()){
			Comment comment = cIt.next();
			User cUser = userDao.getUserByID(comment.getUser().getUserID());
			comment.setUser(cUser);
			Movie movie = movieDao.getMovieByComment(comment.getCommentID());
			comment.setMovie(movie);
			List<Reply> replys = replyDao.getReplyByComment(comment.getCommentID());
			comment.setReplyList(replys);
		}
		Collections.sort(comments);
		return comments;
	}
	@Override
	public boolean deleteMovieComment(Integer commentID) {
		Connection conn = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);	
				replyDao.deleteReplyByComment(conn,commentID);
				commentDao.deleteCommentByID(conn,commentID);
			conn.commit();
		}catch(Exception e){
			JdbcUtils.connRollBack(conn);
			return false;
		}finally {
			JdbcUtils.closeConnection(conn);
		}
		return true;
	
	}
}
