package com.zx.javabean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private Integer replyID;
	private String replyContent;
	private Integer userID;
	private Integer commentID;
	private Integer replyWhich;
	private String userName;
	private String beReplyUser;
	private String beReplyUserName;
	private String beReplyContent;
	private Date replyDate;
	

	
	public Reply(){};
	
	public Reply(String replyContent,Integer userID,
			Integer commentID) {
		super();
		this.replyContent = replyContent;
		this.userID = userID;
		this.commentID = commentID;
		this.replyWhich = replyWhich;	
	}
	public Integer getReplyID() {
		return replyID;
	}
	public void setReplyID(Integer replyID) {
		this.replyID = replyID;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getCommentID() {
		return commentID;
	}
	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}
	public Integer getReplyWhich() {
		return replyWhich;
	}
	public void setReplyWhich(Integer replyWhich) {
		this.replyWhich = replyWhich;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBeReplyUser() {
		return beReplyUser;
	}
	public void setBeReplyUser(String beReplyUser) {
		this.beReplyUser = beReplyUser;
	}

	public String getBeReplyContent() {
		return beReplyContent;
	}
	public void setBeReplyContent(String beReplyContent) {
		this.beReplyContent = beReplyContent;
	}
	

	public String getBeReplyUserName() {
		return beReplyUserName;
	}

	public void setBeReplyUserName(String beReplyUserName) {
		this.beReplyUserName = beReplyUserName;
	}
	public Date getReplyDate() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String dateString = sdf.format(replyDate);
		replyDate = sdf.parse(dateString);
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "{replyID:"+replyID+",userID:"+userID+",userName:"+userName
				+",replyContent:"+replyContent+",replyWhich:"+replyWhich+",beReplyUser:"+beReplyUser
				+",beReplyContent:"+beReplyContent+"}\n";
	}
	
	
}
