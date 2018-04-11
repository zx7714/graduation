package com.zx.serviceinterface;

import com.zx.javabean.PageUser;
import com.zx.javabean.User;
import com.zx.utils.UserType;

public interface IUserService {
	public User userLogin(String userName,String userPassword);
	public UserType userRegist(User user);
	public PageUser userInformationCheck(Integer userID,Integer pageNo);
	public boolean userPasswordReset(User user);
	public Integer administratorLogin(Integer admAccount,String admPassword);
}	
