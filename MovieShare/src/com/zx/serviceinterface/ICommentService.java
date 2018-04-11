package com.zx.serviceinterface;

import java.util.List;

import com.zx.javabean.Comment;


public interface ICommentService {
	public boolean commentMovie(Comment comment);
	public Comment checkComment(Integer commentID);
	public List<Comment> getCommentByDate();
	public boolean deleteMovieComment(Integer commentID);
}
