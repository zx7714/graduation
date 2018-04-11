package com.zx.utils;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	
	private static DataSource dataSource;
	
	static{
		dataSource = new ComboPooledDataSource("movieshare");
	}
	
	public static Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
	public static void closeConnection(Connection conn){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void connRollBack(Connection conn){
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}