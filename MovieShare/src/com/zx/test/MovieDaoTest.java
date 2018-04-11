package com.zx.test;



import java.sql.Connection;
import java.sql.SQLException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import com.zx.dao.MovieDao;
import com.zx.javabean.Movie;
import com.zx.utils.JdbcUtils;

public class MovieDaoTest {
	MovieDao md = new MovieDao();
	private static Connection conn;
	static{
		try {
			conn = JdbcUtils.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void testGetMovieByID() {
		System.out.println("getMovieByScore:"+md.getMovieByID(null));
	}

	@Test
	public void testGetMovieByKeyword() {
		List list  = md.getMovieByKeyword("王");
		Iterator it = list.iterator();
		System.out.println(""+list);
		while(it.hasNext()){
			Movie movie = (Movie) it.next();
			System.out.println(movie.getMovieName()+" "+movie.getMovieDescribe());
		}
	}

	@Test
	public void testDeleteMovieByID() throws SQLException {
		
		boolean b = md.deleteMovieByID(conn,-1);
		System.out.println("deleteMovieByID = "+b);
	}

	@Test
	public void testGetMovieByName() {
		System.out.println("getMovie:"+md.getMovieAndFilmmakerMovieByKeyword("周星驰"));
	}

	@Test
	public void testUpdateMovie() throws SQLException {
		Movie movie = new Movie();
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject("2010-02-27");
			System.out.println(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		movie.setMovieID(2);
		movie.setMovieName("叶问2");
		movie.setMovieCover("http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%8F%B6%E9%97%AE1&step_word=&hs=0&pn=0&spn=0&di=201593152420&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=3507932949%2C451408207&os=3281377042%2C3979450102&simid=3468529672%2C392049687&adpicid=0&lpn=0&ln=1969&fr=&fmq=1508396765587_R&fm=rs4&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=%E5%8F%B6%E9%97%AE&objurl=http%3A%2F%2Fwww.moneualcn.com%2Fupdate%2F9%2Fb9d9fb371e44fe184.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B45gj7wsvg_z%26e3Bv54AzdH3Fr65e-mcccj_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0");
		movie.setMovieDate(d);
		movie.setMovieDescribe("这是叶问2");
		movie.setMovieLong(90);
		movie.setMovieLanguage("粤语");

		System.out.println(md.updateMovie(conn,movie));
	}

	@Test
	public void testSaveMovie() throws SQLException {
		Movie movie = new Movie();
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject("2010-02-27");
			System.out.println(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		movie.setMovieName("叶问2");
		movie.setMovieCover("http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%8F%B6%E9%97%AE1&step_word=&hs=0&pn=0&spn=0&di=201593152420&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=3507932949%2C451408207&os=3281377042%2C3979450102&simid=3468529672%2C392049687&adpicid=0&lpn=0&ln=1969&fr=&fmq=1508396765587_R&fm=rs4&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=%E5%8F%B6%E9%97%AE&objurl=http%3A%2F%2Fwww.moneualcn.com%2Fupdate%2F9%2Fb9d9fb371e44fe184.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B45gj7wsvg_z%26e3Bv54AzdH3Fr65e-mcccj_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0");
		movie.setMovieDate(d);
		movie.setMovieDescribe("这是叶问2");
		movie.setMovieLong(90);
		movie.setMovieLanguage("国语");
		System.out.println(md.saveMovie(conn,movie));
		
	}
	
	public void getMovieByDate(){
		String startT = "2017-10-1";
		String endT = "2017-12-22";
		System.out.println(md.getMovieByDate(startT, endT,0));
	}
	
	@Test
	public void getMovieByFilmmaker(){
		System.out.println("getMovieByFilmmaker:"+md.getMovieByFilmmaker(7));
		
	}
	@Test
	public void getMovieByType(){
		System.out.println("getMovieByType:"+md.getMovieByType(1));
	}
	@Test
	public void getMovieAndFilmmakerMovieByKeyword(){
		System.out.println(md.getMovieAndFilmmakerMovieByKeyword("王"));
	}

}
