<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	  $("#showCover").click(function () {
	  	$("#movieCover").click(); //隐藏了input:file样式后，点击头像就可以本地上传
	 		$("#movieCover").on("change",function(){
	 			 var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
	 			 if (objUrl) {
	 				 $("#showCover").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
				  }
	 		 });
	 	 });
	  });
	   
	  //建立一个可存取到该file的url
	function getObjectURL(file) {
		var url = null ;
	 	if (window.createObjectURL!=undefined) { // basic
	 		url = window.createObjectURL(file) ;
	  	}else if (
	  		window.URL!=undefined) { // mozilla(firefox)
	  		url = window.URL.createObjectURL(file) ;
	  	}else if (
	  		window.webkitURL!=undefined) { // webkit or chrome
	  		url = window.webkitURL.createObjectURL(file) ;
	  	}
	  	return url ;
	  }
	$(function() {
		$("#plus").click(function() {
			var tab = document.getElementById("addmovie")
			var rows = tab.rows.length - 7;
			var tr = "<tr><td></td><td class='form-inline'><input type='text' class='form-control' name='filmmakerName'/>&nbsp;<select name ='filmmakerJob' class='myInput'><option value='0'>职业</option><option value='演员'>演员</option><option value='导演'>导演</option></select></td></tr>"
			$("table tr:eq(" + rows + ")").before(tr);
		});
	});
	$(function(){
		$("#movieDate").datepicker({
			changeYear : true,
			changeMonth : true,
			yearRange : '-100:-1',
			dateFormat : "yy-mm-dd"
		})
		
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
<style type="text/css">
#plus {
	border: 0px solid white;
	background-color: white;
}
select{height: 30px}
.myInput,.newInput{
	border-radius:4px;
	border:1px solid #DBDBDB;
	height:30px;      
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影片添加</title>
</head>
<body>
	
<s:action name="type" namespace="/"></s:action>
	<%-- <s:action name="job" namespace="/"></s:action>  --%>
	<div align="right">
		<label>欢迎，管理员${sessionScope.admAccount}</label>
		<a href="#">退出</a>
	</div>
	<div align="center">
		<div style="width: 650px">
			<div align="left">
				
				<div><h1 style="color:green">影片管理</h1></div>
				<hr>
				<div><h3>影片添加</h3></div>.
				<div style="float:right;margin-top: 50px">>>添加完成?<a href="administratorindex.jsp">返回主页</a></div>
				<div>
					<form name = "movieform"  action="addmovie"onsubmit="return formatCheck(this)" method="post"  enctype="multipart/form-data">
						<table id="addmovie" style="border-collapse:separate;border-spacing:15px; ">
							<tr>
								<td align="right">影片名：</td>
								<td class="form-inline">
								<input class="form-control"type="text" style="width:200px" maxlength="50" name="movieName" />
								&nbsp;<label id="mname" style="color:red"></label></td>
							</tr>
							<tr>
								<td align="right" valign="top">封面：</td>
								<td><img src="" id="showCover" height="180px" width="120px" ></td>
							</tr>
							<tr>
								<td></td>
								<td><s:file id="movieCover" name="movieCover"><label id="mcover" style="color:red"></label></s:file></td>
							</tr>
							<tr>
								<td align="right">影人:</td>
								<td id="jjs" class="form-inline">
								<input class="form-control" id="input" type="text" name="filmmakerName" value="" /> 
								<select name="filmmakerJob" class="myInput" style="height:30px">
										<option  selected="selected">职业</option>
										
											<option value="演员">演员</option>
											<option value="导演">导演</option>
										
								</select> 
								<input  type="button" id="plus" value="+" />
								<label id="finfo"style="color:red"></label>
								</td>
							</tr>
							<tr>
								<td align="right">类型：</td>
								<td> 								
									<select name="movieType" class="selectpicker" multiple data-live-search="true">
										<c:forEach items="${types}" var="type">
											<option value="${type['typeID']}">${type['typeName']}</option>
										</c:forEach>
									</select>
									<label id="mtype" style="color:red"></label>
								</td>
							</tr>
							<tr>
								<td align="right">语言：</td>
								<td class="form-inline">
									<input class="form-control"type="text" maxlength="10" name="movieLanguage" />
									<label id="mlanguage" style="color:red"></label>
								<td>
							</tr>
							<tr>
								<td align="right">上映时间：</td>
								<td class="form-inline">
								<input class="form-control" id="movieDate" type="text" name="movieDate"/>
								<label id="mdate" style="color:red"></label><td>
							</tr>
							<tr>
								<td align="right">片长：</td>
								<td class="form-inline">
								<input class="form-control" style="border-radius:4px;width:50px"type="text" 
									name="movieLong" maxlength="3">
								<label>&nbsp;分钟</label><label id="mlong" style="color:red"></label>									
								</td>
							</tr>
							<tr>
								<td  align="right" valign="top">影人介绍：</td>
								<td><textarea class="form-control" name="movieDescribe"
										rows="10" cols="50" placeholder="不超过 2000 字"></textarea></td>
							</tr>
							<tr>
								<td></td><td><label id="mdescribe" style="color:red"></label></td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit">添加</button>&nbsp;<button type="button">返回</button> </td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"src="js/moviecheck.js"></script>
</html>







