package com.zx.dao;

import com.zx.javabean.CountMark;

public class CountMarkDao extends DAO<CountMark> {
	public CountMark getCountMark(Integer movieID){
		String sql =
				"select one,two,three,four,five,total "
				+ "from markinformation "
				+ "where movieID = ?";
		return queryBean(sql,movieID);
	}
}
