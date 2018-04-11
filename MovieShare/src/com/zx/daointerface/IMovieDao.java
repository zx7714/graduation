package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.Movie;

public interface IMovieDao {
	public Movie getMovieByID(Integer movieID);
	public List<Movie> getMovieByKeyword(String keyword);
	public Movie getMovieByName(String movieName);
	public List<Movie> getMovieByDate(String startDate,String endDate,int beginNum);
	public List<Movie> getMovieByFilmmaker(Integer filmmakerID);
	public Movie getMovieByComment(Integer commentID);
	public List<Movie> getMvoieBySocre();
	public List<Movie> getMovieAndFilmmakerMovieByKeyword(String keyword);
	public List<Movie> getMovieByType(Integer typeID);
	public int getTotalPages(String startT,String endT);
	boolean deleteMovieByID(Connection conn, Integer movieID) throws SQLException;
	boolean updateMovie(Connection conn, Movie movie) throws SQLException;
	boolean saveMovie(Connection conn, Movie movie) throws SQLException;
}
