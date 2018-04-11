package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.MovieType;


public interface IMovieTypeDao {
	public List<MovieType> getMovieTypeByMovie(Integer movieID);
	boolean saveMovieType(Connection conn, Integer movieID, Integer typeID) throws SQLException;
	boolean deleteMovieType(Connection conn, Integer movieID) throws SQLException;
}
