package com.zx.javabean;

public class PageUser {
	private Integer pageNo;
	private Integer totlePage;
	private User user;
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getTotlePage() {
		return totlePage;
	}
	public void setTotlePage(Integer totlePage) {
		this.totlePage = totlePage;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
