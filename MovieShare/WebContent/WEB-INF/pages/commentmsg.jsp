<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#sub{
		border: 0px solid #66CD00;
		background-color:blue;
		font-size:15px; 
		height:20px;
		color:white;
		}
</style>
</head>
<body>
	<div></div>
	<div></div>
	<div>
		<c:if test="${commentRes}">
			<script type="text/javascript">
				alert("发表成功");
				window.location.href="checkmovie?movieID="+${movieID};
			</script>
		</c:if>
		<c:if test="${!commentRes}">
			<script type="text/javascript">
				alert("发表失败");
				window.location.href="checkmovie?movieID="+${movieID};
			</script>
		</c:if>
		<%-- <s:action name="checkmovie" namespace="/">
			<s:param name="movieID" value="#application.movieID"></s:param>
		</s:action> --%>
		<h3>评价：${movie['movieName'] }</h3>
		<form action="commentmovie" method="post">
		<div>
			<input type="text" name="commentTitle" maxlength="50" style="width:1000px;font-size:18px; height:20px;border:none" value="添加标题"/>
			<input type="hidden" name="userID" value="7"/>
			
			<input type="hidden" name="movieID" value="${movie['movieID']}">
			<input type="submit" value="发表" id="sub"/>
			
		</div>
		<div><input type="checkbox" value="yes" name="ifSpoiler"/><lable>本文涉及剧透</lable></div>
		<div>
			<textarea id="content_tt" name="commentContent"></textarea>
		</div>

		</form>
	</div>
</body>
<script type="text/javascript">
	CKEDITOR.replace('content_tt');
</script>
</html>