<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/head.css">

<head>
<style>
  	#movie_ul1,#movie_ul2,#mo_list{display:block;white-space:nowrap;margin:0px;padding:0px;}
	#movie_ul1 li,#movie_ul2 li,#mo_list li{margin:5px;display:inline-block;}
	#mv_ul
	{
	    list-style:none; /* 去掉ul前面的符号 */
	    margin:5px; /* 与外界元素的距离为0 */
	    padding:5px; /* 与内部元素的距离为0 */
	    width: auto; /* 宽度根据元素内容调整 */
	}
	#mv_ul li
	{
	    float:left;
	}

	#pic_a:link {color: white} 
	#pic_a:visited {color: white}
	#pic_a:hover {color: white;}
	#pic-a:active {color: white;}	
	a:hover{text-decoration:none;}
	a:visited {text-decoration:none;}
	a:active {text-decoration:none;}
	a:link {text-decoration:none;}
	.shadow{
		text-shadow: 1px 1px 0px #00BFFF;
		font-weight:bold;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		var oldcolor;
		$(".lable_a").click(function(){
			$(".lable_a").css("color","#696969");
			$(this).css("color","black")
			oldcolor = "black"
		})
		$(".lable_a").mouseover(function(){
			oldcolor = $(this).css("color")
			$(this).css("background-color","blue");
			$(this).css("color","white")
		})
		$(".lable_a").mouseleave(function(){
			$(this).css("background-color","white");
			$(this).css("color",oldcolor);
		})
	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>漠影人</title>
</head>

<body>
	<div id="head">
		<div>
			<nav class="navbar navbar" role="navigation" style="min-width: 650px">
				<div class="container-fluid" style="background-color:white;" >
   					<div>
        				<ul class="nav navbar-nav pull-right" >
            				<li class="active"><a href="index.jsp">首页</a></li>
            					<c:choose>
            						<c:when test="${empty sessionScope.user['userName']}">
            							<li class="active"><a href="userlogin.jsp?score=index">登录</a></li>
           						 		<li class="active"><a href="userregist.jsp">注册</a></li>
            						</c:when>
            					<c:otherwise>
            	  					<li class="dropdown">
                						<a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown" >
                    						${sessionScope.user['userName']}的账号<b class="caret"></b>
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
						<div style="width: 630px">
						
							<div class="shadow" style="color:blue;font-size:20px;float:left">漠影人&nbsp;</div>&nbsp;&nbsp;
            				<div style="float:left">
            					<input id="search" type="text" name="keyword" />
            					<button id="btn" class="submit" type="submit">搜索</button>         					
            					<!-- <input class="submit" type="submit" value="搜索"/> -->
            					
            				</div>
            			</div>
 					</div>
 				</form>
			</nav>
		</div>
	</div>
	<div align="center"  id="center">
		<div style="width: 620px" align="left">
			<div id="mv_div" align="left" >
				<s:action name="movieByDate" namespace="/">
					<s:param name="beginNum" value="-1"></s:param>
				</s:action>
				<span>
					本月新片
				</span>
				<div align="right" style="margin-right: 30px">
					<button id="pre">上一页</button>
					<input type="hidden" id="beginPage" name="beginPage"value="${beginPage}"/>
					<span id="nowPage">${beginPage+1}</span>/${pages}
					<button id="next">下一页</button>
					&nbsp;
				</div>
				<hr style="margin-bottom: 5px;margin-top: 5px">
				<ul id="mv_ul" style="margin-left: 15px">
					<%-- <s:iterator value="#application.movieByDate" >
					 	<li>
					 		<p>
					 			<a id="pic_a" href="checkmovie?movieID=${movieID}" >
					 				<img  id="movie_img"src = "${movieCover}" width="122px" height="175px" />	
					 			</a>
					 		<p>
					 		<p>${movieName}<p>
					 	</li>
					</s:iterator> --%>
				</ul>
			</div>
			<br>
			<div style="clear:both">
				<s:action name="type" namespace="/"></s:action>
				<span>热门推荐</span>
				<div >
					<label class="lable_a" style="cursor:pointer;color: black;font-size: 12px" onclick="getMovie(0)">最热</label>
						<c:forEach items="${applicationScope.types}" var="type">
							<label class="lable_a" style="cursor:pointer;color:#696969;font-size: 12px" onclick="getMovie(${type.typeID})">
								${type.typeName}
							</label>
						</c:forEach>
					<hr style="margin-bottom: 5px;margin-top: 5px">
					<div style="height:350px">
					<div id="show_movie1"><ul id="movie_ul1"></ul></div>
					<div id="show_movie2"><ul id="movie_ul2"></ul></div>
					</div>
				</div>	
			</div>
			<br>
			<s:action name="mvpmovie" namespace="/" ></s:action> 
			<div >
				高分推荐
				<hr  style="margin-bottom: 5px;margin-top: 5px">
					 <div>
						<ul id="mo_list" >
						<s:iterator value="#application.mvpmovie" status="d" begin="0"  step="1"> 
							<s:if test="#d.index<5">
							<li >
								<a id="pic_a" href="checkmovie?movieID=<s:property value="movieID"/>">
									<img src="<s:property value="movieCover" /> "  width="110px" height="140px"/>
								</a>
								<div align="center" >
									<s:property value="movieName"/>&nbsp;
									<span id="score_sp" style="color:#D2691E"><s:property value="movieEveryScore"/></span>
								</div>
							</li>
							</s:if>
						</s:iterator> 
						</ul>
						<ul id="mo_list" >
						<s:iterator value="#application.mvpmovie" status="sta" begin="0" > 
							<s:if test="#sta.index>5">
							<li >
								<a id ="pic_a" href="checkmovie?movieID=<s:property value="movieID"/>">
									<img src="<s:property value="movieCover" /> "  width="110px" height="150px"/>
								</a>
								<p align="center">
									<s:property value="movieName"/>&nbsp;
									<span id="score_sp" style="color:#D2691E"><s:property value="movieEveryScore"/></span>
								</p>
							</li>
							</s:if>
						</s:iterator> 
						</ul>
					</div>
				</div>
			<s:action name="allcomment" namespace="/"></s:action>
			<div style="clear:both">
				热门影评:
				<c:if test="${empty applicationScope.acomments }">
					<div>暂无热门影评。</div>
				</c:if>
				<c:if test="${not empty applicationScope.acomments }">
				<div>
					<s:iterator value="#application.acomments" status="d" begin="0" step="1">
					<hr>
					<div style="clear:both;">
						<div style="float:left;margin-right: 5px"><img src="${movie['movieCover'] }" width="75px" height="100px">&nbsp;</div>
						<div>
							<div >
								<h5><a href="ccomment?commentID=${commentID }" style="overflow:hidden">${commentTitle}</a></h5>
							</div>
							<div style="margin-top: 5px;color:#696969">
									${user['userName'] }&nbsp;评论&nbsp;<a href="checkmovie?movieID=${movie['movieID']}">《${movie['movieName'] }》</a>
							</div>
							<div id= "con_div"style="height:40px;overflow:hidden;margin-top:4px">${commentContent }</div>
				
						</div>
					</div>
					</s:iterator>
				</div>
				</c:if>
			</div >
		</div>
	</div>
	 <div style="clear:both">
		<hr>
		<span>这是页面尾部</span>
	</div>
</body>
<script type="text/javascript">
	function getMovie(str){
		$.ajax({
			url:'recommendmovie',
			type:'post',
			data:{
				'typeNo':str
			},
			dataType:'json',
			success:function(movies){
				if(movies==null){
					$("#movie_ul1").html("<li><p>暂时还没有该类型的影片。</p></li>");
					return;
				}else{
					var account = 0;
					var li ="";
					var li2="";
					for(var movie in movies){
						if(account<5){
							li_c = "<a href='checkmovie?movieID="+movies[movie].movieID+
									"'><li><div><img src = '"+movies[movie].movieCover+
									"'  width='110px' height='150px'/></div>"+
									"<div align='center'><p>"+movies[movie].movieName+
									"&nbsp;<span style='color:#D2691E'>"+movies[movie].movieEveryScore+
									"</span></p></div></li></a>"
							li+=li_c; 
						}else{
							li_c2 = "<a href='checkmovie?movieID="+movies[movie].movieID+
									"'><li><div><img src = '"+movies[movie].movieCover+
									"'  width='110px' height='150px'/></div>"+
									"<div align='center'><p>"+movies[movie].movieName+
									"&nbsp;<span style='color:#D2691E'>"+movies[movie].movieEveryScore+
									"</span></p></div></li></a>";
							li2+=li_c2;
						}
						account++;
					}
					$("#movie_ul1").empty();
					$("#movie_ul2").empty();
					$("#movie_ul1").html(li);
					$("#movie_ul2").html(li2);
					return;
				}	
			}
		})
	}
	function getLastMovie(page){
		$.ajax({
			url:'movieByDate?beginNum='+page,
			type:'get',
			dataType:'json',
			success:function(movies){
				var li='';
				for(var movie in movies){
					li_b ="<li><p>"
						+"<a id='pic_a' href='checkmovie?movieID="
						+movies[movie].movieID+"'>"
		 				+"<img id='movie_img' src='"+movies[movie].movieCover+"' width='110px' height='150px'/></a>&nbsp;</p>"		
		 				+"<p align='center'>"+movies[movie].movieName+"</p></li>"
		 			li+=li_b;
				}
				$("#mv_ul").slideDown("slow");
				$("#mv_ul").html(li);
				
			}
		})
	}
</script>
<script type="text/javascript">
	$(function(){
		var tp = ${pages};
		var totalPage = parseInt(tp);
		$("#next").click(function(){
			var page = parseInt($("#beginPage").val());
			if(page>=totalPage){
				page=0;
				getLastMovie(page)
				$("#beginPage").val(1);
				$("#nowPage").html(1);
			}else{
				getLastMovie(page)
				$("#beginPage").val(page+1);
				$("#nowPage").html(page+1);
			}
		})
		$("#pre").click(function(){
			var page = parseInt($("#beginPage").val());
			if(page==1){
				page=totalPage;
				getLastMovie(page-1);
				$("#beginPage").val(page);
				$("#nowPage").html(page);
			}else{
				getLastMovie(page-2)
				$("#beginPage").val(page-1);
				$("#nowPage").html(page-1);
			}
		})
	})
	window.onload=function()
	{	
		getMovie(0)
		getLastMovie(-1)
		$("#beginPage").val(1);
	}
</script>
</html>