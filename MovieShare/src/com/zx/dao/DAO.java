package com.zx.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import com.zx.utils.JdbcUtils;

public class DAO<T> {
	private QueryRunner queryRunner = new QueryRunner();
	private Class<T> clazz;

	@SuppressWarnings("unchecked")
	public DAO() {
		Type superClass = getClass().getGenericSuperclass();

		if (superClass instanceof ParameterizedType) {
			ParameterizedType parameterizedType = (ParameterizedType) superClass;
			Type [] typeArgs = parameterizedType.getActualTypeArguments();
			if(typeArgs!=null&&typeArgs.length>0){
				if(typeArgs[0] instanceof Class){
					clazz = (Class<T>)typeArgs[0];
				}
			}
		}
	}
	
	public long update(Connection conn,String sql,Object ... args) throws SQLException{
		return queryRunner.update(conn, sql, args);
	}
	
	public T queryBean(String sql,Object ... args){
		Connection conn=null;
		try {
			conn = JdbcUtils.getConnection();
			return queryRunner.query(conn, sql, new BeanHandler<>(clazz),args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return null;
	}
	
	public List<T> queryList(String sql,Object ... args){
		Connection conn = null;
		try {
			conn = JdbcUtils.getConnection();
			return queryRunner.query(conn, sql, new BeanListHandler<>(clazz), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public <E>E queryValue(String sql,Object ... args){
		Connection conn = null;
		try {
			conn = JdbcUtils.getConnection();
			return (E)queryRunner.query(conn, sql, new ScalarHandler<>(), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection(conn);
		}
		return null;
	}
}
