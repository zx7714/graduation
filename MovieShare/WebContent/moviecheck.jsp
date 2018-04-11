<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/head.css">
<script src="js/jquery.raty.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
a {
	text-decoration: none;
}

#model_div {
	color: green;
	font-size: 15px;
	margin-bottom: 20px;
}

#hint_div {
	color: #A8A8A8
}
#comment_div{
	height:60px; line-height:20px; overflow:hidden;
}
.myInput{
	border-radius:4px;
	border:1px solid #DBDBDB;
	height:40px;  
	width:300px;    
	}
#fi_list{
		display:block;
		white-space:nowrap;
		margin:0px;
		padding:0px;
	}
	#fi_list li{
	margin:5px;
	display:inline-block;
	}
	.shadow{
		text-shadow: 1px 1px 0px #00BFFF;
		font-weight:bold;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#res").hide();
		var num = ${cmovie['movieEveryScore']};
		$('#eve_score').raty({
			score : num/2,
			readOnly : true
		});
		$('#give_score').raty({
			hints : [ '极差', '很差', '还行', '推荐', '力推' ],
			target : '#mark_score',
			targetKeep : true,
			click : function(score, evt) {
				$('#modle_score').raty("score", score)
			}
		});
		$('#modle_score').raty({
			hints : [ '极差', '很差', '还行', '推荐', '力推' ],
			target : '#mark_score',
			score : 1,
			targetKeep : true,
			click : function(score, evt) {
				$('#give_score').raty("score", score)
			} 
		});
		
	})
	$(function(){
		$(".myInput").focus(function(){
			$(this).css("border-color","blue")
		})
		$(".myInput").blur(function(){
			$(this).css("border-color","black")
		})
		
	})
</script>
<script type="text/javascript">
	var one = ${cmovie.countMark.one}
	var two = ${cmovie.countMark.two}
	var three = ${cmovie.countMark.three}
	var four = ${cmovie.countMark.four}
	var five = ${cmovie.countMark.five}
	var total = ${cmovie.movieScoreNum}
	$(function(){
		$("#one").width(one/total*100)
		$("#two").width(two/total*100)
		$("#three").width(three/total*100)
		$("#four").width(four/total*100)
		$("#five").width(five/total*100)
	})
</script>


