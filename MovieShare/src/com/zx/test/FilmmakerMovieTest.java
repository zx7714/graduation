package com.zx.test;

import static org.junit.Assert.fail;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.zx.dao.FilmmakerDao;
import com.zx.javabean.Filmmaker;

public class FilmmakerMovieTest {
	private FilmmakerDao fd = new FilmmakerDao();
	@Test
	public void testGetFilmmakerByID() {
		Filmmaker filmmaker = fd.getFilmmakerByID(1);
		System.out.println("getFilmmaekrByID = "+filmmaker);
	}

	@Test
	public void testGetFilmmakerByKeyword() {
		List<Filmmaker> filmmakers  = fd.getFilmmakerByKeyword("龙");
		System.out.println(filmmakers);
		
	}

	@Test
	public void testGetFilmmakerByName() {
		/*Filmmaker filmmaker = fd.getFilmmakerByName("李小龙");
		System.out.println("getFilmmakerByName = "+filmmaker);*/
		
	}

	@Test
	public void testSaveFilmmaker() {/*

		Format f = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject("1974-11-11");
			System.out.println(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Filmmaker filmmaker = new Filmmaker();
		filmmaker.setFilmmakerName("李小龙");
		filmmaker.setFilmmakerSex("男");
		filmmaker.setFilmmakerPhoto("https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=6b90cd4d2134349b600b66d7a8837eab/ac345982b2b7d0a2424928cac2ef76094a369ae0.jpg");
		filmmaker.setFilmmakerDescriber("功夫巨星");
		filmmaker.setFilmmakerBirth(d);
		filmmaker.setBirthPlace("中国台湾");
		boolean b =fd.saveFilmmaker(filmmaker);
		System.out.println("saveFilmmaker = "+b);
	*/}
	

	@Test
	public void testDeleteFilmmakerByID() {
		//System.out.println("deleteFilmmakerByID = "+fd.deleteFilmmakerByID(1));
	}

	@Test
	public void testUpdateFilmmaker() {
		
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject("1973-07-20");
			//System.out.println(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Filmmaker filmmaker = new Filmmaker();
		filmmaker.setFilmmakerID(3);
		filmmaker.setFilmmakerName("李小龙");
		filmmaker.setFilmmakerSex("男");
		filmmaker.setFilmmakerPhoto("https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=6b90cd4d2134349b600b66d7a8837eab/ac345982b2b7d0a2424928cac2ef76094a369ae0.jpg");
		filmmaker.setFilmmakerDescribe("功夫巨星");
		filmmaker.setFilmmakerBirth(d);
		filmmaker.setFilmmakerBirthPlace("中国台湾");
		
		//System.out.println("updateFilmmaker = "+fd.updateFilmmaker(filmmaker));
	}

}
