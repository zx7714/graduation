<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ifSuccess }">
		<script type="text/javascript">
			alert("修改成功");
			window.location.href="usercheck?userID="+${sessionScope.user['userID']};
		</script>
	</c:if>
	<c:if test="${not ifSuccess }">
		<script type="text/javascript">
			alert("修改失败");
			window.location.href="editpsd";
		</script>
	</c:if>
</body>
</html>