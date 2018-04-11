package com.zx.javabean;

import java.util.List;

public class TheType {
	private Integer typeID;
	private String typeName;
	private List<Movie> movieList;
	
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<Movie> getMovieList() {
		return movieList;
	}
	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}
	@Override
	public String toString() {
		return "MovieType [typeID=" + typeID + ", typeName=" + typeName + "]";
	}
	
}
