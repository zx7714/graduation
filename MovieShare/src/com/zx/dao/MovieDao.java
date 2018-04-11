package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.daointerface.IMovieDao;
import com.zx.javabean.Movie;

public class MovieDao extends DAO<Movie> implements IMovieDao {
	//����ӰƬID��ȡӰƬ
	@Override
	public Movie getMovieByID(Integer movieID) {
	
		String sql = 
				"select m.movieID,m.movieName,m.movieCover,m.movieDescribe,"
				+ "m.movieLong,m.movieDate,"
				+ "m.movieLanguage,ms.movieScoreNum,"
				+ "ms.movieEveryScore "
				+ "from movieinformationlist m "
				+ "left join moviescore ms "
				+ "on m.movieID = ms.movieID "
				+ "where m.movieID = ?";
		Movie movie = queryBean(sql, movieID);
		return movie;
	}
	//���ݹؼ��ֲ�ѯӰƬ
	@Override
	public List<Movie> getMovieByKeyword(String keyword) {
		String sql = 
				"select m.movieID,movieName,"
				+ "movieCover,movieDescribe,"
				+ "movieLong,movieDate,movieLanguage,"
				+ "movieScoreNum,movieEveryScore "
				+ "from movieinformationlist m "
				+ "left join moviescore ms "
				+ "on m.movieID = ms.movieID "
				+ "where movieName LIKE ?";
		return queryList(sql,"%"+keyword+"%");
	}
	//����ӰƬIDɾ��ӰƬ
	@Override
	public boolean deleteMovieByID(Connection conn,Integer movieID) throws SQLException {
		String sql = "delete from movieinformationlist where movieID = ?";
		long low = update(conn,sql, movieID);
		if(low!=0)
			return true;
		else
			return false;
	}
	//����ӰƬ����ȡӰƬ
	@Override
	public Movie getMovieByName(String movieName) {
		String sql =
				"select m.movieID,movieName,"
				+ "movieCover,movieDescribe,"
				+ "movieLong,movieDate,movieLanguage,"
				+ "movieScoreNum,movieEveryScore "
				+ "from movieinformationlist m,moviescore ms "
				+ "where m.moiveID = ms.movieID "
				+ "and movieName = ?";
		Movie movie = queryBean(sql, movieName);
		if(movie.getMovieEveryScore()==0){
			movie.setMovieScoreNum(0);
			movie.setMovieEveryScore(0);
		}
		return movie;	
	}
	//����ӰƬ��Ϣ
	@Override
	public boolean updateMovie(Connection conn,Movie movie) throws SQLException {
		String sql = 
				"update movieinformationlist "
				+ "set movieName = ?,movieCover = ?,"
				+ "movieDescribe = ?,movieLong = ?,"
				+ "movieDate = ?,movieLanguage = ? "
				+ "where movieID = ?";	
		long low = update(
				conn,sql,
				movie.getMovieName(),movie.getMovieCover(),
				movie.getMovieDescribe(),movie.getMovieLong(),
				movie.getMovieDate(),movie.getMovieLanguage(),
				movie.getMovieID()
				);
		if(low!=0)
			return true;
		else 
			return false;
	}
	//����ӰƬ
	@Override
	public boolean saveMovie(Connection conn,Movie movie) throws SQLException {
		String sql = 
				"insert into "
				+ "movieinformationlist(movieName,movieCover,"
				+ "movieDescribe,movieLong,movieDate,movieLanguage) "
				+ "values(?,?,?,?,?,?)";
		long low = update(conn,sql, movie.getMovieName(),movie.getMovieCover(),movie.getMovieDescribe(),
				movie.getMovieLong(),movie.getMovieDate(),movie.getMovieLanguage());
		if(low!=0)
			return true;
		else 
			return false;
	}
	//�������ڻ�ȡӰƬ
	public List<Movie> getMovieByDate(String startT,String endT,int beginNum){
		String sql = 
				"select movieID,movieName,movieCover "
				+"from movieinformationlist "
				+"where movieDate "
				+"between ? and ? limit ?,5";
		return queryList(sql, startT,endT,beginNum);
	}
	//�������ڻ�ȡ��ҳҳ��
	public int getTotalPages(String startT,String endT){
		String sql = "select count(*)"+
				"from movieinformationlist "+
				"where movieDate between ? and ?";
		long low=queryValue(sql, startT,endT);
		return (int)(low%5==0?low/5:low/5+1);
	}
	//����Ӱ�˻�ȡӰƬ
	public List<Movie> getMovieByFilmmaker(Integer filmmakerID){
	
		String sql = 
				"select M.movieID,M.movieName,"
				+"M.movieCover,M.movieDescribe,"
				+"M.movieLong,M.movieDate,"
				+"M.movieDate,ms.movieEveryScore "
				+"from movieinformationlist M "
				+"inner join filmmakermovielist FM "
				+"on M.movieID = FM.movieID "
				+"left join moviescore ms "
				+"on M.movieID = ms.movieID "
				+"where FM.filmmakerID = ? "
				+"order by movieDate desc";
		return queryList(sql, filmmakerID);
	}
	//����Ӱ����ȡӰƬ
	public Movie getMovieByComment(Integer commentID) {	
		String sql = 
				"select m.movieID,m.movieName,"
				+ "m.movieCover,m.movieDate,"
				+ "m.movieLong,m.movieLanguage "
				+ "from moviecommentlist mc,movieinformationlist m "
				+ "where m.movieID = mc .movieID "
				+ "and mc.commentID = ?";
		Movie movie = queryBean(sql, commentID);
		return movie;
	}
	//�������ֻ�ȡӰƬ
	@Override
	public List<Movie> getMvoieBySocre() {
		String sql = 
				"select m.movieID,movieName,movieCover,movieEveryScore "
				+ "from movieinformationlist m "
				+ "left join moviescore ms "
				+ "on m.movieID = ms.movieID "
				+ "order by movieEveryScore desc "
				+ "limit 0,10";
		return queryList(sql);
	}
	//���ݹؼ�������ӰƬ
	@Override
	public List<Movie> getMovieAndFilmmakerMovieByKeyword(String keyword) {

		
		String sql = "select m.movieID,movieName,movieCover,movieDescribe,movieLong,movieDate,movieLanguage,movieScoreNum,movieEveryScore "
				+ "from movieinformationlist m "
				+ "left join moviescore ms "
				+ "on m.movieID = ms.movieID "
				+ "where movieName like ? "
				+ "OR m.movieID = any(select fm.movieID "
				+ 				"from filmmakermovielist fm "
				+ 				"where filmmakerID = any(select f.filmmakerID "
				+ 									"from filmmakerinformationlist f "
				+ 									"where f.filmmakerName like ?))";
		return queryList(sql,"%"+keyword+"%","%"+keyword+"%");
	
	}
	//�������ͻ�ȡӰƬ
	@Override
	public List<Movie> getMovieByType(Integer typeID) {
		String sql="";
		if(typeID == 0){
			sql="select m.movieID,movieName,movieCover,"
					+ "movieScoreNum,movieEveryScore "
					+ "from movieinformationlist m "
					+ "left join moviescore ms "
					+ "on m.movieID = ms.movieID "
					+ "order by movieScoreNum desc "
					+ "limit 0,10";
			return queryList(sql);
		}else{
			sql = 
				"select m.movieID,movieName,movieCover,movieScoreNum,movieEveryScore "
				+"from movieinformationlist m "
				+"inner join movietypelist t "
				+"on m.movieID = t.movieID "
				+"left join moviescore ms "
				+"on m.movieID = ms.movieID "
				+"where typeID = ? "
				+"order by ms.movieScoreNum desc "
				+"limit 0,10";
			return queryList(sql, typeID);
		}
		
	}
	
}
