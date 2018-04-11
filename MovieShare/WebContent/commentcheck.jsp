<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/head.css">
<title>Insert title here</title>
<style type="text/css">
.shadow {
	text-shadow: 1px 1px 0px #00BFFF;
	font-weight: bold;
}
	a:link {text-decoration:none;} 
	a:visited {text-decoration:none;}
	a:hover {text-decoration:none;}
	a:active {text-decoration:none;}
</style>
</head>
<body>
	<div id="head">
		<div>
			<nav class="navbar navbar" role="navigation" style="min-width: 680px">
			<div class="container-fluid" style="background-color: white;">
				<div>
					<ul class="nav navbar-nav pull-right">
						<li class="active"><a href="index.jsp">首页</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.user['userName'] }">
								<li class="active"><a href="userlogin.jsp?score=comment">登录</a></li>
								<li class="active"><a href="userregist.jsp">注册</a></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown"><a href="#"
									class="dropdown-toggle pull-right" data-toggle="dropdown">
										${sessionScope.user['userName'] }的账号
										<b class="caret"></b>
								</a>
									<ul class="dropdown-menu pull-right" style="min-width: 5%;">
										<li><a
											href="usercheck?userID=${sessionScope.user['userID']}&pageNo=0">个人信息</a></li>
										<li><a href="logoff">注销</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<form action="search" method="post">
				<div id="search_div" align="center" style="height: 60px;"
					align="center">
					<div style="width: 700px">
						<div class="shadow"
							style="color: blue; font-size: 20px; float: left">漠影人&nbsp;</div>
						&nbsp;&nbsp;
						<div style="float: left">
							<input id="search" type="text" name="keyword" /> <input
								class="submit" type="submit" value="搜索" />
						</div>
					</div>
				</div>
			</form>
			</nav>
		</div>
	</div>
	<div align="center">
		<div style="width: 700px">
			<div style="float: right;width: 120px;height:0px;" align="left">
				<a href="checkmovie?movieID=${comment.movie['movieID']}">>${comment.movie['movieName']}</a>
				<div>
					<img src="${comment.movie['movieCover']}" width="120px" height="160px"/>
				</div>
				<div style="font-size: 11px;margin-left: 2px">
					<div>导演:
						<c:set var="dir" scope="page" value="0"/>
						<c:forEach items="${comment.movie['filmmakerList']}" var="filmmaker">
							<c:forEach items="${filmmaker['jobList']}" var="job">
								<c:if test="${job['jobName'] eq '导演'}">
									<c:choose>
										<c:when test="${dir==0}">
											<c:set var="dir" scope="page" value=""/>
										</c:when>
										<c:otherwise>
											/
										</c:otherwise>
									</c:choose>
									${filmmaker['filmmakerName']}
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
						<div>主演：
							<c:set var="act" scope="page" value="0"/>
							<c:forEach items="${comment.movie['filmmakerList']}" var="filmmaker" >
								<c:forEach items="${filmmaker['jobList']}" var="job">
									<c:if test="${job['jobName'] eq '演员'}">
										<c:choose>
											<c:when test="${act==0}">
												<c:set var="act" scope="page" value="1"/>
												${filmmaker['filmmakerName']}
											</c:when>
											<c:otherwise>
												/${filmmaker['filmmakerName']}
											</c:otherwise>
										</c:choose>
										
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
						<div>
							类型：
							<c:forEach items="${comment.movie['typeList']}" var="type" varStatus="s">
								<c:choose>	
									<c:when test="${s.index==0 }">
										${type['typeName']}
									</c:when>
									<c:otherwise>
										/${type['typeName']}
									</c:otherwise>
								</c:choose>	
							</c:forEach>
						</div>
						<div>语言：${comment.movie['movieLanguage'] }</div>
						<div>上映日期：${comment.movie['movieDate'] }</div>
						<div>片长：${comment.movie['movieLong'] }分钟</div>
				</div>
			
			</div>
			<div align="left">
				<div id="comment_con" style="width: 570px">
					<h3 style="word-break: break-all; word-wrap: break-word;">${comment['commentTitle'] }</h3>
					<div style="font-size: 11px">
						<span style="color: #4169E1">${comment.user['userName'] }</span>
						&nbsp;<span style="color: #696969">评论</span>&nbsp; <a
							href="checkmovie?movieID=${comment.movie.movieID}">${comment.movie.movieName}</a>
						&nbsp;<span style="color: #696969">${comment['commentDate']}</span>
					</div>

					<div
						style="word-break: break-all; word-wrap: break-word; margin-top: 10px; font-size: 13px; margin-bottom: 20px">
						${comment['commentContent']}</div>
					<div
						style="width: 100%; height: 2px; border-top: 1px solid #A9A9A9; clear: both;"></div>
				</div>
				<div style="font-size: 11px; margin-top: 5px">©本文版权归作者&nbsp;${comment.user['userName'] }&nbsp;所有，任何形式转载请联系作者。
				</div>

				<div id="comment_reply"
					style="margin-top: 20px; margin-bottom: 20px; width: 570px">
					<div style="color: #696969">回应：</div>
					
					<div style="margin-top: 10px; margin-bottom: 20px">
						<c:if test="${empty comment.replyList}">
							<div style="color: #696969;font-size:12px">>>這篇影評還沒有回復。</div>
						</c:if>	
						<%-- <s:iterator value="#application.comment.replyList">
							<div style="color: blue; background-color: #C0D9D9">
								<s:property value="user.userName" />
								&nbsp;于&nbsp;
								 20<s:property value="replyDate" />
								发表
							</div>
							<div style="margin-top: 7px; margin-bottom: 10px">
								&nbsp;
								<s:property value="replyContent" />
							</div>
						</s:iterator> --%>
						<c:forEach items="${comment.replyList}" var="reply">
							<div style="clear: both;min-height: 70px;margin-top: 5px">
								<div style="float: left;margin-right: 10px">
									<img src="img/default.jpg" width="45px" height="45px">
								</div>
								<div style="float: left;width: 500px">
									<div style="background-color:#AFEEEE;margin-bottom: 5px">
										&nbsp;${reply.userName}&nbsp;&nbsp;${reply.replyDate }	
									</div>
									<div style="margin-left: 15px;word-break: break-all; word-wrap:break-word;
									font-size:13px">
										<c:if test="${not empty reply.beReplyUserName}">
										//@${reply.beReplyUserName}：${reply.beReplyContent}
										</c:if>
									</div>
									<div id="${reply.replyID }" style="margin-top: 5px">
										&nbsp;${reply.replyContent }
									</div>
									<div  align="right">
										<a id="reply" onclick="replyHe(${reply.replyID})" href="javascript:;">回复</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div style="width: 570px">
					
					
					<c:if test="${!empty sessionScope.user}">
						<div style="width: 100%; height: 2px; border-top: 1px solid #A9A9A9; clear: both;"></div>
						
						<input type="hidden" id="replyWho" value="0"/>
						<div id="user_reply" style="margin-top: 20px;">
							<div id="beReplyContent" style="background-color:#AFEEEE"></div>	
							<div style="margin-bottom: 5px;margin-top: 3px;font-size: 12px">给他/她回应： </div>
							<div>
								<textarea id="reply_content" style="resize: none;width: 570px;"cols="80" rows="5" name="replyContent"></textarea>
							</div>
							<div style="margin-top: 5px">
								<button id="btn_reply" type="button">加上去</button>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div>
		<hr>
	</div>
