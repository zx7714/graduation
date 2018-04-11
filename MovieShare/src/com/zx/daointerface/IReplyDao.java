package com.zx.daointerface;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.zx.javabean.Reply;

public interface IReplyDao {
	public List<Reply> getReplyByComment(Integer commentID);

	boolean saveCommentReply(Connection conn, Reply reply) throws SQLException;
	boolean deleteReplyByComment(Connection conn, Integer commentID) throws SQLException;
}
