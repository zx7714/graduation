package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.Filmmaker;

public interface IFilmmakerDao {
	public Filmmaker getFilmmakerByID(Integer filmmakerID);
	public List<Filmmaker> getFilmmakerByKeyword(String keyword);
	//public Integer getFilmmakerByName(String filmmakerName);

	public List<Filmmaker> getFilmmakerByMovie(Integer movieID);
	boolean saveFilmmaker(Connection conn, Filmmaker filmmaker) throws SQLException;
	boolean deleteFilmmakerByID(Connection conn, Integer filmmakerID) throws SQLException;
	boolean updateFilmmaker(Connection conn, Filmmaker filmmaker) throws SQLException;
	Integer getFilmmakerByName(String filmmakerName);
}
