package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IMovieTypeDao;
import com.zx.javabean.MovieType;


public class MovieTypeDao extends DAO<MovieType> implements IMovieTypeDao {

	@Override
	public boolean saveMovieType(Connection conn,Integer movieID, Integer typeID) throws SQLException {
		String sql = "insert into movietypelist(movieID,typeID) values(?,?)";
		long low = update(conn,sql, movieID,typeID);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public List<MovieType> getMovieTypeByMovie(Integer movieID) {
		String sql = "select typeID from movietypelist where movieID = ?";
		return queryList(sql, movieID);
	}

	@Override
	public boolean deleteMovieType(Connection conn,Integer movieID) throws SQLException {
		String sql = "delete from movietypelist where movieID = ?";
		long low = update(conn,sql, movieID);
		if(low != 0)
			return true;
		else
			return false;
	}

	

}
