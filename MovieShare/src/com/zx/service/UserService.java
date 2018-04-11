package com.zx.service;

import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import com.zx.dao.CommentDao;
import com.zx.dao.MovieDao;
import com.zx.dao.UserDao;
import com.zx.javabean.Comment;
import com.zx.javabean.Movie;
import com.zx.javabean.PageUser;
import com.zx.javabean.User;
import com.zx.serviceinterface.IUserService;
import com.zx.utils.JdbcUtils;
import com.zx.utils.UserType;

public class UserService implements IUserService{
	private UserDao userDao = new UserDao();
	private CommentDao commentDao = new CommentDao();
	private MovieDao movieDao = new MovieDao();
	@Override
	public User userLogin(String userName,String userPassword) {
		User loginResult = userDao.getUserByNameAndPassword(userName, userPassword);
		return loginResult;
	}

	//用户注册
	@Override
	public UserType userRegist(User user) {
		Connection conn = null;
		UserType userType = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			boolean ifUserExist = userDao.getUserByName(user.getUserName());
			if(ifUserExist){
				userType = UserType.UserExist;
			}else{
				boolean ifEmailUsed = userDao.getUSerByEmail(user.getUserEmail());
				if(!ifEmailUsed){
					userDao.saveUser(conn,user);
				}else{
					userType = UserType.EmailUsed;
				}
			}
			userType=UserType.RegistSuccess;
			conn.commit();
			return userType;
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return  UserType.RegistFailed;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
	}
	//用户新查看
	@Override
	public PageUser userInformationCheck(Integer userID,Integer pageNo) {
		PageUser pageUser = new PageUser();
		User user = userDao.getUserByID(userID);
		List<Comment> comments = commentDao.getCommentByUser(userID,pageNo);
		Iterator<Comment> cit = comments.iterator();
		while(cit.hasNext()){
			Comment comment = cit.next();
			Movie movie = movieDao.getMovieByComment(comment.getCommentID());
			comment.setMovie(movie);	
		}
		user.setComment(comments);
		Integer totalPage = commentDao.getTotleComment(userID);
		pageUser.setUser(user);
		if(totalPage%5<=0){
			totalPage = totalPage-1;
		}
		pageUser.setTotlePage(totalPage/5);
		pageUser.setPageNo(pageNo/5);
		
		return pageUser;
	}

	//修改密码
	@Override
	public boolean userPasswordReset(User user) {
		Connection conn = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			boolean b = userDao.updateUserPassword(conn,user);
			conn.commit();
			return b;
		}catch(Exception e){
			JdbcUtils.connRollBack(conn);
			e.printStackTrace();
			return false;
		}
	}


	@Override
	public Integer administratorLogin(Integer admAccount, String admPassword) {
		Integer adm = userDao.getAdmByAccountAndPassword(admAccount, admPassword);
		return adm;
	}
}
