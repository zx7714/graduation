package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.FilmmakerMovie;

public interface IFilmmakerMovieDao {
	public List<FilmmakerMovie> getMovieIDByFilmmaker(Integer filmmakerID);
	public List<FilmmakerMovie> getFilmmakerIDByMovie(Integer filmmakerID);
	boolean deleteFilmmakerMovieByFilmmaker(Connection conn, Integer filmmakerID) throws SQLException;
	boolean saveFilmmakerMovie(Connection conn, Integer filmmakerID, Integer movieID, String filmmakerJob) throws SQLException;
	boolean deleteFilmmakerMovieByMoive(Connection conn, Integer movieID) throws SQLException;
}

