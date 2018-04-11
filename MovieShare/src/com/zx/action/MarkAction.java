package com.zx.action;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import com.zx.javabean.Mark;
import com.zx.javabean.Movie;
import com.zx.javabean.User;
import com.zx.service.MarkService;
import com.zx.serviceinterface.IMarkService;

import net.sf.json.JSONObject;

public class MarkAction implements ApplicationAware{
	private String markID;
	private String markScore;
	private String markContent;
	private String userID;
	private String movieID;
	private JSONObject result;
	
	private IMarkService markService = new MarkService();
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}
	public String getMarkID() {
		return markID;
	}
	public void setMarkID(String markID) {
		this.markID = markID;
	}

	public String getMarkScore() {
		return markScore;
	}
	public void setMarkScore(String markScore) {
		this.markScore = markScore;
	}
	public String getMarkContent() {
		return markContent;
	}
	public void setMarkContent(String markContent) {
		this.markContent = markContent;
	}
	public JSONObject getResult() {
		return result;
	}
	public void setResult(JSONObject result) {
		this.result = result;
	}
	public String markMovie() throws Exception{
		User user;
		Movie movie;
		result = new JSONObject();
		float score = 0;
		try {
			user = new User();
			user.setUserID(Integer.parseInt(this.userID.trim()));
			movie = new Movie();
			movie.setMovieID(Integer.parseInt(this.movieID));
			
			switch (markScore) {
				case "极差":score=2.0f;break;
				case "很差":score=4.0f;break;
				case "还行":score=6.0f;break;
				case "推荐":score=8.0f;break;
				case "力推":score=10.0f;break;
				default:score=2.0f;break;
			}
			Mark mark = new Mark(score, this.markContent,user,movie);
			boolean b = markService.markMovie(mark);	
			if(b) 
				result.put("res", "success");
			else
				result.put("res", "failed");
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("res", "erro");
		}
		return "success";
	}
	@SuppressWarnings("unused")
	private Map<String,Object> application;
	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
	}
}
