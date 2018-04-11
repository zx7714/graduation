package com.zx.javabean;

public class FilmmakerJob {
	private Integer filmmakerID;
	private Integer jobID;
	public Integer getFilmmakerID() {
		return filmmakerID;
	}
	public void setFilmmakerID(Integer filmmakerID) {
		this.filmmakerID = filmmakerID;
	}
	public Integer getJobID() {
		return jobID;
	}
	public void setJobID(Integer jobID) {
		this.jobID = jobID;
	}
	@Override
	public String toString() {
		return "FilmmakerJob [filmmakerID=" + filmmakerID + ", jobID=" + jobID + "]";
	}
	
}
