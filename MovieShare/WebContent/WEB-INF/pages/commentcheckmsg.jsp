<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="s" uri="/struts-tags" %>
  <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div></div>
	<div></div>
	<c:if test="${applicationScope.replyRes }">
		<script type="text/javascript">
				alert("回复成功。");
				window.location.href="commentcheck?commentID="+${commentID };
			</script>
	</c:if>
	<c:if test="${!applicationScope.replyRes }">
		<script type="text/javascript">
				alert("回复失败。");
				window.location.href="commentcheck?commentID="+${commentID };
			</script>
	</c:if>
	<div>
		<div>
			<h1>${comment['commentTitle'] }</h1>
			<span>${comment.user['userName'] }&nbsp;评论&nbsp;${comment.movie['movieName'] }</span>
		</div>
		<div>
			${comment['commentContent']}
		</div>
		<hr>
		<div>
			<s:iterator value="#application.comment.replyList">
				<table>
					<tr>
						<td><s:property value="user.userName"/>&nbsp; <s:property value="replyDate"/>发表</td>
					</tr>
					<tr>
						<td><s:property value="replyContent"/></td>
					</tr>
				</table>
			</s:iterator>	
		</div>

		<div>
			<form action="reply" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userID" value="3"/>
				<input type="hidden" name="commentID"  value="${comment['commentID'] }">
				<textarea cols="50" rows="5" name="replyContent"></textarea>
				<br>
				<input type="submit" value="加上去" />
			</form>
		</div>
	</div>
</body>
</html>