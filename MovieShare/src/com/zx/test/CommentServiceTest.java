package com.zx.test;
import org.junit.Test;
import com.zx.service.CommentService;
public class CommentServiceTest {
	CommentService sc = new CommentService();
	@Test
	public void testCommentMovie() {
		System.out.println(sc.getCommentByDate());
	}

	/*public void testCheckComment() {
		
		sc.checkComment(4);
	}
*/
}
