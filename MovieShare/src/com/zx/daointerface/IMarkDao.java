package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.Mark;

public interface IMarkDao {
	public List<Mark> getMarkByMovie(Integer movieID);
	boolean saveMovieMark(Connection conn, Mark mark) throws SQLException;
	boolean deleteMarkByMovie(Connection conn, Integer movieID) throws SQLException;
}
