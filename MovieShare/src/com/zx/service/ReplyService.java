package com.zx.service;

import java.sql.Connection;

import com.zx.dao.ReplyDao;
import com.zx.javabean.Reply;
import com.zx.serviceinterface.IReplyService;
import com.zx.utils.JdbcUtils;

public class ReplyService implements IReplyService{
	private ReplyDao replyDao = new ReplyDao();
	
	public boolean replyComment(Reply reply){
		Connection conn = null;	
		try{
			conn = JdbcUtils.getConnection();
			conn.setAutoCommit(false);
			replyDao.saveCommentReply(conn,reply);
			conn.commit();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			JdbcUtils.connRollBack(conn);
			return false;
		}finally{
			JdbcUtils.closeConnection(conn);
		}
	}
}
