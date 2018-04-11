<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/head.css">
<title>Insert title here</title>
<style type="text/css">
	  #mo_list{
		display:block;
		white-space:nowrap;
		margin:0px;
		padding:0px;
	}
	#mo_list li{
	margin:5px;	
	display:inline-block;
	}
	/* #mo_list li a:link {color: white} 
	#mo_list li a:visited {color: white}
	#mo_list li a:hover {color: white}
	#mo_list li a:active {color: white} */
	
	#photo_a:link {color: white} 
	#photo_a:visited {color: white}
	#photo_a:hover {color: white}
	#photo_a:active {color: white}
	
	#mo_na_p{
	width: 120px;
	height:20px;
   	overflow: hidden;
    text-align:center;
	}
	#score_sp{
		color:#d9b611;
	}
	.shadow{
		text-shadow: 1px 1px 0px #00BFFF;
		font-weight:bold;
	}
</style>
</head>
<body>
<div id="head">
		<div >
			<nav class="navbar navbar" role="navigation" style="min-width: 680px">
				<div class="container-fluid" style="background-color:white;" >
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
	<div align="center">
		<div style="width: 680px">
			<div align="left">
				<div id="fim_info">
					<h2>${gfilmmaker['filmmakerName']}</h2>
					<div style="float: left; margin-right: 20px">
						<img src="${gfilmmaker['filmmakerPhoto']}" width="150px" height="200px" />
						<p align="center"><span>照片</span></p>
					</div>
					<div style="float: left; margin-right: 50px" id="info">
						<p>性别:${gfilmmaker['filmmakerSex']}</p>
						<p>出生地：${gfilmmaker['filmmakerBirthPlace']}</p>
						<p>出生日期：${gfilmmaker['filmmakerBirth']}</p>
						<p><label>职业：<!-- 导演/演员 --></label>
							<s:iterator value="#application.gfilmmaker.jobList" status="st">
								<s:property value="st.index"/>
								<s:if test="#st.index==0">
									<s:property value="jobName"/>
								</s:if>
								<s:else>/&nbsp;<s:property value="jobName"/></s:else>
							</s:iterator> 
						</p>
					</div>
					<div id="des" style="clear: both;width: 650px;word-break: break-all; word-wrap:break-word;">
						<hr>
						<label>介绍：</label>
						<p>${gfilmmaker['filmmakerDescribe']}</p>
						<hr>
					</div>
				</div>
				<div id="last_movie">
					<div style="margin-bottom: 15px;font-size:15px">最近5部作品···········································</div>
					<ul id="mo_list" >
						<s:iterator value="#application.lastmovie" status="d" begin="0" step="1"> 
							<s:if test="#d.index<5">
								<li >
									<a id="photo_a" href="checkmovie?movieID=<s:property value="movieID"/>">
										<img src="<s:property value="movieCover" /> "  width="120px" height="150px"/>
									</a>
									<p id="mo_na_p">
										<s:property value="movieName"/>&nbsp;<span id="score_sp">
										<s:property value="movieEveryScore"/></span>
									</p>
								</li>
							</s:if>
						</s:iterator>
					</ul>
				</div>
				<div id="best_movie">
					<div style="margin-bottom: 15px;font-size:15px">最受欢迎5部作品·······································</div>
					<ul id="mo_list">
						<s:iterator value="#application.bestmovies" status="d" begin="0"  step="1"> 
						<s:if test="#d.index<5">
								<li >
									<a id="photo_a" href="checkmovie?movieID=<s:property value="movieID"/>">
										<img src="<s:property value="movieCover" /> "  width="120px" height="150px"/>
									</a>
									<p id="mo_na_p"><s:property value="movieName"/>&nbsp;<span id="score_sp"><s:property value="movieEveryScore"/></span></p>
								</li>
							</s:if>
						</s:iterator>
					</ul>
				</div>
				<div id="work_together" >最多合作影人
					<ul id="mo_list">
						<s:iterator value="#application.cfilmmakers" > 
							<li>
								<a id="photo_a"  href="checkfilmmaker?filmmakerID=<s:property value="filmmakerID"/>">
									<img src="${filmmaker['filmmakerPhoto'] }"  width="120px" height="150px"/>
								</a>
								<div id="mo_na_p"><a href="#" id="name_a"><s:property value="filmmaker.filmmakerName"/></a></div>
								<div id="mo_na_p">&nbsp;合作次数<label>（<s:property value="companyCount"/>）</label></div>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="foot">
		<hr>
		&nbsp;
	</div>
</body>
</html>