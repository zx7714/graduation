<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.zx.javabean.User"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserLogin</title>
<link rel="stylesheet" href="css/bootstrap.min.css">  
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-ui.js"></script>

</head>
<body>
	
	<div align="center">
		<div style="width: 680px;">
			
			<div align="left" >
				<div>
					<h1 style="color: green">漠影人账号</h1>
				</div>
				<%-- <input id="page" type="hidden" value="${param.socre}"/> --%>
				<hr>
				<div>
					<div>
						<div>
							<label>登录漠影人</label> <br> <br>
						</div>
							<div style="float: right;font-size: 15px">
								<div style="margin-bottom: 10px">
								<br>
								<p>>>还没有账号？<a href="userregist.jsp">加入我们</a></p>
								</div>
								<div>
								<p>>>不想登录？<a href="index.jsp">去首页</a></p>
								</div>
							</div>
							<table style="   border-collapse:   separate;   border-spacing:15px;  ">
								<tr>
									<td><label>账号</label></td>
									<td >
										
											<input id="userName" class="form-control"  type="text" maxlength="16"name="userName"
											style="width: 200px" placeholder="6-16位数字字母组成"/>
						
									</td>
									<td>
										<div id="hint" style="color:red;font-size:15px"></div>
									</td>
								</tr>
								<tr>
									<td><label>密码</label> </td>
									<td>
										<input id="userPsd" class="form-control" type="password" maxlength="16"name="userPassword" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<label>
											<input type="checkbox" id="rembe_psd" /><span style="color:#545454;font-size:15px">下次自动登录 |</span>
											<a href="editpsd?tag=log">忘记密码</a>
										</label>
									</td>
								</tr>
								<tr>
									<td></td>	
									<td>
									  <button id="login" class="btn btn-primary" type="button"  style="background-color: green">登录</button>
									</td>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var page = "${param.score}";
		$("#login").click(function(){
			var name = $("#userName").val();
			var psd = $("#userPsd").val();
			if(name==""||psd==""){
				alert("用户名密码不能为空")
			}else{
				$.ajax({
					url:'login?userName='+name+'&userPassword='+psd,
					type:'get',
					success:function(date){
						var res = date.res.trim();
						var target = "index.jsp";
						if(res=="success"){
							switch(page){
								case "movie":
									target = "checkmovie?movieID=${cmovie['movieID']}";
									break;
								case "filmmaker":
									target = "checkfilmmaker?filmmakerID =${gfilmmaker['filmmakerName']}";
									break;
								case "comment":
									target = "ccomment?commentID=${comment['commentID']}"
							}
							window.location.href =target;
						}else{
							alert("您输入的账号名或密码不正确。");
						}
					}				
				})	
			}
		})
	})
</script>
</html>