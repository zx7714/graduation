package com.zx.service;

import java.sql.Connection;

import com.zx.dao.MarkDao;
import com.zx.dao.MovieDao;
import com.zx.daointerface.IMarkDao;
import com.zx.daointerface.IMovieDao;
import com.zx.javabean.Mark;
import com.zx.serviceinterface.IMarkService;
import com.zx.utils.JdbcUtils;

public class MarkService implements IMarkService {
	private MarkDao markDao = new MarkDao();
	private IMovieDao movieDao = new MovieDao();
	@Override
	public boolean markMovie(Mark mark) {
		Connection conn = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			markDao.saveMovieMark(conn, mark);
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return false;
		}
		return true;
	}

}
