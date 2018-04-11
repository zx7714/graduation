package com.zx.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.zx.javabean.Movie;
import com.zx.service.MovieService;

public class MovieServiceTest {
	MovieService ms =new MovieService();
	@Test
	public void test() {
		/*Movie movie = ms.checkMovie(16);
		System.out.println(movie.getMarkList());
		System.out.println(movie.getCommentList());
		System.out.println(movie.getFilmmakerList());*/
	}
	@Test
	public void getMovieTest(){
		System.out.println(ms.getMovie(14));
	}
	@Test
	public void testCheckMovie(){
		ms.checkMovie(17);
		System.out.println(ms.checkMovie(5).getFilmmakerList());
	}
}
