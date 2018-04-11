package com.zx.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.Test;

import com.zx.javabean.Filmmaker;
import com.zx.javabean.Job;
import com.zx.service.FilmmakerService;
import com.zx.utils.JdbcUtils;

public class FilmmakerServiceTest {
	FilmmakerService fs = new FilmmakerService();
	@Test
	public void testGetConnectFilmmaker() {
		System.out.println(fs.getConnectFilmmaker(7));
	}
	@Test
	public void saveFilmmaker(){
		
		Filmmaker filmmake = new Filmmaker("456", "", "1", "1",new Date(2018, 04, 05), "bb");
		List list = new ArrayList<Job>();
		System.out.println(new ArrayList<Job>().add(new Job(1)));

		//System.out.println(fs.addFilmmaker(filmmake));
	}

}
