package com.zx.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetDate {
	public static void main(String[] args) {

	    Calendar cas = Calendar.getInstance();// 得到一个Calendar的实例  
	  // 设置时间为当前时间  
	    Calendar cae = Calendar.getInstance();
	    cas.add(Calendar.MONTH, -1);// 月份减1   
	    Date startTime = cas.getTime(); // 结果  
	    Date endTime = cae.getTime();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    System.out.println(sdf.format(startTime)+"\n"+sdf.format(endTime));  
	}
}
