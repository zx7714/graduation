package com.zx.action;


import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;

import com.zx.javabean.Comment;
import com.zx.javabean.Reply;
import com.zx.javabean.User;
import com.zx.service.ReplyService;

import net.sf.json.JSONObject;

public class ReplyAction implements ApplicationAware {
	
	private String commentID;
	private String userID;
	private String replyContent;
	private String replyWho;
	private JSONObject result;
	
	
	
	public String getCommentID() {
		return commentID;
	}
	public void setCommentID(String commentID) {
		this.commentID = commentID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	public String getReplyWho() {
		return replyWho;
	}
	public void setReplyWho(String replyWho) {
		this.replyWho = replyWho;
	}
	public JSONObject getResult() {
		return result;
	}
	public void setResult(JSONObject result) {
		this.result = result;
	}
	private ReplyService replyService = new ReplyService();
	
	public String replyComment() throws Exception{
		result = new JSONObject();
		try {
			Integer uId = Integer.parseInt(userID);
			Integer cId = Integer.parseInt(commentID);
			Integer rWho = Integer.parseInt(replyWho);
			
			User user = new User();
			user.setUserID(uId);

			Comment comment = new Comment();
			comment.setCommentID(cId);
			Reply reply = new Reply(replyContent,uId,cId);
			if(rWho!=0){
				reply.setReplyWhich(rWho);
			}
			boolean replyRes = replyService.replyComment(reply);
			if(replyRes){
				result.put("res", "success");
			}else{
				result.put("res", "failed");
			}
		}catch(Exception e) {
			result.put("res", "failed");
			e.printStackTrace();
		}
		
		return "success";
	}
	
	@SuppressWarnings("unused")
	private Map<String,Object> application;
	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
		
	}}
