<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.dt {
	width: 100px;
	font-size: 15px;
	color: #696969;
}

.outd {
	clear: both;
	margin-top: 15px
}
.form-control{
	width: 210px;
}


</style>

</head>
<body>
	<div>
		<div>
			<div align="center">
				<div style="width: 650px">
					<div align="left">
						<div>
							<h1 style="color: green">漠影人账号</h1>
						</div>
						<hr>
						<div style="margin-left: 20px">
							<div>
								<h3>
									<span style="color: blue;">修改密码</span>
								</h3>
							</div>
							<div>
								<div class="outd">
									
									<div class="dt">账号：</div>
									<div style="float:right;color:green;font-size: 13px">
										<c:choose>
											<c:when test="${param.add eq 'log'}">
												<div>>>放弃修改？<a href = "index.jsp">去主页</a></div>
												<div>>>想起密码？<a href = "userlogin.jsp">立即登陆</a></div>
											</c:when>
											<c:otherwise>
													
												<div>>>放弃修改？<a href = "index.jsp">去主页</a></div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="ipt">
										<c:choose>
											<c:when test="${empty sessionScope.user}">
												<input type="text" class="form-control" name="userName"/>													
											</c:when>
											<c:otherwise>
												<input type="text" class="form-control" name="userName" value="${sessionScope.user['userName']}" readOnly/>
											</c:otherwise>
										</c:choose>
										<span id="un"></span>
									</div>
								</div>
								<div class="outd">
									<div class="dt">绑定邮箱：</div>
									<div class="ipt">
										<input type="text" class="form-control" name="userEmail">
										<span id="email"></span>
									</div>
								</div>
								<div style="margin-top: 15px"class="form-inline">	
								<div class="dt">验证码：</div>	
									<input id="verification" class="form-control" type="text" 
									name="userEmail" maxlength="6" style="width: 100px;"
									onkeyup="value=value.replace(/[^(\d)]/g,'')">
									<input class="vfc" type="button" value="获取验证码" style="height: 32px;width: 100px" onclick = "Verification(this)"/>
									<div id="vercheck" style="color:red;font-size: 15px"></div>
								</div>						
								<div class="outd">
									<div class="dt">新密码：</div>
									<div class="ipt">
										<input type="password" class="form-control" name="userPassword" />
										<span id="psd_d1"></span>
									</div>
								</div>
								<div class="outd">
									<div class="dt">确认密码：</div>
									<div class="ipt">
										<input type="password" class="form-control" name="surePassword" />
									</div>
								</div>
								<div class="outd" style="color:white"> 
									<button id="btn_reset" class="btn btn-primary" type="button">确定修改</button>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
//除邮箱外的其他格式验证
function formatCheck(){
	var uname = $("input[name=userName]").val();
	var un = document.getElementById("un");
	var uncheck  = new RegExp("^\\w+$");
	var unamecheckRes = false;
	if(uname==""){
		un.innerHTML = "[用户名不能为空]"
		un.style.color = "red"
	} else if(!uncheck.test(uname)){
		un.innerHTML="[用户格式不正确]";
		un.style.color = "red"
	}else if(uname.length<6||uname.length>16){
		un.innerHTML="[用户名请在6-16数字或字母之间]"
		un.style.color = "red"
	}else{
		unamecheckRes = true;
		un.innerHTML="";
	}
	var psd1 = $("input[name=userPassword]").val();
	var psd2 = $("input[name=surePassword]").val();
	var psdc = document.getElementById("psd_d1");
	var psdcheckRes = false;
	if(psd1==""||psd2==""){
		psdc.innerHTML="[密码与确认密码不能为空]"
		psdc.style.color="red";
	}else if(psd1.length>16||psd1.length<6){
		psdc.innerHTML="[密码请在6-16任意字符之间]"
		psdc.style.color="red";
	}else if(psd1!=psd2){
		psdc.innerHTML="[两次密码不一致]"
		psdc.style.color="red";
	}else{
		psdcheckRes = true;
		psdc.innerHTML="";
	}
	
	var verf = $("#verification").val();
	var vercheckres = false;
	if(verf==""){
		$("#vercheck").html("[验证码不能为空]")
	}else if(verf.length!=6){
		$("#vercheck").html("[验证码不正确]")
	}else{
		vercheckres = true;
		$("#vercheck").empty();
	} 
	
	if(unamecheckRes&&psdcheckRes&&vercheckres){
		return true;
	}else{
		return false;
	}
}

</script>
<script type="text/javascript">
//邮箱格式验证
function checkEmail(){
	
	var uemail = $("input[name=userEmail]").val();
	var email = document.getElementById("email");
	var emcheck = new RegExp("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?");
	var emailcheckRes = false;
	if(uemail==""){
		email.innerHTML = "[邮箱不能为空]"
		email.style.color="red";
	}else if(!emcheck.test(uemail)){
		email.innerHTML="[邮箱格式不正确]";
		email.style.color="red";
	}else{
		emailcheckRes = true;
		email.innerHTML=""
	}
	return emailcheckRes;
}
//发送邮件按钮进入倒计时
var cutdown = 5;
function Verification(val){	
	var check = checkEmail();
	if(check){
		sign = check;
	}
	if(sign){
		if(cutdown == 0){
			val.removeAttribute("disabled");
			val.value = "获取验证码"
			email.innerHTML=""
			sign = false;
			cutdown = 5;
			return;
		}else{
			val.setAttribute("disabled",true);
			val.value = "重新获取 "+cutdown+"s";
			email.innerHTML=""
			cutdown--;
		}
		setTimeout(function(){
			sign=true;
			Verification(val);	
		},1000)
	}
} 
$(function(){
	$(".vfc").click(function(){
		var check = checkEmail();
		if(check){
			var email=$("input[name=userEmail]").val();
			$.ajax({
				url:"registverf?userEmail="+email,
				type:"get",
				dateType:"json",
				success:function(date){
				}
			}) 
		}
	})
	$("#btn_reset").click(function(){
		var ec = checkEmail()
		var fc = formatCheck()
		var uname = $("input[name=userName]").val();
		var uemail = $("input[name=userEmail]").val();
		var verf = $("#verification").val();
		var psd = $("input[name=userPassword]").val();
		if(ec&&fc){
			$.ajax({
				url:'resetpsd',
				type:'post',
				data:{
					'userName':uname,
					'userPassword':psd,
					'userVerification':verf,
					'userEmail':uemail
				},
				dataType:'json',
				success:function(data){
					var res = data.res;
					if(res=="success"){
						window.location.href="logoff";
					}else if(res=="failed"){
						alert("用户名与邮箱不匹配")
					}else if(res=="verwrong"){
						alert("您输入的验证码不正确")
					}
				}
			})
		}
	})
})
</script>
</html>