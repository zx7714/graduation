package com.zx.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.zx.dao.FilmmakerDao;
import com.zx.dao.FilmmakerJobDao;
import com.zx.dao.FilmmakerMovieDao;
import com.zx.dao.JobDao;
import com.zx.javabean.CompanyFilmmaker;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.FilmmakerMovie;
import com.zx.javabean.Job;

import com.zx.serviceinterface.IFilmmakerService;
import com.zx.utils.FilmmakerResetType;
import com.zx.utils.FilmmakerType;
import com.zx.utils.JdbcUtils;

public class FilmmakerService implements IFilmmakerService{
	private JobDao jobDao = new JobDao();
	private FilmmakerJobDao filmmakerJobDao = new FilmmakerJobDao();
	private FilmmakerDao filmmakerDao = new FilmmakerDao();
	private FilmmakerMovieDao filmmakerMovieDao = new FilmmakerMovieDao();
	@Override
	public List<Job> getJob() {
		List<Job> jobList = jobDao.getJob();
		return jobList;
	}

	@Override
	public FilmmakerType addFilmmaker(Filmmaker filmmaker){//Ӱ�����
		Connection conn = null;
		FilmmakerType filmmakerType = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			Integer getFilmmaker = filmmakerDao.getFilmmakerByName(filmmaker.getFilmmakerName()); //�ж�Ӱ���Ƿ����
			if(getFilmmaker==null){
				//����Ӱ����Ϣ
				filmmakerDao.saveFilmmaker(conn,filmmaker);
				conn.commit();
				Integer fId = filmmakerDao.getFilmmakerByName(filmmaker.getFilmmakerName());	//��ȡӰ��ID
				List<Job> jobs = filmmaker.getJobList();
				for(Job job : jobs){
					filmmakerJobDao.saveFilmmakerJob(conn,fId,job.getJobID());
				}
				conn.commit();
				filmmakerType = FilmmakerType.AddSuccess;
			}else{
				JdbcUtils.connRollBack(conn);
				filmmakerType = FilmmakerType.FilmmakerExist;
			}
		}catch(Exception e){
			
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			filmmakerType = FilmmakerType.AddFailed;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return filmmakerType;
	}

	@Override
	public Filmmaker checkFilmmaker(Integer filmmakerID) {
		Filmmaker filmmaker = filmmakerDao.getFilmmakerByID(filmmakerID);
		List<Job> jobs = jobDao.getJobByFilmmaker(filmmakerID);
		filmmaker.setJobList(jobs);
		return filmmaker;
	}

	@Override
	public List<CompanyFilmmaker> getConnectFilmmaker(Integer filmmakerID) {
		
		//return filmmakerDao.getConnectFilmmakerByFilmmaker(filmmakerID);
		List<FilmmakerMovie> filmmakerMovie = filmmakerMovieDao.getFilmmakerByFilmmaker(filmmakerID);
		List<FilmmakerMovie> filmmakerMovies = new ArrayList<FilmmakerMovie>();//�����µ�list
        for(int i=0; i<filmmakerMovie.size(); i++){
        	FilmmakerMovie fm = filmmakerMovie.get(i);  //��ȡ���뼯�϶����Ԫ��
            if(!filmmakerMovies.contains(fm)){   //�鿴�¼������Ƿ���ָ����Ԫ�أ����û�������
            	filmmakerMovies.add(fm);
            }
        }
        
        Map<Integer,Integer> mp = new HashMap<Integer,Integer>();
        
        for(FilmmakerMovie fm : filmmakerMovies){
        	if(mp.containsKey(fm.getFilmmakerID())){
        		mp.put(fm.getFilmmakerID(), mp.get(fm.getFilmmakerID()).intValue()+1);
        	}else{
        		mp.put(fm.getFilmmakerID(), 1);
        	}
        }
        List<CompanyFilmmaker> cfs = new ArrayList<CompanyFilmmaker>();
        Iterator<Map.Entry<Integer,Integer>> it = mp.entrySet().iterator();
        while(it.hasNext()){
        	Map.Entry<Integer, Integer> entry = it.next();
        	Filmmaker filmmaker = filmmakerDao.getFilmmakerByID(entry.getKey());
        	CompanyFilmmaker cf = new CompanyFilmmaker(filmmaker,entry.getValue());
        	cfs.add(cf);
        }
        
        Collections.sort(cfs);
       

		return cfs;
	}

	@Override
	public FilmmakerResetType resetFilmmaker(Filmmaker filmmaker) {

		Connection conn = null;
		FilmmakerResetType filmmakerResetType = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			Integer getFilmmaker = filmmakerDao.getFilmmakerByName(filmmaker.getFilmmakerName()); //�ж�Ӱ���Ƿ����.
			if((getFilmmaker == null)||(getFilmmaker==filmmaker.getFilmmakerID())){ //���Ӱ�˲����ڣ�����Ӱ������Ϊ��������
				filmmakerDao.updateFilmmaker(conn,filmmaker);//����Ӱ����Ϣ
				filmmakerJobDao.deleteFilmmakerJob(conn,filmmaker.getFilmmakerID());
				List<Job> jobs = filmmaker.getJobList();
			
				for(Job job : jobs){
					filmmakerJobDao.saveFilmmakerJob(conn,filmmaker.getFilmmakerID(),job.getJobID());
				}
				filmmakerResetType = FilmmakerResetType.ResetSuccess;
			}else{
				filmmakerResetType = FilmmakerResetType.FilmmakerNameExist;
			}
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			filmmakerResetType = FilmmakerResetType.ResetFailed;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return filmmakerResetType;
	
	}

	@Override
	public boolean deleteFilmmaekr(Integer filmmakerID) {
		Connection conn = null;
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			filmmakerJobDao.deleteFilmmakerJob(conn,filmmakerID);
			filmmakerMovieDao.deleteFilmmakerMovieByFilmmaker(conn,filmmakerID);
			filmmakerDao.deleteFilmmakerByID(conn,filmmakerID);
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return false;
		}
		return true;
	}
	
}
