package com.zx.javabean;

import java.util.List;

public class Search {
	private List<Movie> movieList;
	private List<Filmmaker> filmmakerList;
	
	
	
	public List<Movie> getMovieList() {
		return movieList;
	}
	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}
	public List<Filmmaker> getFilmmakerList() {
		return filmmakerList;
	}
	public void setFilmmakerList(List<Filmmaker> filmmakerList) {
		this.filmmakerList = filmmakerList;
	}
	@Override
	public String toString() {
		return "Search [movieList=" + movieList + ", filmmakerList=" + filmmakerList + "]";
	}
	
	
}
