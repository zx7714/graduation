package com.zx.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

import com.zx.javabean.Filmmaker;
import com.zx.javabean.Job;
import com.zx.javabean.Movie;
import com.zx.javabean.TheType;
import com.zx.service.MovieService;
import com.zx.utils.MovieResetType;
import com.zx.utils.StrToDate;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;




public class MovieAction implements ApplicationAware,SessionAware{
	
	private String movieID;
	private String movieName;
	private File movieCover;
	private String movieCoverFileName;
	private String movieLanguage;
	private String movieDate;
	private String movieLong;
	private String movieDescribe;
	private String filmmakerID;
	private String filmmakerName;
	private String filmmakerJob;
	private String movieType;
	private String keyword;
	private String typeNo;
	private int beginNum;
	private JSONArray result;
	
	public String getFilmmakerID() {
		return filmmakerID;
	}
	public void setFilmmakerID(String filmmakerID) {
		this.filmmakerID = filmmakerID;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String getFilmmakerName() {
		return filmmakerName;
	}
	public void setFilmmakerName(String filmmakerName) {
		this.filmmakerName = filmmakerName;
	}
	public String getFilmmakerJob() {
		return filmmakerJob;
	}
	public void setFilmmakerJob(String filmmakerJob) {
		this.filmmakerJob = filmmakerJob;
	}
	public String getMovieCoverFileName() {
		return movieCoverFileName;
	}
	public void setMovieCoverFileName(String movieCoverFileName) {
		this.movieCoverFileName = movieCoverFileName;
	}
	public String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}	
	public File getMovieCover() {
		return movieCover;
	}
	public void setMovieCover(File movieCover) {
		this.movieCover = movieCover;
	}
	public String getMovieLanguage() {
		return movieLanguage;
	}

	public void setMovieLanguage(String movieLanguage) {
		this.movieLanguage = movieLanguage;
	}

	public String getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieLong() {
		return movieLong;
	}

	public void setMovieLong(String movieLong) {
		this.movieLong = movieLong;
	}

	public String getMovieDescribe() {
		return movieDescribe;
	}

	public void setMovieDescribe(String movieDescribe) {
		this.movieDescribe = movieDescribe;
	}
	
	public String getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(String typeNo) {
		this.typeNo = typeNo;
	}
	public JSONArray getResult() {
		return result;
	}
	public void setResult(JSONArray result) {
		this.result = result;
	}

	public int getBeginNum() {
		return beginNum;
	}
	public void setBeginNum(int beginNum) {
		this.beginNum = beginNum;
	}


	private MovieService movieService = new MovieService();
	
	public String getType() throws Exception{
		List<TheType> typeList = movieService.getType();
		applicationMap.put("types", typeList);
		
		return "success";
	}
	
