package com.zx.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetDate {
	public static void main(String[] args) {

	    Calendar cas = Calendar.getInstance();// �õ�һ��Calendar��ʵ��  
	  // ����ʱ��Ϊ��ǰʱ��  
	    Calendar cae = Calendar.getInstance();
	    cas.add(Calendar.MONTH, -1);// �·ݼ�1   
	    Date startTime = cas.getTime(); // ���  
	    Date endTime = cae.getTime();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    System.out.println(sdf.format(startTime)+"\n"+sdf.format(endTime));  
	}
}
