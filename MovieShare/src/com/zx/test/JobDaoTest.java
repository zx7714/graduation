package com.zx.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zx.dao.JobDao;

public class JobDaoTest {
	JobDao jd = new JobDao();
	@Test
	public void testGetJob() {
		System.out.println("job"+jd.getJob());
	}

	@Test
	public void testGetJobByID() {
		System.out.println(jd.getJobByFilmmaker(7));
	}

}
