package com.zx.service;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import com.zx.dao.CommentDao;
import com.zx.dao.CountMarkDao;
import com.zx.dao.FilmmakerDao;
import com.zx.dao.FilmmakerJobDao;
import com.zx.dao.FilmmakerMovieDao;
import com.zx.dao.JobDao;
import com.zx.dao.MarkDao;
import com.zx.dao.MovieDao;
import com.zx.dao.MovieTypeDao;
import com.zx.dao.ReplyDao;
import com.zx.dao.TypeDao;
import com.zx.dao.UserDao;
import com.zx.daointerface.ICommentDao;
import com.zx.daointerface.IFilmmakerDao;
import com.zx.daointerface.IFilmmakerMovieDao;
import com.zx.daointerface.IJobDao;
import com.zx.daointerface.IMarkDao;
import com.zx.daointerface.IMovieDao;
import com.zx.daointerface.IMovieTypeDao;
import com.zx.daointerface.IReplyDao;
import com.zx.daointerface.ITypeDao;
import com.zx.daointerface.IUserDao;
import com.zx.javabean.Comment;
import com.zx.javabean.CountMark;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.FilmmakerMovie;
import com.zx.javabean.Job;
import com.zx.javabean.Mark;
import com.zx.javabean.Movie;
import com.zx.javabean.TheType;
import com.zx.serviceinterface.IMovieService;
import com.zx.utils.JdbcUtils;
import com.zx.utils.MovieAddType;
import com.zx.utils.MovieResetType;


public class MovieService implements IMovieService {
	private IFilmmakerDao filmmakerDao = new FilmmakerDao();
	private IMovieDao movieDao = new MovieDao();
	private ITypeDao typeDao = new TypeDao();
	private IJobDao jobDao = new JobDao();
	private IFilmmakerMovieDao filmmakerMovieDao = new FilmmakerMovieDao();
	private IMovieTypeDao movieTypeDao = new MovieTypeDao();
	private IMarkDao markDao = new MarkDao();
	private ICommentDao commentDao = new CommentDao();
	private IUserDao userDao = new UserDao();
	private IReplyDao replyDao = new ReplyDao();
	private CountMarkDao countMakrDao = new CountMarkDao();
	
	//添加影片
	@Override
	public MovieAddType addMovie(Movie movie) {
		Connection conn = null;
		Movie gMovie = movieDao.getMovieByName(movie.getMovieName()); //判断影片名是否存在
		if (gMovie != null) {
			return MovieAddType.MovieExist;
		}
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			movieDao.saveMovie(conn,movie);
			conn.commit();
			Movie getmovie = movieDao.getMovieByName(movie.getMovieName());
			Iterator<Filmmaker> filmmakerit = movie.getFilmmakerList().iterator();
			while (filmmakerit.hasNext()) {             // 添加影人影片信息
				Filmmaker filmmaker = filmmakerit.next();
				Integer fId = filmmakerDao.getFilmmakerByName(filmmaker.getFilmmakerName());
				List<Job> jobs = filmmaker.getJobList();
				if (fId != null) {
					for (Job job : jobs) {
						filmmakerMovieDao.saveFilmmakerMovie(conn,fId, getmovie.getMovieID(), job.getJobName());
					}
				}
			}
			Iterator<TheType> typesit = movie.getTypeList().iterator();
			while (typesit.hasNext()) {              // 保存影片类型
				TheType type = typesit.next();
				movieTypeDao.saveMovieType(conn, getmovie.getMovieID(), type.getTypeID());
			}
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return MovieAddType.FilmmakerNoExist;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return MovieAddType.AddSuccess;
	}
	//获取影片类型
	@Override
	public List<TheType> getType() {
		List<TheType> typeList = typeDao.getType();
		return typeList;
	}
	//获取影人职业
	@Override
	public List<Job> getJob() {
		List<Job> jobList = jobDao.getJob();
		return jobList;
	}
	//获取最近影片
	@Override
	public List<Movie> getMovieByDate(String startDate, String endDate,int beginNum) {
		List<Movie> movieList = movieDao.getMovieByDate(startDate, endDate,beginNum);
		return movieList;
	}
	//获取最近影片的总页数
	public int totalPage(String startDate,String endDate){
		return movieDao.getTotalPages(startDate, endDate);
	}
	
	
	//查看影片
	@Override
	public Movie checkMovie(Integer movieID) {
		//得到movie
		Movie movie = movieDao.getMovieByID(movieID);
		//System.out.println("movieService："+movie);
		if (movie == null) {
			return movie;
		}
		//得到mark
		List<Mark> marks = markDao.getMarkByMovie(movieID); 
		movie.setMarkList(marks);
		if (marks != null) {
			Iterator<Mark> mIt = marks.iterator();
			while (mIt.hasNext()) {
				Mark mark = mIt.next();
				mark.setUser(userDao.getUserByMark(mark.getMarkID()));
			}
		}
		//得到comment
		List<Comment> comments = commentDao.getCommentByMovie(movieID);
		movie.setCommentList(comments);
		if (comments != null) {
			Iterator<Comment> cIt = comments.iterator();
			while (cIt.hasNext()) {
				Comment comment = cIt.next();
				comment.setUser(userDao.getUserByComment(comment.getCommentID()));
			}
			movie.setCommentList(comments);
		}
		//得到filmmaker
		List<Filmmaker> filmmakers = filmmakerDao.getFilmmakerByMovie(movieID);
		movie.setFilmmakerList(filmmakers);
		//System.out.println("filmmakerAction:"+fms);
		/*if (filmmakers != null){		
			Iterator<Filmmaker> fmIt = filmmakers.iterator();
			//List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
			while (fmIt.hasNext()) {
				Filmmaker fm = fmIt.next();
				List<Job> jobs = new ArrayList<Job>();
				Job job = jobDao.getJobByName(fm.getFilmmakerID());
				jobs.add(job);
				fm.setJobList(jobs);
				filmmakers.add(fm);
				
			}
			
		}*/
		//得到type
		List<TheType> types = typeDao.getTypeByMovie(movieID);
		movie.setTypeList(types);
		if (types != null){
			movie.setTypeList(types);
		}
		//得到评分的统计信息
		CountMark cm = countMakrDao.getCountMark(movieID);
		movie.setCountMark(cm);
		return movie;
	}
	//获取影人最近的影片
	@Override
	public List<Movie> getLastMovies(Integer filmmakerID) {
		List<Movie> movies = movieDao.getMovieByFilmmaker(filmmakerID);
		Iterator<Movie> it = movies.iterator();
		while (it.hasNext()) {
			Movie movie = it.next();
			List<Mark> marks = markDao.getMarkByMovie(movie.getMovieID());
			movie.setMarkList(marks);
		}
		return movies;
	}
	//获取获取影人最热门的影片
	public List<Movie> getBestMovies(Integer filmmakerID) {
		List<Movie> movies = movieDao.getMovieByFilmmaker(filmmakerID);

		Iterator<Movie> it = movies.iterator();
		while (it.hasNext()) {
			Movie movie = it.next();
			List<Mark> marks = markDao.getMarkByMovie(movie.getMovieID());
			movie.setMarkList(marks);
		}
		Collections.sort(movies);
		return movies;
	}
	//获取评分最高的影片
	@Override
	public List<Movie> getMvpMovies() {
		List<Movie> movies = movieDao.getMvoieBySocre();
		return movies;
	}

