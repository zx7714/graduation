package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IFilmmakerJobDao;
import com.zx.javabean.FilmmakerJob;

public class FilmmakerJobDao extends DAO<FilmmakerJob> implements IFilmmakerJobDao {

	@Override
	public boolean saveFilmmakerJob(Connection conn,Integer filmmakerID, Integer jobID) throws SQLException {
		String sql = "insert into filmmakerJoblist(filmmakerID,jobID) values(?,?)";
		long low = update(conn,sql, filmmakerID,jobID);
		if(low!=0)
			return true;
		else 
			return false;
	}

	@Override
	public List<FilmmakerJob> getJobIDByFilmmaker(Integer filmmakerID) {
		String sql = "select filmmakerID,jobID from filmmakerjoblist where filmmakerID = ?";
		return queryList(sql, filmmakerID);
	}
	@Override
	public boolean deleteFilmmakerJob(Connection conn,Integer filmmakerID) throws SQLException {
		String sql = "delete from filmmakerjoblist where filmmakerID = ?";
		long low = update(conn,sql, filmmakerID);
		if(low!=0)
			return true;
		else 
			return false;
	}

}
