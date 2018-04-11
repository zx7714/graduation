package com.zx.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.javabean.CompanyFilmmaker;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.Job;
import com.zx.javabean.Movie;
import com.zx.service.FilmmakerService;
import com.zx.service.MovieService;
import com.zx.service.SearchService;
import com.zx.serviceinterface.IFilmmakerService;
import com.zx.utils.FilmmakerResetType;
import com.zx.utils.FilmmakerType;
import com.zx.utils.StrToDate;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FilmmakerAction extends ActionSupport implements ApplicationAware{

	private static final long serialVersionUID = 1L;
	private String filmmakerID;
	private String filmmakerName;
	private String filmmakerSex;
	private File filmmakerPhoto;
	private String filmmakerPhotoFileName;
	private String filmmakerDescribe;
	private String filmmakerBirth;
	private String filmmakerBirthPlace;
	private String filmmakerJob;
	private String keyword;
	private JSONObject result;
	
	
	public String getFilmmakerID() {
		return filmmakerID;
	}
	public void setFilmmakerID(String filmmakerID) {
		this.filmmakerID = filmmakerID;
	}
	public String getFilmmakerName() {
		return filmmakerName;
	}
	public void setFilmmakerName(String filmmakerName) {
		this.filmmakerName = filmmakerName;
	}
	public String getFilmmakerSex() {
		return filmmakerSex;
	}
	public void setFilmmakerSex(String filmmakerSex) {
		this.filmmakerSex = filmmakerSex;
	}
	public File getFilmmakerPhoto() {
		return filmmakerPhoto;
	}
	public void setFilmmakerPhoto(File filmmakerPhoto) {
		this.filmmakerPhoto = filmmakerPhoto;
	}
	public String getFilmmakerPhotoFileName() {
		return filmmakerPhotoFileName;
	}
	public void setFilmmakerPhotoFileName(String filmmakerPhotoFileName) {
		this.filmmakerPhotoFileName = filmmakerPhotoFileName;
	}
	public String getFilmmakerDescribe() {
		return filmmakerDescribe;
	}
	public void setFilmmakerDescribe(String filmmakerDescribe) {
		this.filmmakerDescribe = filmmakerDescribe;
	}
	public String getFilmmakerBirth() {
		return filmmakerBirth;
	}
	public void setFilmmakerBirth(String filmmakerBirth) {
		this.filmmakerBirth = filmmakerBirth;
	}
	public String getFilmmakerBirthPlace() {
		return filmmakerBirthPlace;
	}
	public void setFilmmakerBirthPlace(String filmmakerBirthPlace) {
		this.filmmakerBirthPlace = filmmakerBirthPlace;
	}
	public String getFilmmakerJob() {
		return filmmakerJob;
	}
	public void setFilmmakerJob(String filmmekerJob) {
		this.filmmakerJob = filmmekerJob;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public JSONObject getResult() {
		return result;
	}
	public void setResult(JSONObject result) {
		this.result = result;
	}


	private IFilmmakerService filmmakerService = new FilmmakerService();
	

	public String getJob() throws Exception{
		List<Job> jobList = filmmakerService.getJob();

		applicationMap.put("jobs", jobList);
		return "success";
		
	}
	
	public String addFilmmaker() throws Exception{
		
		ServletContext servletContext = ServletActionContext.getServletContext();
		String dir = servletContext.getRealPath("/files/"+filmmakerPhotoFileName); //图片绝对路径
		FileOutputStream out  = new FileOutputStream(dir);
		FileInputStream in = new FileInputStream(filmmakerPhoto); 
		byte[] buffer = new byte[10*1024];
		int len = 0;
		while((len=in.read(buffer))!=-1){
			out.write(buffer,0,len);
		}
		out.close();
		in.close();
		String photoPath = "files/"+filmmakerPhotoFileName;
		Filmmaker filmmaker = new Filmmaker(filmmakerName,filmmakerSex, photoPath,filmmakerDescribe,
				StrToDate.strToDate(filmmakerBirth),filmmakerBirthPlace);
		String jId[] = filmmakerJob.split(",");
		List<Job> jobs = new ArrayList<Job>();
		for(String jobID : jId){
			Job job = new Job(Integer.parseInt(jobID.trim()));
			jobs.add(job);
		}
		filmmaker.setJobList(jobs);
		
		FilmmakerType addType = filmmakerService.addFilmmaker(filmmaker);
		if(addType.equals(FilmmakerType.FilmmakerExist)){
			applicationMap.put("addFilmmakerRes","FilmmakerExist");
		}else if(addType.equals(FilmmakerType.AddFailed)){
			applicationMap.put("addFilmmakerRes", "AddFailed");
		}else if(addType.equals(FilmmakerType.AddSuccess)){
			applicationMap.put("addFilmmakerRes","AddSuccess");
		}
		return "success";
	}
	public String workTogetherFilmmaker() throws Exception{
		
		return "success";
	} 
	
	public String checkFilmmaker() throws Exception{
		
		MovieService movieService = new MovieService();
		List<Movie> bestmovies = null;
		List<Movie> lastmovies = null;
		Filmmaker filmmaker = null;
		
		List<CompanyFilmmaker> cofilmmakers = null;
		try {
			//获取影人信息影人信息
			filmmaker = filmmakerService.checkFilmmaker(Integer.parseInt(filmmakerID));
			//获取影人评分最高的影片
			bestmovies = movieService.getBestMovies(Integer.parseInt(filmmakerID));
			lastmovies = movieService.getLastMovies(Integer.parseInt(filmmakerID));
			//获取影人相关的影人
			cofilmmakers = filmmakerService.getConnectFilmmaker(Integer.parseInt(filmmakerID));
			
		}catch (Exception e) {
			return "erro";
		}
		applicationMap.put("cfilmmakers", cofilmmakers);
		applicationMap.put("bestmovies", bestmovies);
		applicationMap.put("lastmovie", lastmovies);
		applicationMap.put("gfilmmaker", filmmaker);
		return "success";
	}
	public String getFilmmaker() throws Exception{
		try {
			Filmmaker filmmaker = filmmakerService.checkFilmmaker(Integer.parseInt(filmmakerID));
			applicationMap.put("gfilmmaker", filmmaker);
		} catch (Exception e) {
			return "erro";
		}
		return "success";
	}
	public String resetFilmmaker() throws Exception{
		ServletContext servletContext = ServletActionContext.getServletContext();
		String dir = servletContext.getRealPath("/files/"+filmmakerPhotoFileName); //图片绝对路径
		FileOutputStream out  = new FileOutputStream(dir);
		FileInputStream in = new FileInputStream(filmmakerPhoto); 
		byte[] buffer = new byte[10*1024];
		int len = 0;
		while((len=in.read(buffer))!=-1){
			out.write(buffer,0,len);
		}
		out.close();
		in.close();
		String photoPath = "files/"+filmmakerPhotoFileName;
		Filmmaker filmmaker = new Filmmaker(filmmakerName,filmmakerSex, photoPath,filmmakerDescribe,
				StrToDate.strToDate(filmmakerBirth),filmmakerBirthPlace);
		String jId[] = filmmakerJob.split(",");
		List<Job> jobs = new ArrayList<Job>();
		for(String jobID : jId){
			Job job = new Job(Integer.parseInt(jobID.trim()));
			jobs.add(job);
		}
		filmmaker.setJobList(jobs);
		try {
			filmmaker.setFilmmakerID(Integer.parseInt(filmmakerID));
			
		} catch (Exception e) {
			return "erro";
		}
		FilmmakerResetType resetType = filmmakerService.resetFilmmaker(filmmaker);
		applicationMap.put("resetType", resetType);
		return "success";
	}
	public String deleteFilmmaker() throws Exception{
		result = new JSONObject();
		try {
			boolean b = filmmakerService.deleteFilmmaekr(Integer.parseInt(this.filmmakerID));
			if(b)
				result.put("res", new String("ok"));
			else
				result.put("res", new String("erro"));
			
		} catch (Exception e) {
			result.put("res", new String("erro"));
			e.printStackTrace();
		}
		return "success";	
	}
	public String execute() throws Exception{
		applicationMap.put("addFilmmakerRes","");
		return "success";
	}
	private Map<String,Object> applicationMap;
	@Override
	public void setApplication(Map<String, Object> applicationMap) {
		this.applicationMap =applicationMap;
		
	}	
	
	
	
}
