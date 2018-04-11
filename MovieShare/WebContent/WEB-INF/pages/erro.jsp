<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="head">
		<div>
			<nav class="navbar navbar" role="navigation">
				<div class="container-fluid" style="background-color:white;" >
   					<div>
        				<ul class="nav navbar-nav pull-right" >
            				<li class="active"><a href="#">首页</a></li>
            					<c:choose>
            						<c:when test="${empty sessionScope.user['userName'] }">
            							<li class="active"><a href="userlogin.jsp">登录</a></li>
           						 		<li class="active"><a href="userregist.jsp">注册</a></li>
            						</c:when>
            					<c:otherwise>
            	  					<li class="dropdown">
                						<a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown" >
                    						${sessionScope.user['userName'] }的账号 ${sessionScope.user['userID'] }<b class="caret"></b>
                						</a>
                						<ul class="dropdown-menu pull-right" style="min-width:5%;">
                    						<li><a href=" usercheck?userID=${sessionScope.user['userID']}">个人信息</a></li>
                   				 			<li><a href="#">注销</a></li>
                						</ul>
            						</li>
            					</c:otherwise>
          				  	</c:choose>
       				 	</ul>
   			 		</div>
				</div>
				<form action="search" method="post">
					<div id="search_div" align="center"  style="height: 50px;">
					<img src="img/logo.png" width="120px" height="30px"/>
            		<input id="search" type="text" name="keyword" />
            		<input class="submit" type="submit" value="搜索"/>
 					</div>
 				</form>
			</nav>
		</div>
	</div>
	<div align="center">
		<div style="width: 600px">
			<div>
				<h3>访问错误，你访问的页面不存在或已失效</h3>
			</div>
	
		</div>
	</div>
</body>
</html>