<title>影片查看</title>
</head>
<body>
	<s:if test="#application.res">
		<s:action name="checkmovie" namespace="/">
			<s:param name="movieID" value="#application.movieID"></s:param>
		</s:action>
	</s:if>
	<div id="head">
		<div>
			<nav class="navbar navbar" role="navigation" style="min-width: 680px">
				<div class="container-fluid" style="background-color:white;" >
   					<div>
        				<ul class="nav navbar-nav pull-right" >
            				<li class="active"><a href="index.jsp"">首页</a></li>
            				<c:choose>
            					<c:when test="${empty sessionScope.user['userName'] }">
            						<li class="active"><a href="userlogin.jsp?score=movie">登录</a></li>
           							 <li class="active"><a href="userregist.jsp">注册</a></li>
            					</c:when>
            				<c:otherwise>
            	  			<li class="dropdown">
                				<a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown" >
                    			${sessionScope.user['userName'] }的账号<b class="caret"></b>
                				</a>
                				<ul class="dropdown-menu pull-right" style="min-width:5%;">
                    				<li><a href="usercheck?userID=${sessionScope.user['userID']}&pageNo=0">个人信息</a></li>
                   					 <li><a href="logoff">注销</a></li>
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
	<div align="center">
		<div style="width:680px">
			<div align="left">
				<div>
					<div id="cover">
						<h2>${cmovie['movieName'] }</h2>
							<div style="float: left; margin-right: 20px">
							<img src="${cmovie['movieCover'] }" width="150px" height="200px" />
							<p align="center">
								<span>封面</span>
							</p>
					</div>
					<c:set var="dir" scope="page" value="0"/>
					<div style="float: left; margin-right: 50px;width: 200px" id="info">
						<p><label>导演:</label>
							<c:set var="dir" scope="page" value="0"/>
							<c:forEach items="${cmovie['filmmakerList']}" var="filmmaker">
								<c:if test="${filmmaker.filmmakerJob eq '导演' }">
									<c:choose>
										<c:when test="${dir==0}">
											<c:set var="dir" scope="page" value="1"/>
										</c:when>
										<c:otherwise>
											/
										</c:otherwise>
									</c:choose>
									<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID'] }">${filmmaker['filmmakerName'] }</a>
								</c:if>
							</c:forEach>
						</p>
						<p><label>主演：</label>
							<c:set var="act" scope="page" value="0"/>
							<c:forEach items="${cmovie['filmmakerList']}" var="filmmaker" >
								<c:if test="${filmmaker.filmmakerJob eq '演员' }">
									<c:choose>
										<c:when test="${act==0}">
											<c:set var="act" scope="page" value="1"/>
										</c:when>
										<c:otherwise>
											/
										</c:otherwise>
									</c:choose>
									<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID'] }">${filmmaker['filmmakerName'] }</a>
								</c:if>
							</c:forEach>
						</p>
						<p>
							类型：
							<c:forEach items="${cmovie['typeList']}" var="type" varStatus="s">
								<c:choose>
									
									<c:when test="${s.index==0 }">
										${type['typeName']}
									</c:when>
									<c:otherwise>
										/${type['typeName']}
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</p>
						<p>语言：${cmovie['movieLanguage'] }</p>
						<p>上映日期：${cmovie['movieDate'] }</p>
						<p>片长：${cmovie['movieLong'] }分钟</p>
					</div>
					<div style="float: left;">
						漠影人评分:
						<table>
							<tr>
								<th style="font-size: 50px">${cmovie['movieEveryScore']}&nbsp;</th>
								<td>
									<div id="eve_score"></div>
									<c:choose>
										<c:when test="${cmovie.movieScoreNum eq null }">
											该影片暂无短评
										</c:when>
										<c:otherwise>
											(${cmovie['movieScoreNum']}人评价)	
										</c:otherwise>
									</c:choose>
																	
								</td>
							</tr>
						</table>
						<div>
							<c:if test="${not empty cmovie.movieScoreNum}" >
								<table>
									<tr>
										<td>一星：</td>
										<td><div id="one" style="background-color:#FFCC00;height:10px;"></div></td>
									</tr>
									<tr>
										<td>二星：</td>
										<td><div id="two" style="background-color:#FFCC00;height:10px;"></div></td>
									</tr>
									<tr>
										<td>三星：</td>
										<td><div id="three" style="background-color:#FFCC00;height:10px;"></div></td>
									</tr>
									<tr>
										<td>四星：</td>
										<td><div id="four" style="background-color:#FFCC00;height:10px;"></div></td>
									</tr>
									<tr>
										<td>五星：</td>
										<td><div id="five" style="background-color:#FFCC00;height:10px;"></div></td>
									</tr>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<div style="clear: both;" id="opr">
					<table>
						<tr>
							<td>评价：</td>
							<td>								
								<c:choose>
									<c:when test="${sessionScope.user eq null }">
										<a href="#modle_log"  data-toggle="modal" style="text-decoration:none">
											<div id="give_score"></div>
										</a>									
									</c:when>
									<c:otherwise>
										<a href="#myModal"  data-toggle="modal" style="text-decoration:none">
											<div id="give_score"></div>
										</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					<p>	
						<c:choose>
							<c:when test="${sessionScope.user eq null }">
								<a href="#modle_log"  data-toggle="modal" style="text-decoration:none">写影评</a>
				 				<a href="#modle_log"  data-toggle="modal" style="text-decoration:none">写短评</a>				
							</c:when>
							<c:otherwise>
								<a href="writecomment">写影评</a>
				 				<a href="#myModal" data-toggle="modal" style="text-decoration: none">写短评</a>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div id="des">
					<label>${cmovie['movieName']}介绍：</label>
					<p>&nbsp;&nbsp; &nbsp; &nbsp;${cmovie['movieDescribe']}</p>
				</div>
				<!-- 影片中的影人 -->
				<div id="mf" style="margin-bottom: 30px;margin-top: 30px">
					<div id="model_div">${cmovie['movieName']}的影人·································</div>
					<ul id="fi_list">
						<c:forEach items="${cmovie['filmmakerList']}" var="filmmaker">
							<%-- <c:forEach items="${filmmaker['jobList']}" var="job">
								<c:if test="${job['jobName'] eq '导演'}">
									<li>
										<div>
											<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID']}">
												<img src="${filmmaker['filmmakerPhoto'] }"  width="120px" height="150px"/>
											</a>
										</div>
										<div align="center" style="margin-top:1px;margin-bottom: 1px">${filmmaker['filmmakerName']}</div>
										<div align="center" >导演</div>	
									</li>	
								</c:if>
							</c:forEach> --%>
							<c:if test="${filmmaker.filmmakerJob eq '导演' }">
								<li>
									<div>
										<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID']}">
											<img src="${filmmaker['filmmakerPhoto'] }"  width="120px" height="150px"/>
										</a>
									</div>
									<div align="center" style="margin-top:1px;margin-bottom: 1px">${filmmaker['filmmakerName']}</div>
									<div align="center" >导演</div>	
								</li>							
							</c:if>
						</c:forEach>
						<c:forEach items="${cmovie['filmmakerList']}" var="filmmaker">
							<%-- <c:forEach items="${filmmaker['jobList']}" var="job">
								<c:if test="${job['jobName'] eq '演员'}">
									<li>
										<div>
										<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID']}">
											<img src="${filmmaker['filmmakerPhoto'] }"  width="120px" height="150px"/>
										</a>
										</div>
										<div align="center"style="margin-top:1px">${filmmaker['filmmakerName']}</div>
										<div>&nbsp;</div>
									</li>	
								</c:if>
							</c:forEach> --%>
							<c:if test="${filmmaker.filmmakerJob eq '演员'}">
								<li>
									<div>
									<a href="checkfilmmaker?filmmakerID=${filmmaker['filmmakerID']}">
										<img src="${filmmaker['filmmakerPhoto'] }"  width="120px" height="150px"/>
									</a>
									</div>
									<div align="center"style="margin-top:1px">${filmmaker['filmmakerName']}</div>
									<div>&nbsp;</div>
								</li>	
							</c:if>
						</c:forEach>					
					</ul>
				</div>
				
				
				<!-- 影片的短评 -->
				<div>
					<div id="model_div">
			 			${cmovie['movieName']}的短评·································（<a href="javascript:;">全部${cmovie['movieScoreNum']}条</a>）
					</div>
					<s:if test="%{#application.cmovie.markList.size()!=0}">
						<s:iterator value="#application.cmovie.markList" status="d">
							<s:if test="#d.index<5">
								<div style="margin-bottom: 13px;font-size: 13px">
									<div style="margin-bottom:5px ">
										 <span style="color:#1E90FF"><s:property value="user.userName" /></span>
										 &nbsp;评价&nbsp;
										<span style="color:#FF8C00">${markScore }分										 	
										 </span>&nbsp;${markDate }
									</div>
									<div style="font-size: 13px"><s:property value="markContent"/></div>
								</div>
							</s:if>
						</s:iterator>
						<s:if test="#application.cmovie.markList.size()>5">
							<div>
								<a href="#">>>更多</a>
							</div>
						</s:if>
						<s:else>
							<span style="color:#696969">没有更多了......</span>
						</s:else>
					</s:if>
					<s:else>
						本片还没有短评。
					</s:else>	
				</div>
				<br>
				<div>
					<div id="model_div">
						${cmovie['movieName'] }的影评·································（<a href="javascript:;">全部<s:property value="#application.cmovie.commentList.size()"/>条</a>）
					</div>
					<s:if test="#application.cmovie.commentList.size()==0">
						本片还没有影评。
					</s:if>
					<s:else>
						<s:iterator value="#application.cmovie.commentList" status="d" begin="0" step="1">
							<s:if test="#d.index<5">
								<div style="margin-bottom: 15px">
									<div style="background: #C0D9D9">
										<h3>
											<a href="ccomment?commentID=${commentID }"><s:property value="commentTitle"/></a>
										</h3>
									</div>
									<label><s:property value="user.userName"/>&nbsp;于&nbsp;${commentDate }&nbsp;发表</label>
									<s:if test="ifSpoiler== 0">
										<div id="hint_div">
											<p>>这篇影评可能有剧透</p>
										</div>
									</s:if>
									<s:else>
										<div id="comment_div">${commentContent }</div>
									</s:else>
								</div>
							</s:if>
						</s:iterator>
						<s:if test ="#application.cmovie.commentList.size()>5">
							<div>
								<a href="#">>>更多</a>
							</div> 
						</s:if>
						<s:else>
						<span style="color:#696969">没有更多了......</span>
						</s:else>
					</s:else>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
	<div id="bottom" style="height: 80px">
		<hr>
	</div>


		<!--模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 630px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							影片评分
				</div>
				<div class="modal-body">
				<div style="margin-bottom: 20px">
					<table>
						<tr>
							<td>给个评价：</td>
							<td>
								<div id="modle_score"></div> 
								<input type="hidden"name="markScore" id="mark_score" /> 
							</td>
						</tr>
					</table>
					</div>
					<div>
						简评短论：
						<textarea id="mark_are" rows="5" cols="88" name="markContent"
									style="resize: none;"></textarea>
						<div id="hint"></div>
					</div>
					<div class="modal-footer">
							<button id="mark_btn" type="button">发表</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal in" id="modle_log" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" align="center">		
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
					<div style="width:300px">
						<div style="margin-bottom: 30px"><h3>欢迎来到漠影人,先登录</h3></div>
						
						<div style="margin-bottom: 20px">
							<span><input id="userName" class="form-control" type="text" name="userName"  placeholder="用户名(6-16位数字字母)" maxlength="16"/></span>
						</div>
						<div style="margin-bottom: 20px">
							<input id="userPsd" type="password" class="form-control" name="userPassword" placeholder="密码(6-16位数字字母)" maxlength="16" />
						</div>
						<div >
							<button id="login" type="button" style="width: 300px;height:40px">登录漠影人</button><br>
							<div align="left" style="margin-bottom: 2px">
								<div id="flg"style="color:red"></div>
								<input type="checkbox" id="rembe_psd" name="remberpsd"/>
								<span style="color:#545454;font-size:12px">下次自动登录 </span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" align="center">
					&nbsp;
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			$("#flg").empty();
			var name = $("#userName").val();
			var psd = $("#userPsd").val();
			if(name==""||psd==""){
				$("#flg").append("用户名密码不能为空")
			}else{
				$.ajax({
					url:'login?userName='+name+'&userPassword='+psd,
					type:'get',
					async:false,
					success:function(date){
						if(date.res=="success"){
							$("#modle_log").hide();
							window.location.reload();
						}else{
							$("#flg").append("用户名或密码不正确");
						}
					}					
				})	
			}
		})
	})
	$(function(){
		$("#mark_btn").click(function(){
			$("#hint").empty();
			var userID = " ${sessionScope.user['userID']}";
			var movieID = "${cmovie['movieID']}"
			var markScore =$("#mark_score").val();
			var markContent = $("#mark_are").val();
			if(markContent==""){
				$("#hint").append("请输入短评的内容。");
			}else if(markContent.length>500){
				$("#hint").append("短评内容请不要超过140字")
			}else{
				$.ajax({
					url:"markmovie?userID="+userID+"&movieID="+movieID+
						"&markScore="+markScore+"&markContent="+markContent,
					type:"get",
					async:false,
					success:function(date){			
						if(date.res=="success"){
							alert("发表成功");
							window.location.reload();
						}else if(date.res=="failed"){
							alert("发表失败，请稍后再试");
							window.location.reload();
						}	
					}
				})
			}
		})
	})
	
</script>
</html>
