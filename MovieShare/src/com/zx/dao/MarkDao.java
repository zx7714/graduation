package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IMarkDao;
import com.zx.javabean.Mark;


public class MarkDao extends DAO<Mark> implements IMarkDao {

	@Override
	public boolean saveMovieMark(Connection conn,Mark mark) throws SQLException {
		String sql2 = "INSERT INTO moviemarklist(movieID,userID,markScore,markContent,markDate) "
					+"VALUES(?,?,?,?,now()) "
					+"ON DUPLICATE KEY "
					+"UPDATE markContent=?,markDate=now(),markScore=?";	
		Object[] obj= {mark.getMovie().getMovieID(),
				mark.getUser().getUserID(),
				mark.getMarkScore(),
				mark.getMarkContent(),
				mark.getMarkContent(),
				mark.getMarkScore()};
		long low = update(conn,sql2,obj);
		if(low!=0)
			return true;
		else
			return false;
	}
	@Override
	public List<Mark> getMarkByMovie(Integer movieID) {
		String sql = "select  markID,markScore,markContent,markDate,u.userName "
				+ "from moviemarklist m,userinformationlist u "
				+ "where m.userID = u.userID "
				+ "and movieID = ? "
				+ "order by markID desc";
		List<Mark> markList = queryList(sql, movieID);
		//Iterator<Mark> it = markList.iterator();
		return markList;
	}
	@Override
	public boolean deleteMarkByMovie(Connection conn,Integer movieID) throws SQLException {
		String sql = "delete from moviemarklist where movieID = ?";
		long low = update(conn,sql, movieID);
		if(low!=0)
			return true;
		else 
			return false;
	}

}
