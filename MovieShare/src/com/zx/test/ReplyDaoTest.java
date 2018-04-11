package com.zx.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.zx.dao.ReplyDao;

public class ReplyDaoTest {
	ReplyDao rd = new ReplyDao();
	@Test
	public void testGetReplyByComment() {
		
		System.out.println(rd.getReplyByComment(16));
	}
}
