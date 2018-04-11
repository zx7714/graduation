package com.zx.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendVerificationCode{

	public static void sendVierificationCode(String verCode,String userAddr) 
			throws MessagingException,GeneralSecurityException{

		Properties prop =  new Properties();
		prop.setProperty("mail.host", "stmp.qq.com");
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		
		//创建session
		Session session = Session.getInstance(prop);
		//通过session获取transport对象
		Transport ts = session.getTransport();
		//连上邮箱服务器
		ts.connect("smtp.qq.com", 587,"zhangxu73","vgsfqmyahykhbeig");
		//创建邮箱
		Message message;
		try{
			message = createEmail(session,verCode,userAddr);
			ts.sendMessage(message, message.getAllRecipients());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	private static MimeMessage createEmail(Session session,String verCode,String userAddr)
		throws Exception{
		//创建邮件
		MimeMessage message = new MimeMessage(session);
		//设置发信人
		message.setFrom(new InternetAddress("zhangxu73@qq.com"));
		//设置收信人
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(userAddr));
		//邮件标题
		message.setSubject("漠影人验证码");
		//正文
		MimeBodyPart text = new MimeBodyPart();
		text.setContent("您的验证码是 <span style='font-size:20px;color:red'>"+verCode+" </span>(为了您的账号安全，请勿泄露)。","text/html;charset=UTF-8");
		//添加数据
		MimeMultipart mm = new MimeMultipart();
		mm.addBodyPart(text);
		mm.setSubType("mixed");
		message.setContent(mm);
		message.saveChanges();
		
		return message;
	}
}
