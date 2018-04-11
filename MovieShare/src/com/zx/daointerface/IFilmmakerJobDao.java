package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.FilmmakerJob;

public interface IFilmmakerJobDao {
	public List<FilmmakerJob> getJobIDByFilmmaker(Integer filmmakerID);
	
	boolean saveFilmmakerJob(Connection conn, Integer filmmakerID, Integer jobID) throws SQLException;

	boolean deleteFilmmakerJob(Connection conn, Integer filmmakerID) throws SQLException;
}
