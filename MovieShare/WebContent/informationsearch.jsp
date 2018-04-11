<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.zx.javabean.*,java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri= "/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>信息搜索</title>
<style type="text/css">
	.shadow{
		text-shadow: 1px 1px 0px #00BFFF;
		font-weight:bold;
	}
	a:hover{text-decoration:none;}
	a:visited {text-decoration:none;}
	a:active {text-decoration:none;}
	a:link {text-decoration:none;}
</style>
</head>
<body>
	<div id="head">
		<div>
			<nav class="navbar navbar" role="navigation" style="min-width: 680px">
				<div class="container-fluid" style="background-color:white;" >
   					<div>
        				<ul class="nav navbar-nav pull-right" >
            				<li class="active"><a href="index.jsp"">首页</a></li>
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
                    				<li><a href="usercheck?userID=${sessionScope.user['userID']}&pageNo=0">个人信息</a></li>
                   				 	<li><a href="#">注销</a></li>
                					</ul>
            					</li>
            					</c:otherwise>
          					</c:choose>
       					 </ul>
   			 		</div>
				</div>
				<form action="search" method="post">
					<div id="search_div" align="center"  style="height: 60px;"align="center">
						<div style="width: 680px">
							<div class="shadow" style="color:blue;font-size:20px;float:left">漠影人&nbsp;</div>&nbsp;&nbsp;
            				<div style="float:left">
            					<input id="search" type="text" name="keyword" />
            					<input class="submit" type="submit" value="搜索"/>
            				</div>
            			</div>
 					</div>
 				</form>
			</nav>
		</div>
	</div>
	<div align="center"  >
		<div style="width: 650px">
			<div align="left">
				<h1>搜索&nbsp;"${keyword}"</h1>
				<div id="filmmaker">
					<table style="  border-collapse:separate;   border-spacing:3px; ">
						<c:forEach items="${search['filmmakerList']}" var="filmmaker">
							<tr>
								<td rowspan="3"><img src="${filmmaker['filmmakerPhoto']}"width="75" height="100" name="filmmakerPhoto" />&nbsp;</td>
								<th align="left" ><a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID'] }">&nbsp;${filmmaker['filmmakerName'] }</a></th>
							</tr>
							<tr>
								<td >
									&nbsp;<c:forEach items="${filmmaker['jobList']}"  var="job">${job['jobName'] }</c:forEach>
								</td>
							</tr>
							<tr>
								<td >&nbsp;${filmmaker['filmmakerBirth'] }</td>
							</tr>
						</c:forEach>
					</table>
					<s:if test="#application.search.filmmakerList.size!=0">
						<div align="right">>>搜索到的叫"${keyword }"的影人</div>
					</s:if>
				</div>
				<div id="movie">
					
					<table style="  border-collapse:separate;   border-spacing:5px; ">
						<s:iterator value="#application.search.movieList" >
							
							<tr>
								<td rowspan="4"><img src="${movieCover}" width="75"height="100" /></td>
								<th align="left"><a href="checkmovie?movieID=${movieID}">${movieName}</a></th>
								<td>&nbsp;</td>
							</tr>
							<tr>	
								<td style="font-size:13px"> 
									<c:choose>
										<c:when test="${movieScoreNum eq null}">
										<span >该影片暂无短评</span>
										</c:when>
										<c:otherwise>
											<span style="color:#D2691E">${movieEveryScore}</span>（${movieScoreNum}人评价）
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>
									导演:
										<s:iterator value="filmmakerList">
											<s:iterator value="jobList">
												<c:if test="${jobName eq '导演' }">
													${filmmakerName }
												</c:if>
											</s:iterator>
										</s:iterator>
									&nbsp;
									主演:
									<s:iterator value="filmmakerList">
										<s:iterator value="jobList">
											<c:if test="${jobName eq '演员' }">
												${filmmakerName }
											</c:if>
										</s:iterator>
									</s:iterator>	
									&nbsp;类型：
									<s:iterator value="typeList">
									 	${typeName }&nbsp;
									 </s:iterator>
								</td>
							</tr>
							<tr>
								<td>&nbsp;${movieDate}</td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>