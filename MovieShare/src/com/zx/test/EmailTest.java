package com.zx.test;

import static org.junit.Assert.*;

import java.security.GeneralSecurityException;

import javax.mail.MessagingException;

import org.junit.Test;

import com.zx.utils.SendVerificationCode;

public class EmailTest extends SendVerificationCode {
	
	@Test
	public void test() {
		try {
			SendVerificationCode.sendVierificationCode("4567", "188265367@qq.com");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fail("Not yet implemented");
	}

}
