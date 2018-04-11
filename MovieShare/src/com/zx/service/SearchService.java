package com.zx.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.zx.dao.FilmmakerDao;
import com.zx.dao.FilmmakerMovieDao;
import com.zx.dao.JobDao;
import com.zx.dao.MovieDao;
import com.zx.dao.TypeDao;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.FilmmakerMovie;
import com.zx.javabean.Job;

import com.zx.javabean.Movie;
import com.zx.javabean.Search;
import com.zx.javabean.TheType;
import com.zx.serviceinterface.ISearchService;

public class SearchService implements ISearchService {
	private FilmmakerDao filmmakerDao = new FilmmakerDao();
	private MovieDao movieDao = new MovieDao();
	private JobDao jobDao = new JobDao();
	private TypeDao typeDao = new TypeDao();
	private FilmmakerMovieDao filmmakerMovieDao = new FilmmakerMovieDao();

	@Override
	public Search searchInformation(String keyword) {
		Search search = new Search();
		List<Filmmaker> filmmakerList = filmmakerDao.getFilmmakerByKeyword(keyword);
		List<Movie> movieList = movieDao.getMovieByKeyword(keyword);
		Iterator<Filmmaker> filmmakerIt = filmmakerList.iterator();
		if (filmmakerList != null) {
			while (filmmakerIt.hasNext()) {
				Filmmaker filmmaker = filmmakerIt.next();
				List<Movie> movies = movieDao.getMovieByFilmmaker(filmmaker.getFilmmakerID());
				List<Job> jobs = jobDao.getJobByFilmmaker(filmmaker.getFilmmakerID());
				filmmaker.setJobList(jobs);
				filmmaker.setMovieList(movies);
			}
			search.setFilmmakerList(filmmakerList);
		}
		if (movieList != null) {
			Iterator<Movie> movieIt = movieList.iterator();
			while (movieIt.hasNext()) {
				Movie movie = movieIt.next();
				List<TheType> typeList = typeDao.getTypeByMovie(movie.getMovieID());

				movie.setTypeList(typeList);
			}
			search.setMovieList(movieList);
		}
		return search;
	}

	@Override
	public Search userSearchInformation(String keyword) {
		Search search = new Search();
		List<Filmmaker> filmmakerList = filmmakerDao.getFilmmakerByKeyword(keyword);
		List<Movie> movieList = movieDao.getMovieAndFilmmakerMovieByKeyword(keyword);
		Iterator<Filmmaker> filmmakerIt = filmmakerList.iterator();
		if (filmmakerList != null) {
			while (filmmakerIt.hasNext()) {
				Filmmaker filmmaker = filmmakerIt.next();
				List<Movie> movies = movieDao.getMovieByFilmmaker(filmmaker.getFilmmakerID());
				List<Job> jobs = jobDao.getJobByFilmmaker(filmmaker.getFilmmakerID());
				filmmaker.setJobList(jobs);
				filmmaker.setMovieList(movies);
			}
			search.setFilmmakerList(filmmakerList);
		}
		if (movieList != null) {
			Iterator<Movie> movieIt = movieList.iterator();
			while (movieIt.hasNext()){
				Movie movie = movieIt.next();
				List<TheType> typeList = typeDao.getTypeByMovie(movie.getMovieID());
				movie.setTypeList(typeList);
				List<FilmmakerMovie> fms = filmmakerMovieDao.getFilmmakerIDByMovie(movie.getMovieID());//µÃµ½filmmaker
				if (fms != null){
					Iterator<FilmmakerMovie> fmIt = fms.iterator();
					List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
					while (fmIt.hasNext()) {
						FilmmakerMovie fm = fmIt.next();
						Filmmaker filmmaker = filmmakerDao.getFilmmakerByID(fm.getFilmmakerID());
						List<Job> jobs = new ArrayList<Job>();
						Job job = jobDao.getJobByName(fm.getFilmmakerJob());
						jobs.add(job);
						filmmaker.setJobList(jobs);
						filmmakers.add(filmmaker);
						}
					movie.setFilmmakerList(filmmakers);
				}
				search.setMovieList(movieList);
			}
		}
		return search;
	}

}