	@Override
	public Movie getMovie(Integer movieID) {
		Movie movie = movieDao.getMovieByID(movieID);//得到movie
		if (movie == null) {
			return movie;
		}
		List<FilmmakerMovie> filmmakerMovies = filmmakerMovieDao.getFilmmakerIDByMovie(movieID);
		//System.out.println("getMovie:"+filmmakerMovies);
		List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
		Iterator<FilmmakerMovie> fit = filmmakerMovies.iterator();
		while(fit.hasNext()){
			List<Job> jobs = new ArrayList<Job>();
			FilmmakerMovie filmmakerMovie = fit.next();
			Job job = jobDao.getJobByName(filmmakerMovie.getFilmmakerJob());
			jobs.add(job);
			Filmmaker filmmaker = filmmakerDao.getFilmmakerByID(filmmakerMovie.getFilmmakerID());
			filmmaker.setJobList(jobs);
			filmmakers.add(filmmaker);
		}
		movie.setFilmmakerList(filmmakers);
		List<TheType> types = typeDao.getTypeByMovie(movieID);//得到type
		if (types != null){
			movie.setTypeList(types);
		}
		return movie;
	}
	//修改影片
	@Override
	public MovieResetType resetMovie(Movie movie) {
		Connection conn = null;
		Movie Movie1 = movieDao.getMovieByName(movie.getMovieName()); //根据影片获取到影片信
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			if (Movie1 == null||(Movie1.getMovieID()==movie.getMovieID())) { //如何影片名为空或影片为当前影片名
				movieDao.updateMovie(conn,movie);
				//System.out.println("saveMovie:" + resetMovieResult);
				filmmakerMovieDao.deleteFilmmakerMovieByMoive(conn,movie.getMovieID());
				Iterator<Filmmaker> filmmakerit = movie.getFilmmakerList().iterator();
				while (filmmakerit.hasNext()) {// 添加影人影片信息
					Filmmaker filmmaker = filmmakerit.next();
					Integer fId = filmmakerDao.getFilmmakerByName(filmmaker.getFilmmakerName());//获取根据影人名获取影人ID;
					List<Job> jobs = filmmaker.getJobList();
					if (fId != null) {
						for (Job job : jobs) {
							filmmakerMovieDao.saveFilmmakerMovie(conn,fId, movie.getMovieID(), job.getJobName());
						}
					}else{
						JdbcUtils.connRollBack(conn);
						return MovieResetType.FilmmakerNoExist;
					}
				}
				movieTypeDao.deleteMovieType(conn,movie.getMovieID());
				Iterator<TheType> typesit = movie.getTypeList().iterator();
				while (typesit.hasNext()) {// 保存影片类型
					TheType type = typesit.next();
					movieTypeDao.saveMovieType(conn,movie.getMovieID(), type.getTypeID());
				}
			}else{
				return MovieResetType.MovieExist;
			}
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return MovieResetType.ResetFailed;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return MovieResetType.ResetSuccess;
		
	}
	//删除影片
	@Override
	public boolean deleteMovie(Integer movieID) {
		Connection conn = null;
		try {
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			filmmakerMovieDao.deleteFilmmakerMovieByMoive(conn,movieID);
			movieTypeDao.deleteMovieType(conn,movieID);
			markDao.deleteMarkByMovie(conn,movieID);
			List<Comment> comments = commentDao.getCommentByMovie(movieID);
			for(Comment comment : comments){
				replyDao.deleteReplyByComment(conn,comment.getCommentID());
			}
			commentDao.deleteCommentByMovie(conn,movieID);
			movieDao.deleteMovieByID(conn,movieID);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return false;
		}finally {
			JdbcUtils.closeConnection(conn);
		}
		return true;
	}
	//推荐影片
	@Override
	public List<Movie> recommendMovie(Integer typeID) {
		
		List<Movie> movies = movieDao.getMovieByType(typeID);
		return movies;
	}
	public Movie getOnlyMovie(Integer movieID){
		return movieDao.getMovieByID(movieID);
	}
}
