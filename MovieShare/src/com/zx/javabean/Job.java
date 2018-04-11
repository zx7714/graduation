package com.zx.javabean;

import java.util.List;

public class Job {
    private Integer jobID;
    private String jobName;
    private List<Filmmaker> filmmakerList;
    
    public Job(){}
	public Job(Integer jobID) {
		super();
		this.jobID = jobID;
	}
	
	public Integer getJobID() {
		return jobID;
	}
	public void setJobID(Integer jobID) {
		this.jobID = jobID;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public List<Filmmaker> getFilmmakerList() {
		return filmmakerList;
	}
	public void setFilmmakerList(List<Filmmaker> filmmakerList) {
		this.filmmakerList = filmmakerList;
	}
	@Override
	public String toString() {
		return "Job [jobID=" + jobID + ", jobName=" + jobName + ", filmmakerList=" + filmmakerList + "]";
	}
    
} 
