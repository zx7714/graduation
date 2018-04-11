package com.zx.test;

import static org.junit.Assert.fail;
import org.junit.Test;
import com.zx.dao.CommentDao;


public class CommentDaoTest {
	CommentDao cd = new CommentDao();
	@Test
	public void testGetCommentByUser() {
		System.out.println(cd.getCommentByUser(2,0));
	}

	@Test
	public void testGetCommentByMovie() {
	
	}

	@Test
	public void testSaveMovieComment() {/*
		Format f = new SimpleDateFormat("yyyy-mm-dd");
		Date d = null;
		try {
			d = (Date) f.parseObject("2017-10-24");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		Comment comment = new Comment();
		comment.setCommentTitle("好好");
		comment.setCommentContent("不错不错");
		comment.setCommentDate(d);
		Movie movie = new Movie();
		movie.setMovieID(2);
		User user = new User();
		user.setUserID(3);
		comment.setMovie(movie);
		comment.setUser(user);
		cd.saveMovieComment(comment);
	*/}

	@Test
	public void testDeleteCommentByID() {
		//cd.deleteCommentByID(1);
	}

	@Test
	public void testGetCommentIDByMovie() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteCommentByMovie() {
		//cd.deleteCommentByMovie(3);
	}

}
