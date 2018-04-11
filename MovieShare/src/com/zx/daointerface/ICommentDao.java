package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.Comment;

public interface ICommentDao {
	public List<Comment> getCommentByUser(Integer userID,Integer page);
	public List<Comment> getCommentByMovie(Integer movieID);
	public List<Integer> getCommentIDByMovie(Integer movieID);
	public List<Comment> getCommentByDate(String date);
	boolean deleteCommentByMovie(Connection conn, Integer movieID) throws SQLException;
	boolean saveMovieComment(Connection conn, Comment comment) throws SQLException;
	boolean deleteCommentByID(Connection conn, Integer commentID) throws SQLException;
	boolean deleteCommentByMovie1(Connection conn, Integer movie) throws SQLException;

} 
