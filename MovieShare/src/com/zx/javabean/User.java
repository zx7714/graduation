package com.zx.javabean;

import java.util.List;

public class User {
	private Integer userID;
	private String userName;
	private String userPassword;
	private String userEmail;
	private List<Comment> comment;
	private List<Reply> reply;
	private List<Mark> mark;
	

	
	public User(String userName, String userPassword, String userEmail) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	public List<Mark> getMark() {
		return mark;
	}
	public void setMark(List<Mark> mark) {
		this.mark = mark;
	}
	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", userPassword=" + userPassword + ", userEmail="
				+ userEmail + ", comment=" + comment + "]";
	}
	
}
