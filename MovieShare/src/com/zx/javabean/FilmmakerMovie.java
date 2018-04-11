package com.zx.javabean;

import java.util.List;

public class FilmmakerMovie {
	private Integer filmmakerID;
	private Integer movieID;
	private String filmmakerJob;
	public Integer getFilmmakerID() {
		return filmmakerID;
	}
	public void setFilmmakerID(Integer filmmakerID) {
		this.filmmakerID = filmmakerID;
	}
	public Integer getMovieID() {
		return movieID;
	}
	public void setMovieID(Integer movieID) {
		this.movieID = movieID;
	}
	public String getFilmmakerJob() {
		return filmmakerJob;
	}
	public void setFilmmakerJob(String filmmakerJob) {
		this.filmmakerJob = filmmakerJob;
	}
	
	@Override
	public boolean equals(Object obj){
		if(obj instanceof FilmmakerMovie){
			FilmmakerMovie filmmakerMovie = (FilmmakerMovie)obj;
			return this.filmmakerID.equals(filmmakerMovie.filmmakerID)&&this.movieID.equals(filmmakerMovie.movieID);
		}
		
		return false;
	}

	
	@Override
	public String toString() {
		return "FilmmakerMovie [filmmakerID=" + filmmakerID + ", movieID=" + movieID + ", filmmakerJob=" + filmmakerJob
				+ "]";
	}
}
