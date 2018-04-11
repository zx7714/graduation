package com.zx.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.zx.dao.MovieTypeDao;

public class MovieTypeDaoTest {
	MovieTypeDao mtd = new MovieTypeDao();
	@Test
	public void testSaveMovieType() {/*
		
		System.out.println("saveMovieType = "+mtd.saveMovieType(2, 1));
	*/}

	@Test
	public void testGetTypeIDByMovie() {
		System.out.println("getTypeIDByMovie = "+mtd.getMovieTypeByMovie(2));
	}

	@Test
	public void testDeleteMovieType() {
		fail("Not yet implemented");
	}


}
