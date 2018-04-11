package com.zx.javabean;

import java.util.Date;
import java.util.List;

public class Comment implements Comparable<Comment>{
	private Integer commentID;
	private String commentTitle;
	private String commentContent;
	private Date commentDate;
	private Integer ifSpoiler;
	private User user;
	private Movie movie;
	private List<Reply> replyList;
	public Comment(){}
	
	
	
	public Comment(Integer commentID, String commentTitle, String commentContent, Integer ifSpoiler,
			User user, Movie movie) {
		super();
		this.commentID = commentID;
		this.commentTitle = commentTitle;
		this.commentContent = commentContent;
		this.ifSpoiler = ifSpoiler;
		this.user = user;
		this.movie = movie;
	}


	
	public List<Reply> getReplyList() {
		return replyList;
	}



	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}



	public Integer getCommentID() {
		return commentID;
	}
	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Integer getIfSpoiler() {
		return ifSpoiler;
	}
	public void setIfSpoiler(Integer ifSpoiler) {
		this.ifSpoiler = ifSpoiler;
	}

	

	@Override
	public String toString() {
		return "Comment [commentID=" + commentID + ", commentTitle=" + commentTitle + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate + ", ifSpoiler=" + ifSpoiler + ", user=" + user
				+ ", movie=" + movie + ", replyList=" + replyList + "]";
	}



	@Override
	public int compareTo(Comment o) {
		if(this.replyList.size()<o.replyList.size())
			return 1;
		else if(this.replyList.size()>o.replyList.size())
			return -1;
		return 0;
	}

	

	
	
	
}
