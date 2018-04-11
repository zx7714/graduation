package com.zx.daointerface;

import java.util.List;

import com.zx.javabean.Job;

public interface IJobDao {
	public List<Job> getJob();
	public List<Job> getJobByFilmmaker(Integer filmmakerID);
	public Job getJobByName(String jobName);
}
