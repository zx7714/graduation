package com.zx.action;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.ApplicationAware;
import com.zx.javabean.Comment;
import com.zx.javabean.Movie;
import com.zx.javabean.User;
import com.zx.service.CommentService;
import com.zx.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class CommentAction implements ApplicationAware {
	private CommentService commentService = new CommentService();
	private UserService userService = new UserService();
	private String userID;
	private String movieID;
	private String commentID;
	private String commentTitle;
	private String commentContent;
	private String ifSpoiler;
	private String page;
	private JSONArray result;
	
	
	public String getCommentID() {
		return commentID;
	}
	public void setCommentID(String commentID) {
		this.commentID = commentID;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getIfSpoiler() {
		return ifSpoiler;
	}
	public void setIfSpoiler(String ifSpoiler) {
		this.ifSpoiler = ifSpoiler;
	}
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
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public JSONArray getResult() {
		return result;
	}
	public void setResult(JSONArray result) {
		this.result = result;
	}
	
	public String execute() throws Exception{
		return "success";
	}
	
	public String commentMovie() throws Exception{
		
		User user = new User();
		Movie movie = new Movie();
		try {
			user.setUserID(Integer.parseInt(userID));
			movie.setMovieID(Integer.parseInt(movieID));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Comment comment = null;
		System.out.println(ifSpoiler);
		if("yes".equals(ifSpoiler)){
			comment = new Comment(null,commentTitle,commentContent,0,
					user, movie);
		}else{
			comment = new Comment(null,commentTitle,commentContent,1,
					user, movie);
		}		
		boolean commentRes = commentService.commentMovie(comment);
		result = new JSONArray();
		JSONObject js = new JSONObject();
		if(commentRes){
			js.put("res", "success");
		}else{
			js.put("res", "failed");
		}
		result.add(js);
		application.put("commentRes", commentRes);
		return "success";
	}
	
	//影评查看
	public String checkComment() throws Exception{
		
		try {
			Integer cId = Integer.parseInt(commentID);
			Comment comment = commentService.checkComment(cId);
			application.put("comment", comment);	
		} catch (Exception e) {
			e.printStackTrace();
			return "erro";
		}
		return "success";
	}
	
	public String bestComment()throws Exception{
		List<Comment> comments = commentService.getCommentByDate();
		application.put("acomments", comments);
		return "success";
	}
	
	//删除用户的影评
	public String deleteMovieComment()throws Exception{
		result = new JSONArray();
		JSONObject js = new JSONObject();
		try {
			boolean deleteComment = commentService.deleteMovieComment(Integer.parseInt(this.commentID));
			if(deleteComment){
				
				js.put("res", "success");
				result.add(js);
			}else{
				js.put("res", "failed");
				result.add(js);
			}
			
		} catch (Exception e) {
			js.put("res", "failed");
			result.add(js);
			e.printStackTrace();
		}
		return "success";
	}
	private Map<String,Object> application;
	@Override
	public void setApplication(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.application=arg0;
		
	}
}
