package com.zx.serviceinterface;

import java.util.List;

import com.zx.javabean.CompanyFilmmaker;
import com.zx.javabean.Filmmaker;
import com.zx.javabean.Job;
import com.zx.utils.FilmmakerResetType;
import com.zx.utils.FilmmakerType;

public interface IFilmmakerService {
	public List<Job> getJob();
	public FilmmakerType addFilmmaker(Filmmaker filmmaker);
	public Filmmaker checkFilmmaker(Integer filmmakerID);
	public List<CompanyFilmmaker> getConnectFilmmaker(Integer filmmakerID);
	public FilmmakerResetType resetFilmmaker(Filmmaker filmmaker);
	public boolean deleteFilmmaekr(Integer filmmakerID);
}
