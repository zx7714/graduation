package com.zx.javabean;

import java.io.Serializable;

public class Administartor implements Serializable{
	private Integer administratorID;
	private Integer administratorAccount;
	private Integer administratorPassword;
	public Integer getAdministratorID() {
		return administratorID;
	}
	public void setAdministratorID(Integer administratorID) {
		this.administratorID = administratorID;
	}
	public Integer getAdministratorAccount() {
		return administratorAccount;
	}
	public void setAdministratorAccount(Integer administratorAccount) {
		this.administratorAccount = administratorAccount;
	}
	public Integer getAdministratorPassword() {
		return administratorPassword;
	}
	public void setAdministratorPassword(Integer administratorPassword) {
		this.administratorPassword = administratorPassword;
	}
	
	
}
