package com.zx.javabean;

import java.util.Date;
import java.util.List;

public class Filmmaker {
  
	private Integer filmmakerID;
    private String filmmakerName;
    private String filmmakerSex;
    private String filmmakerPhoto;
    private String filmmakerDescribe;
    private Date filmmakerBirth;
    private String filmmakerBirthPlace;
    private List<Movie> movieList;
    private List<Job> jobList;
    private String filmmakerJob;
    
    
    public Filmmaker(){
    	super();
    }
    
	public Filmmaker(String filmmakerName, String filmmakerSex, String filmmakerPhoto, String filmmakerDescribe,
			Date filmmakerBirth, String filmmakerBirthPlace) {
		super();
		this.filmmakerName = filmmakerName;
		this.filmmakerSex = filmmakerSex;
		this.filmmakerPhoto = filmmakerPhoto;
		this.filmmakerDescribe = filmmakerDescribe;
		this.filmmakerBirth = filmmakerBirth;
		this.filmmakerBirthPlace = filmmakerBirthPlace;
	}
	public Integer getFilmmakerID() {
		return filmmakerID;
	}
	public void setFilmmakerID(Integer filmmakerID) {
		this.filmmakerID = filmmakerID;
	}
	public String getFilmmakerName() {
		return filmmakerName;
	}
	public void setFilmmakerName(String filmmakerName) {
		this.filmmakerName = filmmakerName;
	}
	public String getFilmmakerSex() {
		return filmmakerSex;
	}
	public void setFilmmakerSex(String filmmakerSex) {
		this.filmmakerSex = filmmakerSex;
	}
	public String getFilmmakerPhoto() {
		return filmmakerPhoto;
	}
	public void setFilmmakerPhoto(String filmmakerPhoto) {
		this.filmmakerPhoto = filmmakerPhoto;
	}
	public Date getFilmmakerBirth() {
		return filmmakerBirth;
	}
	public void setFilmmakerBirth(Date filmmakerBirth) {
		this.filmmakerBirth = filmmakerBirth;
	}
	public List<Movie> getMovieList() {
		return movieList;
	}
	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}
	public List<Job> getJobList() {
		return jobList;
	}
	public void setJobList(List<Job> jobList) {
		this.jobList = jobList;
	}
	
	  public String getFilmmakerDescribe() {
		return filmmakerDescribe;
	}
	public void setFilmmakerDescribe(String filmmakerDescribe) {
		this.filmmakerDescribe = filmmakerDescribe;
	}
	public String getFilmmakerBirthPlace() {
		return filmmakerBirthPlace;
	}
	public void setFilmmakerBirthPlace(String filmmakerBirthPlace) {
		this.filmmakerBirthPlace = filmmakerBirthPlace;
	}
	
	public String getFilmmakerJob() {
		return filmmakerJob;
	}

	public void setFilmmakerJob(String filmmakerJob) {
		this.filmmakerJob = filmmakerJob;
	}

	@Override
	public String toString() {
		return "Filmmaker [filmmakerID=" + filmmakerID + ", filmmakerName=" + filmmakerName + ", filmmakerSex="
				+ filmmakerSex + ", filmmakerPhoto=" + filmmakerPhoto + ", filmmakerDescribe=" + filmmakerDescribe
				+ ", filmmakerBirth=" + filmmakerBirth + ", filmmakerBirthPlace=" + filmmakerBirthPlace
				+ ", filmmakerJob=" + filmmakerJob + "]\n";
	}
	

}
