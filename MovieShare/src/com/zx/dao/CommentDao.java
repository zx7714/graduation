package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.zx.daointerface.ICommentDao;
import com.zx.javabean.Comment;
import com.zx.javabean.Movie;
import com.zx.javabean.User;

public class CommentDao extends DAO<Comment>implements ICommentDao{
	//ArrayList list  = new ArrayList();
	@Override
	public List<Comment> getCommentByUser(Integer userID,Integer page) {
		String sql = "select commentID,commentTitle,commentContent,commentDate "
				+ "from moviecommentlist "
				+ "where userID = ? limit ?,5";
		List<Comment> commentList  = queryList(sql, userID,page);
		if(commentList.size()!=0){
			Iterator<Comment> it = commentList.iterator();
			String sql1 = "select movieID from moviecommentlist where commentID = ?";
			while(it.hasNext()){
				Comment comment  = it.next();
				Movie movie = new Movie();
				movie.setMovieID(queryValue(sql1, comment.getCommentID()));
				comment.setMovie(movie);
			}
		}
		return commentList;
	}

	public Integer getTotleComment(Integer userID){
		String sql = "select count(*) from moviecommentlist where userID = ?";
		long low = queryValue(sql, userID);
		int i = (int)low;
		return i;
	}
	
	@Override
	public List<Comment> getCommentByMovie(Integer movieID) {
		String sql = "select commentID,commentTitle,commentContent,commentDate,ifSpoiler "
				+ "from moviecommentlist "
				+ "where movieID = ? "
				+ "order by commentID desc";
		
		return queryList(sql, movieID);
	}

	@Override
	public boolean saveMovieComment(Connection conn,Comment comment) throws SQLException {
		String sql = "insert into moviecommentlist(commentTitle,commentContent,commentDate,userID,movieID,ifSpoiler) "
				+ "values(?,?,now(),?,?,?)";
		Object[] obj ={comment.getCommentTitle(),
				comment.getCommentContent(),
				comment.getUser().getUserID(),
				comment.getMovie().getMovieID(),
				comment.getIfSpoiler()}; 
		long low = update(conn,sql, obj);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteCommentByID(Connection conn,Integer commentID) throws SQLException {
		String sql = "delete from moviecommentlist where commentID = ?";
		long low = update(conn,sql, commentID);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public List<Integer> getCommentIDByMovie(Integer movieID) {
		return null;
	}

	@Override
	public boolean deleteCommentByMovie(Connection conn,Integer movieID) throws SQLException {
		String sql = "delete from moviecommentlist where movieID = ?";
		long low = update(conn,sql, movieID);
		if(low!=0)
			return true;
		else
			return false;
	}
	
	public Comment getCommentByID(Integer commentID){
		String sql = "select commentID,commentTitle,commentDate,commentContent "
				+ "from moviecommentlist "
				+ "where commentID = ?";
		String sql1 = "select userID "
				+ "from moviecommentlist "
				+ "where commentID = ?";
		Comment comment = queryBean(sql, commentID);
		Integer userID = queryValue(sql1, commentID);
		User user = new User();
		user.setUserID(userID);
		comment.setUser(user);
		return comment;
		
	}

	@Override
	public List<Comment> getCommentByDate(String date) {
		String sql = "select commentID,commentTitle,commentDate,commentContent "
				+ "from moviecommentlist "
				+ "where commentDate = ?";
		List<Comment> comments  = queryList(sql, date);
		String sql1 = "select userID from moviecommentlist where commentID = ?";
		Iterator<Comment> cIt = comments.iterator();
		while(cIt.hasNext()){
			Comment comment = cIt.next();
			User user = new User();
			user.setUserID(queryValue(sql1,comment.getCommentID()));
			comment.setUser(user);
		}
		return comments;
	}

	@Override
	public boolean deleteCommentByMovie1(Connection conn,Integer movie) throws SQLException {
		String sql = "delete from moviecommentlist where movieID = ?";
		long low = update(conn, sql, movie);
		if(low!=0){
			return true;
		}else{
			return false;
		}
	}
}
