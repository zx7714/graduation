package com.zx.serviceinterface;

import com.zx.javabean.Search;

public interface ISearchService {
	public Search searchInformation(String keyword);
	public Search userSearchInformation(String keyword);
}
