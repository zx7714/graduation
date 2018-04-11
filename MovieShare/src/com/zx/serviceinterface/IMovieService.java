package com.zx.serviceinterface;

import java.util.List;

import com.zx.javabean.Job;
import com.zx.javabean.Movie;
import com.zx.javabean.TheType;
import com.zx.utils.MovieAddType;
import com.zx.utils.MovieResetType;

public interface IMovieService {
	public MovieAddType addMovie(Movie movie);
	public List<TheType> getType();
	public List<Job> getJob();
	public List<Movie> getMovieByDate(String startDate,String endDate,int beginNum);
	public Movie checkMovie(Integer movieID);
	public List<Movie> getLastMovies(Integer filmmakerID);
	public List<Movie> getMvpMovies();
	public Movie getMovie(Integer movieID);
	public MovieResetType resetMovie(Movie movie);
	public boolean deleteMovie(Integer movieID);
	public List<Movie> recommendMovie(Integer typeID);
}
