package com.zx.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zx.service.SearchService;

public class SearchSearviceTest {
	SearchService searchService = new SearchService();
	@Test
	public void testSearchInformation() {
		
		System.out.println(searchService.searchInformation("“∂Œ "));
		
	}

}