	/*
	 * 最新影片
	 * */
	public String getMovieByDate() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar cas = Calendar.getInstance();
		Calendar cae = Calendar.getInstance();
		cas.add(Calendar.MONTH, -1);   
		Date startDate = cas.getTime();
		Date endDate = cae.getTime();
		if(beginNum<0){
			int pages=movieService.totalPage(sdf.format(startDate), sdf.format(endDate));
			applicationMap.put("pages", pages);
			applicationMap.put("beginPage", beginNum+1);
			beginNum=0;
		}
		List<Movie> movieList = movieService.getMovieByDate(sdf.format(startDate),sdf.format(endDate),beginNum*5);
		applicationMap.put("movieByDate", movieList);
		result = new JSONArray();
		Iterator<Movie> mit = movieList.iterator();
		while(mit.hasNext()){
			Movie movie = mit.next();
			JSONObject object = new JSONObject();
			object.put("movieName", movie.getMovieName());
			object.put("movieCover", movie.getMovieCover());
			object.put("movieID", movie.getMovieID());
			result.add(object);
		}
		return "success";
	}
	//查看影片
	public String checkMovie() throws Exception{
		Integer mId = Integer.parseInt(movieID);
		Movie movie = movieService.checkMovie(mId);
		applicationMap.put("cmovie", movie);
		if(movie!=null){
			return "success";
		}else{
			return "erro";
		}
	}
	public String addMovie() throws Exception{
		ServletContext servletContext = ServletActionContext.getServletContext();
		String dir = servletContext.getRealPath("/files/"+movieCoverFileName);
		
		FileOutputStream out  = new FileOutputStream(dir);
		FileInputStream in = new FileInputStream(movieCover); 
		byte[] buffer = new byte[10*1024];
		int len = 0;
		while((len=in.read(buffer))!=-1){
			out.write(buffer,0,len);
		}
		out.close();
		in.close();
		String fNames[] = filmmakerName.split(",");
		String fJobs[] = filmmakerJob.split(",");
		List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
		List<Job> jobs = null;
		for(int i =0;i<fNames.length;i++){
			if(!fNames[i].equals(" ")){
				Filmmaker filmmaker = new Filmmaker();
				filmmaker.setFilmmakerName(fNames[i].trim());
				jobs = new ArrayList<Job>();
				Job job = new Job();
				job.setJobName(fJobs[i].trim());
				jobs.add(job);
				filmmaker.setJobList(jobs);
				filmmakers.add(filmmaker);
			}
		}
		List<TheType> types = new ArrayList<TheType>();
		String [] mTypes = movieType.split(",");
		for(String mType:mTypes){
			TheType type = new TheType();
			type.setTypeID(Integer.parseInt(mType.trim()));
			types.add(type);
		}
		Movie movie = new Movie(movieName,"files/"+movieCoverFileName,movieDescribe,Integer.parseInt(movieLong),StrToDate.strToDate(movieDate),
				movieLanguage, filmmakers, types);
		movieService.addMovie(movie);
		return "success";
	}
	public String lastMovie() throws Exception{
		List<Movie> movies  = movieService.getLastMovies(Integer.parseInt(filmmakerID));
		
		Set<Movie> set = new HashSet<Movie>();
		List<Movie> newList = new ArrayList<Movie>();
		for(java.util.Iterator<Movie> iter = movies.iterator();iter.hasNext();){
			Movie element = iter.next();
			if(set.add(element)){
				newList.add(element);
			}
		}
		movies.clear();
		movies.addAll(newList);
		applicationMap.put("movies", movies);
		return "success";
	}
	public String getMovie() throws Exception{
		
		try {
			Movie movie = movieService.getMovie(Integer.parseInt(this.movieID));
			applicationMap.put("rmovie", movie);
		} catch (Exception e) {
			return "erro";
		}
		return "success";
	}
	
	public String mvpMovie() throws Exception{
		List<Movie> mvpmovies = movieService.getMvpMovies();
		applicationMap.put("mvpmovie", mvpmovies);
		return "success";
	}
	public String resetMovie() throws Exception{
		ServletContext servletContext = ServletActionContext.getServletContext();
		String dir = servletContext.getRealPath("/files/"+movieCoverFileName);
		FileOutputStream out  = new FileOutputStream(dir);
		FileInputStream in = new FileInputStream(movieCover); 
		byte[] buffer = new byte[10*1024];
		int len = 0;
		while((len=in.read(buffer))!=-1){
			out.write(buffer,0,len);
		}
		out.close();
		in.close();
		String fNames[] = filmmakerName.split(",");
		String fJobs[] = filmmakerJob.split(",");
		List<Filmmaker> filmmakers = new ArrayList<Filmmaker>();
		List<Job> jobs = null;
		for(int i =0;i<fNames.length;i++){
			if(!fNames[i].equals("")){
				Filmmaker filmmaker = new Filmmaker();
				filmmaker.setFilmmakerName(fNames[i].trim());
				jobs = new ArrayList<Job>();
				Job job = new Job();
				job.setJobName(fJobs[i].trim());
				jobs.add(job);
				filmmaker.setJobList(jobs);
				filmmakers.add(filmmaker);
			}
		}
		List<TheType> types = new ArrayList<TheType>();
		String [] mTypes = movieType.split(",");
		for(String mType:mTypes){
			TheType type = new TheType();
			type.setTypeID(Integer.parseInt(mType.trim()));
			types.add(type);
		}
		Movie movie = new Movie(movieName,"files/"+movieCoverFileName,movieDescribe,Integer.parseInt(movieLong),StrToDate.strToDate(movieDate),
				movieLanguage, filmmakers, types);
		try {
			movie.setMovieID(Integer.parseInt(movieID));
		} catch (Exception e) {
			return "erro";
		}
		MovieResetType resetType = movieService.resetMovie(movie);
		return "success";
	}
	public String deleteMovie() throws Exception{
		JSONObject jobj = new JSONObject();
		result = new JSONArray();
		try {	
			
			boolean b = movieService.deleteMovie(Integer.parseInt(movieID));
			if(!b)
				jobj.put("res", "erro");
			else
				jobj.put("res", "ok");
		} catch (Exception e){
			jobj.put("res", "erro");
			e.printStackTrace();
			return "erro";
		}
		result.add(jobj);
		return "success";
	}
	public String recommendMovie() throws Exception{

		try {
			List<Movie> movies = movieService.recommendMovie(Integer.parseInt(typeNo));
			if(movies.size()==0){
				result = null;
				
			}else{
				
				JSONArray json = new JSONArray();
				for(Movie movie : movies){
				String s = String.valueOf(movie.getMovieEveryScore());
				JSONObject m = new JSONObject();
				m.put("movieID", movie.getMovieID());
				m.put("movieName", movie.getMovieName());
				m.put("movieCover", movie.getMovieCover());
				m.put("movieEveryScore",s);
				json.add(m);
				}
				result=json;
			}
		}catch (Exception e) {
			return "erro";
		}
		return "success";
	
	}
	private Map<String,Object> applicationMap;
	@Override
	public void setApplication(Map<String, Object> arg0){
		this.applicationMap = arg0;
	}
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}
	
}
