package com.zx.action;

import java.util.Map;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

import com.zx.javabean.PageUser;
import com.zx.javabean.User;
import com.zx.service.UserService;
import com.zx.serviceinterface.IUserService;
import com.zx.utils.SendVerificationCode;
import com.zx.utils.UserType;

import net.sf.json.JSONObject;



public class UserAction implements SessionAware,ApplicationAware{
	
		private String userID;
		private String userName;
		private String userPassword;
		private String userEmail;
		private String admAccount;
		private String admPassword;
		private String userVerification;
		private String pageNo;
		private JSONObject result;
		
		private IUserService userService = new UserService();
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserPassword() {
			return userPassword;
		}
		public void setUserPassword(String userPassword) {
			this.userPassword = userPassword;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public String getAdmAccount() {
			return admAccount;
		}
		public void setAdmAccount(String admAccount) {
			this.admAccount = admAccount;
		}
		public String getAdmPassword() {
			return admPassword;
		}
		public void setAdmPassword(String admPassword) {
			this.admPassword = admPassword;
		}
		public JSONObject getResult() {
			return result;
		}
		public void setResult(JSONObject result) {
			this.result = result;
		}
		public String getPageNo() {
			return pageNo;
		}
		public void setPageNo(String pageNo) {
			this.pageNo = pageNo;
		}
		public String getUserVerification() {
			return userVerification;
		}
		public void setUserVerification(String userVerification) {
			this.userVerification = userVerification;
		}
		

		private static int verificationCode = 123456;
		
		//ÓÃ»§×¢²á
		public String userRegist() throws Exception{		
			String uver = verificationCode+"";
			result = new JSONObject();
			if(uver.equals(userVerification)){
				User user = new User(this.userName,this.userPassword,this.userEmail);
				UserType registType = userService.userRegist(user);
				if(registType.equals(UserType.EmailUsed)){
					result.put("res", "emailused");
				}else if(registType.equals(UserType.UserExist)){
					result.put("res", "userexist");
				}else if(registType.equals(UserType.RegistFailed)){
					result.put("res", "registfailed");
				}else{
					result.put("res", "success");
				}
			}else{
				result.put("res", "codewrong");
			}
			return "success";
		}
		
		public String userLogin() throws Exception{
			result = new JSONObject();
			User user = userService.userLogin(this.userName, this.userPassword);
			
			if(user!=null){
				session.put("user", user);
				result.put("res", "success");
				
			}else{
				result.put("res", "failed");
			}
			return "success";
		}
		public String userInformationCheck() throws Exception{
			try {
				PageUser pageUser = userService.userInformationCheck(Integer.parseInt(userID),Integer.parseInt(pageNo));
				User user = pageUser.getUser();
				String email=user.getUserEmail();
				String e1 = email.substring(0,2);
				String e2 = email.substring(email.length()-3,email.length());
				String newEmail = e1+"******"+e2;
				user.setUserEmail(newEmail);
				application.put("pageUser", pageUser);
			} catch (Exception e) {
				
				e.printStackTrace();
				return "erro";
			}
				return "success";
		}
	
		public String userPasswordReset() throws Exception{
			result = new JSONObject();
			User user = new User();
			user.setUserName(userName);
			user.setUserEmail(userEmail);
			user.setUserPassword(userPassword);
			boolean ifSuccess = userService.userPasswordReset(user);
			if(verificationCode==Integer.parseInt(userVerification)){
				if(ifSuccess){
					result.put("res", "success");
				}else{
					result.put("res", "failed");
				}
			}else{
				result.put("res", "verwrong");
			}
			
			return "success";
		}
		public String administratorLogin() throws Exception{
			try {
				Integer admAccount = userService.administratorLogin(Integer.parseInt(this.admAccount), this.admPassword);
				if(admAccount!=null){
					session.put("admAccount", admAccount);
				}else{
					return "input";
				}
			} catch (Exception e) {
				return "erro";
			}
			return "success";
		}
		
		public String userLogOff() throws Exception{
			session.clear();
			return "success";
		}
		
		public String getVerficationUsedByRegist() throws Exception{
			int vc =  (int)((Math.random()*9+1)*100000);
			verificationCode = vc;
			String ver = String.valueOf(vc);
			SendVerificationCode.sendVierificationCode(ver,userEmail);
			result = new JSONObject();
			result.put("code", 0);
			return "success";
		}
		
		
		private Map<String,Object> session;
		@Override
		public void setSession(Map<String, Object> arg0) {
			// TODO Auto-generated method stub
			this.session = arg0;		
		}
		private Map<String,Object> application;
		@Override
		public void setApplication(Map<String, Object> arg0) {
			this.application = arg0;
			
		}
}
