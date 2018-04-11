package com.zx.javabean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

public class Movie implements Comparable<Movie>,Serializable{
	private Integer movieID;
	private String movieName;
	private String movieCover;
	private String movieDescribe;
	private Integer movieLong;
	private Date movieDate;
	private String movieLanguage;
	private List<Mark> markList;
	private List<Comment> commentList;
	private List<Filmmaker> filmmakerList;
	private List<TheType> typeList;
	private Integer movieScoreNum;
	private float movieEveryScore;
	private CountMark countMark;
	
	public Movie(){}
	
	public Movie(String movieName, String movieCover, String movieDescribe, Integer movieLong, Date movieDate,
			String movieLanguage, List<Filmmaker> filmmakerList, List<TheType> typeList) {
		super();
		this.movieName = movieName;
		this.movieCover = movieCover;
		this.movieDescribe = movieDescribe;
		this.movieLong = movieLong;
		this.movieDate = movieDate;
		this.movieLanguage = movieLanguage;
		this.filmmakerList = filmmakerList;
		this.typeList = typeList;
	}
	


	
	public Integer getMovieScoreNum() {
		return movieScoreNum;
	}

	public void setMovieScoreNum(Integer movieScoreNum) {
		this.movieScoreNum = movieScoreNum;
	}

	public float getMovieEveryScore() {
		return movieEveryScore;
	}

	public void setMovieEveryScore(float movieEveryScore) {
		BigDecimal b = new BigDecimal(movieEveryScore);
		float f1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();
		this.movieEveryScore = f1;
	}


	public Integer getMovieID() {
		return movieID;
	}
	public void setMovieID(Integer movieID) {
		this.movieID = movieID;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieCover() {
		return movieCover;
	}
	public void setMovieCover(String movieCover) {
		this.movieCover = movieCover;
	}
	public String getMovieDescribe() {
		return movieDescribe;
	}
	public void setMovieDescribe(String movieDescribe) {
		this.movieDescribe = movieDescribe;
	}
	
	public Integer getMovieLong() {
		return movieLong;
	}
	public void setMovieLong(Integer movieLong) {
		this.movieLong = movieLong;
	}
	public Date getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}
	public String getMovieLanguage() {
		return movieLanguage;
	}
	public void setMovieLanguage(String movieLanguage) {
		this.movieLanguage = movieLanguage;
	}
	public List<Mark> getMarkList() {
		return markList;
	}
	public void setMarkList(List<Mark> markList) {
		this.markList = markList;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public List<Filmmaker> getFilmmakerList() {
		return filmmakerList;
	}
	public void setFilmmakerList(List<Filmmaker> filmmakerList) {
		this.filmmakerList = filmmakerList;
	}
	public List<TheType> getTypeList() {
		return typeList;
	}
	public void setTypeList(List<TheType> typeList) {
		this.typeList = typeList;
	}
	public CountMark getCountMark() {
		return countMark;
	}

	public void setCountMark(CountMark countMark) {
		this.countMark = countMark;
	}

	@Override
	public String toString() {
		return "Movie [movieID=" + movieID + ", movieName=" + movieName + ", movieCover=" + movieCover
				+ ", movieDescribe=" + movieDescribe + ", movieLong=" + movieLong + ", movieDate=" + movieDate
				+ ", movieLanguage=" + "movieLanguage,"
				+ "\nfilmmakerList=" + filmmakerList;
	}

	@Override
	public int compareTo(Movie m) {
	
		if(this.markList.size()>m.markList.size()){
	    	 return -1;
	     }else if(this.markList.size()<m.markList.size()){
	    	 return 1;
	     }
		return 0;
	}
	@Override
	public boolean equals(Object o){
		Movie m = null;
		if(o instanceof Movie){
			m = (Movie)o; 
		}
		return (movieID.equals(m.movieID));
	}
	@Override
	public int hashCode(){
		return movieID.hashCode();
	}
}
