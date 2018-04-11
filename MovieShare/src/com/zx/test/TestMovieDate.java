package com.zx.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.zx.dao.MovieDao;

public class TestMovieDate {
	MovieDao md = new MovieDao();
	@Test
	public void test() {
		String startT = "2017-10-01";
		String endT = "2017-12-1";
		//System.out.println(md.getMovieByDate(startT, endT).size() +"\n");
	}

}
