package com.zx.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.zx.dao.UserDao;
import com.zx.javabean.User;

public class UserDaoTest {
	UserDao ud = new UserDao();
	@Test
	public void testGetUserByNameAndPassword() {
		
	}

	@Test
	public void testGetUserByName() {
		boolean i = ud.getUserByName("zhangsana");
		System.out.println("getUserByName = " +i);
		
		
	}

	@Test
	public void testGetUSerByEmail() {
		UserDao ud  = new UserDao();
		System.out.println(ud.getUSerByEmail("zzhangsan@126.com"));
	}

	@Test
	public void testSaveUser() {
		System.out.println("********mark"+ud.getUserByMark(1));
	}

	@Test
	public void testGetUserByID() {
		UserDao ud = new UserDao();
		User user = ud.getUserByID(1);
		System.out.println(user.getUserID()+user.getUserName()+user.getUserPassword()+user.getUserEmail());
	}

	@Test
	public void testGetUserByUserNameAndEmail() {
		UserDao ud = new UserDao();
		System.out.println("getUserByNameAdnEmail "+ud.getUserByUserNameAndEmail("lisi", "lisi@126.com"));
	}

	@Test
	public void testUpdateUserPassword() {
		UserDao ud = new UserDao();
		//System.out.println("uppdate"+ud.updateUserPassword("zhangsan", "456789"));
		
	}

	@Test
	public void testGetAdmByAccountAndPassword() {
		Integer user = ud.getAdmByAccountAndPassword(12345678, "123123");
		System.out.println("geAdmByAccountAndPassword"+user);
	}

}
