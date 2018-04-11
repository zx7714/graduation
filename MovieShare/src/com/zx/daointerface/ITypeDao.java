package com.zx.daointerface;

import java.util.List;

import com.zx.javabean.TheType;

public interface ITypeDao {
	public List<TheType> getType();
	public TheType getTypeByID(Integer typeID);
	public List<TheType> getTypeByMovie(Integer movieID);
	
}
