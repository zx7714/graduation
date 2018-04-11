package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;

import com.zx.javabean.User;

public interface IUserDao {
	public User getUserByNameAndPassword(String userName,String password);
	public boolean getUserByName(String userName);
	public boolean getUSerByEmail(String email);
	public boolean saveUser(Connection conn,User user) throws SQLException;
	public User getUserByID(Integer userID);
	public boolean getUserByUserNameAndEmail(String userName,String email);
	public Integer getAdmByAccountAndPassword(Integer admAccount,String admPassowrd);
	public User getUserByMark(Integer markID);
	public User getUserByComment(Integer commentID);
	public boolean getUserByIDAndEmail(Integer userID,String userEmail);
	boolean updateUserPassword(Connection conn, User user) throws SQLException;
}
