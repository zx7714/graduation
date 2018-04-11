package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IFilmmakerDao;
import com.zx.javabean.Filmmaker;

public class FilmmakerDao extends DAO<Filmmaker> implements IFilmmakerDao {
	@Override
	public Filmmaker getFilmmakerByID(Integer filmmakerID) {
		String sql = "select filmmakerID,filmmakerName,filmmakerSex,filmmakerPhoto"
				+ ",filmmakerDescribe,filmmakerBirth,filmmakerBirthPlace"
				+ " from filmmakerinformationlist"
				+ " where filmmakerID = ?";
		return queryBean(sql, filmmakerID);
	}

	@Override
	public List<Filmmaker> getFilmmakerByKeyword(String keyword) {
		String sql = "select filmmakerID,filmmakerName,filmmakerSex,filmmakerPhoto,"
				+ "filmmakerDescribe,filmmakerBirth,filmmakerBirthPlace"
				+ " from filmmakerinformationlist"
				+ " where filmmakerName like ?";
		return queryList(sql, "%"+keyword+"%");
	}

	@Override
	public Integer getFilmmakerByName(String filmmakerName) {
		String sql = "select filmmakerID "
				+ "from filmmakerinformationlist "
				+ "where filmmakerName = ?";
		return queryValue(sql, filmmakerName);
		
	}

	@Override
	public boolean saveFilmmaker(Connection conn,Filmmaker filmmaker) throws SQLException {
		String sql = "insert into filmmakerinformationlist(filmmakerName,filmmakerSex,filmmakerPhoto"
				+ ",filmmakerDescribe,filmmakerBirth,filmmakerBirthPlace)"
				+ " values(?,?,?,?,?,?)";
		long low  = update(conn,sql, filmmaker.getFilmmakerName(),filmmaker.getFilmmakerSex(),filmmaker.getFilmmakerPhoto(),
				filmmaker.getFilmmakerDescribe(),filmmaker.getFilmmakerBirth(),filmmaker.getFilmmakerBirthPlace());
		if(low!=0)
			return true;
		else 
			return false;
	}

	@Override
	public boolean deleteFilmmakerByID(Connection conn,Integer filmmakerID) throws SQLException {
		String sql = "delete from filmmakerinformationlist where filmmakerID =?";
		long low = update(conn,sql, filmmakerID);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateFilmmaker(Connection conn,Filmmaker filmmaker) throws SQLException {
		String sql = "update filmmakerinformationlist set filmmakerName = ?,filmmakerSex = ?,filmmakerPhoto = ?"
				+ ",filmmakerDescribe= ?,filmmakerBirth = ?,filmmakerBirthPlace = ?"
				+ " where filmmakerID = ?";
		long low = update(conn,sql, filmmaker.getFilmmakerName(),filmmaker.getFilmmakerSex(),filmmaker.getFilmmakerPhoto(),
				filmmaker.getFilmmakerDescribe(),filmmaker.getFilmmakerBirth(),filmmaker.getFilmmakerBirthPlace(),filmmaker.getFilmmakerID());
		if(low!=0)
			return true;
		else 
			return false;
	}
	
	public List<Filmmaker> getFilmmakerByMovie(Integer movieID){
		String sql = "select F.filmmakerID,F.filmmakerName,F.filmmakerPhoto,FM.filmmakerJob "
				+ "from filmmakerinformationlist F,filmmakermovielist FM "
				+ "where F.filmmakerID = FM.filmmakerID "
				+ "and FM.movieID = ?";
		return queryList(sql, movieID);
	}
	
	
	public List<Filmmaker> getConnectFilmmakerByFilmmaker(Integer filmmakerID){
		
	
		String sq1 = "select filmmakerID,filmmakerName "
				+ "from filmmakerinformationlist "
				+ "where filmmakerID = any(select filmmakerID "
				+ 					"from filmmakermovielist "
				+ 					"where movieID = any(select movieID "
				+ 									"from filmmakermovielist "
				+ 									"where filmmakerID = ?)) "
				+ "and filmmakerID != ?";
		
		return queryList(sq1,filmmakerID,filmmakerID);
	}
}
