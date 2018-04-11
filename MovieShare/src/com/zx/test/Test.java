package com.zx.test;

import com.zx.service.MovieService;

public class Test {
	public static void main(String[] args) {
		MovieService ms = new MovieService();
		System.out.println(ms.checkMovie(3).getFilmmakerList());
		}
}