</body>
<script type="text/javascript">
	function replyCheck() {
		var replyContent = $("#reply_content").val();
		if (replyContent == "") {
			alert("回复不能为空");
		} else if (repluContent.length < 140) {
			alert("回复内容请在140字之内");
		} else {
			return true;
		}
		return false;
	}
	$(function(){
		$("#btn_reply").click(function(){
			var replyContent = $("#reply_content").val();
			if (replyContent == ""||replyContent.length > 140) {
				alert("回复内容请在1-140字之間")
			}else{
				$.ajax({
					url:"reply?userID=${sessionScope.user.userID}"
						+"&commentID=${comment['commentID']}"
						+"&replyContent="+replyContent
						+"&replyWho="+$("#replyWho").val(),
					type:"get",
					typeDate:"json",
					success:function(date){
						if(date.res=="success"){
							$("#replyWho").val(0);
							$("#reply_content").val(""); 
							window.location.reload();
						}else{
							$("#replyWho").val(0);
							alert("回復失敗");
						}
					}
				})
			}
		})
		$("#beReplyContent").on("click","a",function(){
			$("#beReplyContent").html("");
			$("#replyWho").val(0);
			$("#reply_content").focus();
		})
	})
	function replyHe(obj){
		$("#beReplyContent").html("&nbsp;@回复："+$("#"+obj).text()+
								"&nbsp;<a href='javascript:;' id='off'>取消</a>");
		$("#replyWho").val(obj);
		$("#reply_content").focus();
	}
</script>
</html>