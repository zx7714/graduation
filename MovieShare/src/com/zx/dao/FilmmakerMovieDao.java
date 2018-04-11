package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IFilmmakerMovieDao;
import com.zx.javabean.FilmmakerMovie;

public class FilmmakerMovieDao  extends DAO<FilmmakerMovie> implements IFilmmakerMovieDao {

	@Override
	public List<FilmmakerMovie> getMovieIDByFilmmaker(Integer filmmakerID) {
		String sql = "select filmmakerID,movieID,filmmakerJob from filmmakermovielist"
				+ " where filmmakerID = ?";
		return queryList(sql, filmmakerID);
	}

	@Override
	public boolean deleteFilmmakerMovieByFilmmaker(Connection conn,Integer filmmakerID) throws SQLException {
		String sql = "delete from filmmakermovielist where filmmakerID = ?";
		long low = update(conn,sql, filmmakerID);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public boolean saveFilmmakerMovie(Connection conn,Integer filmmakerID, Integer movieID, String filmmakerJob) throws SQLException {
		String sql = "insert into filmmakermovielist(filmmakerID,movieID,filmmakerJob) "
				+ "value(?,?,?)";
		long low = update(conn,sql, filmmakerID,movieID,filmmakerJob);
		if(low!=0)
			return true;
		else
			return false;
	}

	public List<FilmmakerMovie> getFilmmakerByFilmmaker(Integer filmmakerID){
		
		String sql = "select a.filmmakerID,a.movieID from filmmakermovielist a,filmmakermovielist b where a.movieID = b.movieID "
				+ "and b.filmmakerID = ? "
				+ "and a.filmmakerID != ?";
		
		return queryList(sql, filmmakerID,filmmakerID);
	}
	@Override
	public List<FilmmakerMovie> getFilmmakerIDByMovie(Integer movieID) {
		String sql = "select filmmakerID,movieID,filmmakerJob "
				+ "from filmmakermovielist "
				+ "where movieID = ?";
		return queryList(sql, movieID);
	}
	
	@Override
	public boolean deleteFilmmakerMovieByMoive(Connection conn,Integer movieID) throws SQLException {
		String sql = "delete from filmmakermovielist where movieID = ?";
		long low = update(conn,sql, movieID);
		if(low!=0)
			return true;
		else 
			return false;
		
	}
}
