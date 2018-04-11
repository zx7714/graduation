package com.zx.action;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;


import com.zx.javabean.Search;
import com.zx.service.SearchService;
import com.zx.serviceinterface.ISearchService;

public class SearchAction implements ApplicationAware{
	private String keyword;
	private ISearchService searchService = new SearchService();
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String searchInformation() throws Exception{
		Search search = searchService.userSearchInformation(this.keyword);
		application.put("search", search);
		if(search!=null)
			return "success";
		else
			return "erro";
		
	}
	public String admSearchInformation() throws Exception{
		Search search = searchService.searchInformation(this.keyword);
		application.put("search", search);
		application.put("keyword", keyword);
		if(search!=null)
			return "success";
		else
			return "erro";
	}
	private Map<String,Object> application;
	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
		
	}
}
