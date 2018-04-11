<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.zx.javabean.Job,com.zx.utils.FilmmakerType"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影人添加</title>
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css">  
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>


<script type="text/javascript">

  
  $(function() {
	  $("#showPhoto").click(function () {
	  	$("#filmmakerPhoto").click(); //隐藏了input:file样式后，点击头像就可以本地上传
	 		$("#filmmakerPhoto").on("change",function(){
	 			 var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
	 			 if (objUrl) {
	 				 $("#showPhoto").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
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
		$("#filmmakerBirth").datepicker({
			changeYear : true,
			changeMonth : true,
			yearRange : '-100:-1',
			dateFormat : "yy-mm-dd"
		});
	})
</script>
<style type="text/css">
/* .myInput{
	border-radius:4px;
	border:1px solid #DBDBDB;
	height:30px;  
	width:200px;    
	}	 */
</style>
</head>
<body>
	<s:action name="job" namespace="/"></s:action>
	<s:if test="#application.addFilmmakerRes.equals('FilmmakerExist')">
		<script type="text/javascript">
			alert("影人已存在")
			
			window.history.goback(-1);
		</script>
	</s:if>
	<s:if test="#application.addFilmmakerRes.equals('AddSuccess')">
		<script type="text/javascript">
			window.onload = function(){
				alert("影人添加成功")
			}
		</script>
	</s:if>
	<s:if test="#application.addFilmmakerRes.equals('AddFailed')">
		<script type="text/javascript">
			alert("影人添加失败")
			window.history.goback(-1);
		</script>
	</s:if>
	
	<div align="center">
		<div style="width:1500px">
			<div align="right">
			<label>欢迎，管理员${sessionScope.admAccount}</label>
			<a href="#">退出</a>
		</div>
		</div>
		<div style="width: 680px">
			<div align="left">
				<div><h1 style="color:green">影人管理</h1></div>
				<hr>
				<div>
					<div><h3>影人添加</h3></div>
					<div style="float:right;margin-top: 50px">>>添加完成?<a href="administratorindex.jsp">返回主页</a></div>
					<div >
					
						<s:form name="filmmakerform" action="addfilmmaker" method="post" enctype="multipart/form-data" onsubmit="return formatCheck(this)">
							<table style="border-collapse:separate;border-spacing:15px; ">
								<tr>
									<td align="right">影人名：</td>
									<td class="form-inline">
									<input class="form-control" type="text" maxlength="50" name="filmmakerName"/>&nbsp;
									<label id="fname" style="color:red;font-size: 15px"></label></td>
								
								</tr>
								<tr>
									<td align="right" valign="top">头像：</td>
									<td><img src="" id="showPhoto" height="180px" width="120px;" /></td>
								</tr>
								<tr>
									<td></td>
									<td><s:file id="filmmakerPhoto" name="filmmakerPhoto">
										<label id="fphoto" style="color:red;font-size: 15px"></label></s:file>&nbsp;
									</td>
								</tr>
								<tr>
									<td align="right">性别：</td>
									<td>
										<input id="fSex" type="radio" name="filmmakerSex" value="男" />男
										<input id="fSex" type="radio" name="filmmakerSex" value="女" />女
										<label id="fsex" style="color:red;font-size: 15px"></label>
									</td>
								</tr>
								<tr>
									<td align="right">影人生日：</td>
									<td class="form-inline">
									<input class="form-control" type="text" name="filmmakerBirth"id="filmmakerBirth" /><label id="fbirth" style="color:red;font-size: 15px"></label></td>
								</tr>
								<tr>
									<td align="right">出生地：</td>
									<td class="form-inline">
									<input class="form-control" type="text" name="filmmakerBirthPlace"maxlength="20"/> <label id="fbirthplace" style="color:red;font-size: 15px"></label></td>
								</tr>
								<tr>
									<td align="right">影人职业:</td>
									<td>
										<c:forEach items="${applicationScope.jobs}" var="job">
											<input  type="checkbox" name="filmmakerJob"value=" ${job['jobID']}" />
 											${job['jobName']}
 										</c:forEach> 
 										<label id="fjob" style="color:red;font-size: 15px"></label>
 									</td>
								</tr>
								<tr>
									<td align="right" valign="top">影人介绍：</td>
									<td><textarea class="form-control" maxlength="2000" name="filmmakerDescribe"
											rows="10" cols="50" placeholder="不超过 2000 字" ></textarea></td>
								</tr>
								<tr>
									<td></td><td><label id="fdescribe" style="color:red;font-size: 15px"></label></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="录入" name="add" /></td>
								</tr>
							</table>
						</s:form>
					</div>
					<br><br>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/filmmakercheck.js"></script>
</html>