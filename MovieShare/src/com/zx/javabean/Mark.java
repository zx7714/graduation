package com.zx.javabean;

import java.util.Date;

public class Mark {
	private Integer markID;
	private float markScore;
	private String markContent;
	private Date markDate;
	private User user;
	private Movie movie;
	
	
	public Mark(){}
	
	public Mark(float markScore, String markContent, User user, Movie movie) {
		super();
		this.markScore = markScore;
		this.markContent = markContent;
		this.user = user;
		this.movie = movie;
	}
	
	public Integer getMarkID() {
		return markID;
	}
	public void setMarkID(Integer markID) {
		this.markID = markID;
	}
	public float getMarkScore() {
		return markScore;
	}
	public void setMarkScore(float markScore) {
		this.markScore = markScore;
	}
	public String getMarkContent() {
		return markContent;
	}
	public void setMarkContent(String markContent) {
		this.markContent = markContent;
	}
	public Date getMarkDate() {
		return markDate;
	}
	public void setMarkDate(Date markDate) {
		this.markDate = markDate;
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
	@Override
	public String toString() {
		return "Mark [markID=" + markID + ", markScore=" + markScore + ", markContent=" + markContent + ", markDate="
				+ markDate + ", user=" + user + "]";
	}

  
	
}
