package com.zx.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zx.dao.TypeDao;

public class TypyDaoTest {
	TypeDao td = new TypeDao();
	@Test
	public void testGetType() {
		
		System.out.println(td.getType());
	}

	@Test
	public void testGetTypeByID() {
		System.out.println(td.getTypeByID(1));
	}
	@Test
	public void testGetTypeByMovie(){
		System.out.println("getTypeByMovie:"+td.getTypeByMovie(16));
		
	}

}
