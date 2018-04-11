package com.zx.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import com.zx.dao.MarkDao;
import com.zx.javabean.Mark;
import com.zx.javabean.Movie;
import com.zx.javabean.User;
import com.zx.utils.JdbcUtils;

public class MarkDaoTest {
	MarkDao md  = new MarkDao();
	@Test
	public void testSaveMovieMark(){
		Connection conn;
		try {
			conn = JdbcUtils.getConnection();
			User user = new User();
			user.setUserID(4);
			Movie movie = new Movie();
			movie.setMovieID(7);
			Mark mark = new Mark(2,"込込込込込込込込込込込込込込込込込込込込込込込込",user,movie);
			System.out.println(md.saveMovieMark(conn, mark));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test
	public void testGetMarkByMovie() {
		System.out.println(md.getMarkByMovie(3));
	}

	@Test
	public void testDeleteMarkByMovie() {
		fail("Not yet implemented");
	}

}
