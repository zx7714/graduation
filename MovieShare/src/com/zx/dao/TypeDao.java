package com.zx.dao;

import java.util.List;

import com.zx.daointerface.ITypeDao;
import com.zx.javabean.TheType;

public class TypeDao extends DAO<TheType> implements ITypeDao {

	@Override
	public List<TheType> getType() {
		String sql = "select typeID,typeName from typeinformationlist";
		return queryList(sql);
	}

	@Override
	public TheType getTypeByID(Integer typeID) {
		String sql = "select typeID,typeName from typeinformationlist where typeID = ?";
		return queryBean(sql, typeID);
	}

	@Override
	public List<TheType> getTypeByMovie(Integer movieID) {
		String sql = "select T.typeID,T.typeName "
				+ "from typeinformationlist T,movietypelist MT "
				+ "where T.typeID = MT.typeID "
				+ "and MT.movieID = ?";
		return queryList(sql, movieID);
	}

}
