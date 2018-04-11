package com.zx.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import com.zx.daointerface.IReplyDao;
import com.zx.javabean.Reply;
import com.zx.javabean.User;

public class ReplyDao extends DAO<Reply> implements IReplyDao {
	@Override
	public boolean saveCommentReply(Connection conn ,Reply reply) throws SQLException {
		String sql;
		long low;
		if(reply.getReplyWhich()==null){
			sql = "insert into "
				+"commentreplylist(replyContent,replyDate,userID,commentID) "
				+"values(?,now(),?,?)";
			Object[] obj = {reply.getReplyContent(),
					reply.getUserID(),
					reply.getCommentID()};	
			low = update(conn,sql, obj);
		}else{
			sql = "insert into "
				+"commentreplylist(replyContent,replyDate,userID,commentID,replyWhich) "
				+"values(?,now(),?,?,?)";
				Object[] obj = {reply.getReplyContent(),
						reply.getUserID(),
						reply.getCommentID(),
						reply.getReplyWhich()};	
				low = update(conn,sql, obj);
		}
		
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteReplyByComment(Connection conn,Integer commentID) throws SQLException {
		String sql = "delete from commentreplylist where commentID = ?";
		long low = update(conn,sql, commentID);
		if(low!=0)
			return true;
		else
			return false;
	}

	@Override
	public List<Reply> getReplyByComment(Integer commentID) {
		String sql = 
				"select r1.replyID,r1.userID,"
				+ "r1.replyContent,"
				+ "r1.replyWhich,"
				+ "r2.userID beReplyUser,r2.replyContent beReplyContent,"
				+ "r1.commentID,r1.replyDate "
				+"from commentreplylist r1 "
				+"left join commentreplylist r2 "
				+"on r1.replyWhich = r2.replyID "
				+"where r1.commentID = ? "
				+ "order by r1.replyDate";	
		String sql1 = 
				"select userName from userinformationlist where userID = ?";
		List<Reply> replys = queryList(sql, commentID);
		Iterator<Reply> it = replys.iterator();
		while(it.hasNext()){
			Reply reply = it.next();
			String userName = queryValue(sql1, reply.getUserID());
			String beReplyUserName = queryValue(sql1, reply.getBeReplyUser());
			reply.setUserName(userName);
			reply.setBeReplyUserName(beReplyUserName);
		}
		return replys;
	}

}
