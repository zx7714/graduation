package com.zx.utils;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StrToDate {
	public static Date strToDate(String str) {
		
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}
}
