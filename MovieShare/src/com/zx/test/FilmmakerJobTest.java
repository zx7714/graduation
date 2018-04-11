package com.zx.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zx.dao.FilmmakerJobDao;

public class FilmmakerJobTest {
	FilmmakerJobDao fjd = new FilmmakerJobDao();
	@Test
	public void testSaveFilmmakerJob() {/*
		System.out.println("saveFilmmaker = "+fjd.saveFilmmakerJob(3, 10000003));
		
	*/}

	@Test
	public void testGetJobByFilmmaker() {
		System.out.println("getJobIDByFilmmaker = "+fjd.getJobIDByFilmmaker(2));
	}

	@Test
	public void testDeleteFilmmakerJob() {
		//System.out.println("deleteFilmmakerJon = "+fjd.deleteFilmmakerJob(3));
	}

}
