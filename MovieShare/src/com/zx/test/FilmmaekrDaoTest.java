package com.zx.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.zx.dao.FilmmakerDao;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.Job;
import com.zx.utils.JdbcUtils;

public class FilmmaekrDaoTest {
	FilmmakerDao fd = new FilmmakerDao();
	@Test
	public void testGetFilmmakerByID() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetFilmmakerByKeyword() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetFilmmakerByName() {
		fail("Not yet implemented");
	}

	@Test
	public void testSaveFilmmaker() throws SQLException {
		Connection conn = JdbcUtils.getConnection();
		Filmmaker filmmake = new Filmmaker("123", "", "1", "1",new Date(2018, 04, 05), "bb");
		Job job = new Job(1);
		List<Job> jobs = new ArrayList<Job>();
		jobs.add(job);
		filmmake.setJobList(jobs);
		System.out.println(fd.saveFilmmaker(conn, filmmake));
		
	}

	@Test
	public void testDeleteFilmmakerByID() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateFilmmaker() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetFilmmakerByMovie() {
		System.out.println(fd.getFilmmakerByMovie(5));
	}
	@Test
	public void testGetConnectFilmmakerByFilmmaker(){
		System.out.println(fd.getConnectFilmmakerByFilmmaker(7));	
	}

}
