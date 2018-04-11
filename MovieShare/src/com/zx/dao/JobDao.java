package com.zx.dao;

import java.util.List;

import com.zx.daointerface.IJobDao;
import com.zx.javabean.Job;

public class JobDao extends DAO<Job> implements IJobDao {

	@Override
	public List<Job> getJob() {
		String sql = "select jobID,jobName from jobinformationlist";
		return queryList(sql);
	}

	@Override
	public List<Job> getJobByFilmmaker(Integer filmmakerID) {
		String sql = "select J.jobID,J.jobName "
				+ "from jobinformationlist J,filmmakerjoblist FJ "
				+ "where J.jobID = FJ.jobID "
				+ "and FJ.filmmakerID = ?";
		return queryList(sql,filmmakerID);
	}
	@Override
	public Job getJobByName(String jobName) {
		String sql = "select jobID,jobName "
				+ "from jobinformationlist "
				+ "where jobName = ?";
		return queryBean(sql, jobName);
	}


}
