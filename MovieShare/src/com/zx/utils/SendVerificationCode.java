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
		
		//����session
		Session session = Session.getInstance(prop);
		//ͨ��session��ȡtransport����
		Transport ts = session.getTransport();
		//�������������
		ts.connect("smtp.qq.com", 587,"zhangxu73","vgsfqmyahykhbeig");
		//��������
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
		//�����ʼ�
		MimeMessage message = new MimeMessage(session);
		//���÷�����
		message.setFrom(new InternetAddress("zhangxu73@qq.com"));
		//����������
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(userAddr));
		//�ʼ�����
		message.setSubject("ĮӰ����֤��");
		//����
		MimeBodyPart text = new MimeBodyPart();
		text.setContent("������֤���� <span style='font-size:20px;color:red'>"+verCode+" </span>(Ϊ�������˺Ű�ȫ������й¶)��","text/html;charset=UTF-8");
		//�������
		MimeMultipart mm = new MimeMultipart();
		mm.addBodyPart(text);
		mm.setSubType("mixed");
		message.setContent(mm);
		message.saveChanges();
		
		return message;
	}
}
