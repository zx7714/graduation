<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/head.css">

<title>Insert title here</title>
</head>
<body>
	<div>
		<div align="right">
			<label>欢迎，管理员${sessionScope.admAccount}</label>
			<a href="#">退出</a>
		</div>
		<div align="center">
			<div><h2>漠影人管理员</h2></div>
			<div style="width: 500px" >
				<form action="admsearch" method="post">
					<div align="left">
            			<input id="search" type="text" name="keyword" style="width:450px;height: 25px" value="${keyword }"/>
            			<input class="submit" type="submit" value="搜索"  />
 					</div>
					<div align="left" style="font-size:small;">&nbsp;<a href="insertfilmmaker">添加影人</a><a href="addmovie.jsp"> 添加影片</a></div>
					
 				</form>
 			</div>
 				<hr>
 		</div>
 		
 		<div align="center">
 			<div style="width:450px;height: 500px; overflow:auto">
 				<div align="left">
 					<c:if  test="${empty search }">
 						<p>&nbsp;您还未进行搜索。</p>
 					</c:if>
 					<div>
 						<c:if test="${!empty keyword }">
 							<c:if test="${empty search['filmmakerList']}">
 								<c:if test="${empty search['movieList']}">
 									<p>您搜索的内容不存在，你可以重新输入。</p>
 								</c:if>
 							</c:if>
 						</c:if>
 						<c:forEach items="${search['filmmakerList']}" var="filmmaker">
							<div style="clear:both;"id="filmmaker_123${filmmaker['filmmakerID']}">
								<div style="float:left;margin-top:10px;margin-right: 5px"><img src="${filmmaker['filmmakerPhoto']}"width="60" height="90" name="filmmakerPhoto" />&nbsp;</div>				
								<div style="float:left;margin-top:10px;width: 250px">
									<div style="margin-top:2px">${filmmaker['filmmakerName'] }（影人）</div>
									<div style="margin-top:12px">
										${filmmaker['filmmakerSex']}&nbsp;/
										<c:forEach items="${filmmaker['jobList']}"  var="job" varStatus="s">
											<c:choose>
												<c:when test="${s.index==0}">
													${job['jobName']}
												</c:when>
												<c:otherwise>
													/&nbsp;${job['jobName']}
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>							
									<div style="margin-top:5px">
										${filmmaker['filmmakerBirth']} / ${filmmaker['filmmakerBirthPlace']}
									</div>
								</div>
								<div style="float:left;margin-top:10px">&nbsp;		
									<button class="delfm" value="${filmmaker['filmmakerID'] }" type="button">删除</button>
									<a href="updatefilmmaker?filmmakerID=${filmmaker['filmmakerID']}">修改</a>
								</div>
							</div>	
						</c:forEach>
 					</div>
 					<div>
 						<c:forEach items="${search['movieList']}" var="movie">
 							<div id="mv_135${movie['movieID']}" style="clear:both;">
								<div style="float:left;margin-top:10px;margin-right:5px"><img src="${movie['movieCover']}" width="60"height="90" />&nbsp;</div>
								<div style="float:left;width:255px;margin-top:10px;">
									<div style="margin-top: 2px;">${movie['movieName']}（影片）</div>
									<div style="margin-top: 8px;font-size:12px">
										<c:choose>
											<c:when test="${movie['movieScoreNum'] eq 0 }">
												<div >评价人数不足</div>
											</c:when>
											<c:otherwise>
												<div >${movie['movieEveryScore']}（${movie['movieScoreNum']}人评价）</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div style="margin-top: 1px;font-size: 12px">
										${movie['movieLong']}分钟&nbsp;/
										<c:forEach items="${movie['typeList']}" var="type" varStatus="s">
											<c:choose>
												<c:when test="${s.index==0}">
													${type['typeName'] }
												</c:when>
												<c:otherwise>
													/&nbsp;${type['typeName'] }
												</c:otherwise>
											</c:choose>										
										</c:forEach>
									</div>
									<div style="margin-top: 1px;font-size: 12px">${movie['movieDate']}/&nbsp;${movie['movieLanguage']}</div>
								</div>
								<div style="float:left;margin-top:10px;">
									<button class="delmv" type="button" value="${movie['movieID']}">删除</button>
									<a href="updatemovie?movieID=${movie['movieID']}">修改</a>
								</div>
							</div>
						</c:forEach>
					</div>
 				</div>
 			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	$(function(){
		$(".delfm").click(function(){
			if(confirm('删除影人会删除影人及其相关信息，是否继续')){
				var fid = $(this).val();	
				var trid = "#filmmaker_123"+fid;
				$.ajax({
					url:"deletefilmmaker?filmmakerID="+fid,
					type:'get',
					success:function(date){
						var res = date.res.trim();
						if(res=="ok"){
							$(trid).remove();
							alert("删除成功")
						}else{
							alert("删除失败。")
						}
								
					}
				})
			} 
			
		})
	})
	
	$(function(){
		$(".delmv").click(function(){
			if(confirm('删除影片会删除影片及其相关信息，是否继续？')){
				var mid = $(this).val();
				var divid = "#mv_135"+mid;
				alert(divid)
				$.ajax({
					url:"deletemovie?movieID="+mid,
					type:'get',
					success:function(date){
						if(date[0].res=="ok"){
							$(divid).remove();
							alert("删除成功");
						}else{
							alert("删除失败")
						}
					}
				}) 
			}
		});
	})
	
</script>
</html>
