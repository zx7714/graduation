package com.zx.javabean;

public class MovieType {
	private Integer typeID;
	private Integer movieID;
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public Integer getMovieID() {
		return movieID;
	}
	public void setMovieID(Integer movieID) {
		this.movieID = movieID;
	}
	@Override
	public String toString() {
		return "MovieType [typeID=" + typeID + ", movieID=" + movieID + "]";
	}
	
}
