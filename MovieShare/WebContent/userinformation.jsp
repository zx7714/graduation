<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>个人信息</title>
<style type="text/css">
	#mo_s a:link {color: 	#808080} 
	#mo_s a:visited {color: 	#808080}
	#mo_s a:hover {color: 	 	#696969}
	#mo_s a:active {color: 	 	#696969}
	a:link {text-decoration:none;} 
	a:visited {text-decoration:none;}
	a:hover {text-decoration:none;}
	a:active {text-decoration:none;}
</style>
</head>
<body onload="setZero()">
	<c:if test="${pageUser.user.userName!=sessionScope.user.userName }">
		<script type="text/javascript">
			window.location.href="userlogin.jsp"
		</script>
	</c:if>
	<div align="center">
	<div style="width: 650px" align="left">
		<div id="标题">
			<div>
					<h1 style="color: green">漠影人账号</h1>
			</div>
		</div>
		<div id ="info">
		
		<div style="margin-left: 3px;margin-top: 20px"><h4>账号信息：</h4></div>
			<div style="float: right;margin-right: 50px">去主页?
				<a href="index.jsp">主页</a>
			</div>
			<table>
				<tr>
					<td>&nbsp;&nbsp;账号：</td>
					<td><s:property value="#application.pageUser.user.userName"></s:property></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;密码：</td>
					<td><a href="editpsd?tab=info">修改</a></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;邮箱：</td>
					<td><s:property value="#application.pageUser.user.userEmail"></s:property></td>
				</tr>
			</table>
			<hr>
		</div>
		<div >
		<div style="margin-left: 3px">
			<h4>我的影评：</h4>
			<hr>
		</div>
			
			<div style="height: 120px;font-size: 13px;margin-left: 5px">
				<c:if test="${empty pageUser.user.comment }">
					<div>您还没有影评。你可以去<a href="index.jsp">主页</a>在您喜欢的电影下留下您的足迹。</div>
				</c:if>
				<table id="comment" style="border:0px;table-layout: fixed;width:650px">
					<s:iterator value="#application.pageUser.user.comment">	
							<tr id="tr_${commentID}">
								<td id="cm" style="width: 580px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" >评论
									<span id="mo_s">
										<a href="checkmovie?movieID=${movie['movieID']}">《${movie.movieName}》</a>
									</span>
										<a href="ccomment?commentID=${commentID }">${commentTitle }</a>
								</td>
								<td>
									&nbsp;<button class="del" type="button" value="${commentID}">删除</button>
								</td>
							</tr>	
					</s:iterator>
				</table>
			</div>
			
			<button id="previous" type="button">上一页</button>
			<input id = "page"  type="hidden" value="${pageUser.pageNo}"/>
			<input id = "totalPage" type="hidden" value="${pageUser.totlePage}"/>
			<button id="next" type="button">下一页</button>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#previous").click(function(){
		var pageNo = parseInt($("#page").val())
		if(pageNo==0){
			alert("这已经是第一页了。")
		}else{
			window.location.href="usercheck?userID=${sessionScope.user['userID']}&pageNo="+((pageNo-1)*5);
		}
	})
})
$(function(){
	$("#next").click(function(){
		var pageNo = parseInt($("#page").val());
		var totalPage = parseInt($("#totalPage").val())
		var zno = (pageNo+1)*5
		if(pageNo==totalPage){
			alert("这已经是最后一页了")
		}else{
			window.location.href="usercheck?userID=${sessionScope.user['userID']}&pageNo="+zno;
		}
	})
})
$(function(){
	$(".del").click(function(){
		var cid = $(this).val();
		$.ajax({
			url:"delcomment?commentID="+cid,
			type:"get",
			dateType:'json',
			success:function(date){
				res = date[0].res
				id = "#tr_"+cid
				if(res=="success"){
					$(id).remove()
					alert("删除成功。")
				}else{
					alert("删除失败。")
				}
			}
		})
	})
	
})
</script>


</html>