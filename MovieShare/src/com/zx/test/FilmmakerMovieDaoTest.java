package com.zx.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.zx.dao.FilmmakerMovieDao;
import com.zx.javabean.FilmmakerMovie;

public class FilmmakerMovieDaoTest {
	FilmmakerMovieDao fmd = new FilmmakerMovieDao();
	@Test
	public void testGetMovieIDByFilmmaker() {
		
		//System.out.println("getMovieIDByFilmmaker = "+fmd.getMovieIDByFilmmaker(2));
	}

	@Test
	public void testDeleteFilmmakerMovieByFilmmaker() {
		//fmd.deleteFilmmakerMovieByFilmmaker(2);
	}

	@Test
	public void testSaveFilmmakerMovie() {
		//System.out.println("saveFilmmakerMovie = "+fmd.saveFilmmakerMovie(3, 2, "导演"));
		
	}

	@Test
	public void testUpdateFilmmakerMovie() {
		List<FilmmakerMovie> fms = fmd.getFilmmakerByFilmmaker(7);
		
		List<FilmmakerMovie> fmsn = new ArrayList<FilmmakerMovie>();//创建新的list
        for(int i=0; i<fms.size(); i++){
        	FilmmakerMovie str = fms.get(i);  //获取传入集合对象的每一个元素
            if(!fmsn.contains(str)){   //查看新集合中是否有指定的元素，如果没有则加入
            	fmsn.add(str);
            }
        }
		System.out.println(fmsn);

	}

	@Test
	public void testGetFilmmakerIDByMovie() {
		//System.out.println("getFilmmakerIDByMovie = "+fmd.getFilmmakerIDByMovie(2));
		
		
	}

	@Test
	public void testDeleteFilmmakerMovieByMoive() {
		//fmd.deleteFilmmakerMovieByMoive(2);
	}

}
