package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IUserDao;
import com.zx.javabean.User;

public class UserDao extends DAO<User>implements IUserDao {

	@Override
	public User getUserByNameAndPassword(String userName, String password) {

		String sql = "select userID,userName,userEmail "
				+ "from userinformationlist "
				+ "where userName = ? and userPassword = ?";
		return queryBean(sql, userName,password);
		
	}

	@Override
	public boolean getUserByName(String userName) {
		String sql = "select userID,userName,userPassword,userEmail "
				+ "from userinformationlist "
				+ "where userName = ?";
		User user = queryBean(sql, userName);
		if(user!=null)
			return true;
		else
			return false;
	}

	@Override
	public boolean getUSerByEmail(String email) {
		String sql = "select userID,userName,userPassword,userEmail "
				+ "from userinformationlist "
				+ "where userEmail = ?";
		User user = queryBean(sql, email);
		if(user!=null)
			return true;
		else
			return false;
	}

	@Override
	public boolean saveUser(Connection conn,User user) throws SQLException {
		String sql = "insert into userinformationlist(userName,userPassword,userEmail) "
				+ "values(?,?,?)";
		long low = update(conn,sql, user.getUserName(),user.getUserPassword(),user.getUserEmail());
		if(low !=0 )
			return true;
		else 
			return false;
		
	}

	@Override
	public User getUserByID(Integer userID) {
		String sql = "select userID,userName,userEmail "
				+ "from userinformationlist "
				+ "where userID = ?";
		return queryBean(sql, userID);
	}

	@Override
	public boolean getUserByUserNameAndEmail(String userName, String email) {
		String sql =  "select userID,userName,userPassword,userEmail "
				           + "from userinformationlist "
				           + "where userName = ? and userEmail = ?";
		User user = queryBean(sql, userName,email);
		if(user!=null)
			return true;
		return false;
	}

	@Override
	public boolean updateUserPassword(Connection conn,User user) throws SQLException {
		String sql = "update userinformationlist set userPassword=? "
				+ "where userName=? and userEmail=?";
		long low = update(conn,sql, 
						user.getUserPassword(),
						user.getUserName(),
						user.getUserEmail()
						);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public Integer getAdmByAccountAndPassword(Integer admAccount, String admPassword) {
		String sql = "select administratorID "
				+ "from administratorinformationlist "
				+ "where administratorAccount = ? and administratorPassword = ?";
		int adm = queryValue(sql, admAccount,admPassword);	
		return adm;
	}
	
	public List<User> findAllUser(){
		String sql = "select * from userinformation list";
		return queryList(sql);
	
	}
	public User getUserByMark(Integer markID){
		String sql = "select u.userID,u.userName "
				+ "from userinformationlist u,moviemarklist mm "
				+ "where u.userID = mm.userID "
				+ "and mm.markID = ?";
		
		return queryBean(sql, markID);
	}
	public User getUserByComment(Integer commentID){
		String sql = "select u.userID,u.userName "
				+ "from userinformationlist u,moviecommentlist mc "
				+ "where u.userID = mc.userID "
				+ "and mc.commentID = ?";
		return queryBean(sql, commentID);
	}
	public User getUserByReply(Integer replyID){
		String sql = "select u.userID,userName "
				+ "from userinformationlist u,commentreplylist cr "
				+ "where u.userID = cr.userID "
				+ "and cr.commentID = ?";
		return queryBean(sql,replyID);
	}

	@Override
	public boolean getUserByIDAndEmail(Integer userID, String userEmail) {
		
		return false;
	}

}
