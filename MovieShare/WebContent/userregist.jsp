<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css">  
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-ui.js"></script>

	
	
<style type="text/css">
#un,#psd_d1,#email{
	color:red;
	font-size: 15px;
}
</style>
</head>
<script type="text/javascript">
	
</script>

<body>
	<div align="center">
		<div style="width: 680px">
			<div align="left">
				<div><h1 style="color: green">漠影人账号</h1></div>
				<hr>
				<div>
					<div>
						<h3>欢迎加入漠影人</h3>
					</div>
					<div style="float: right;font-size: 15px">
						<div style="margin-bottom: 10px">
							<br>
							>已有账号？<a href="userlogin.jsp">立即登录</a>
						</div>
						<div>
							>不想注册？<a href="index.jsp">去首页</a>
						</div>
					</div>
						<table cellspacing="10"  style="   border-collapse:   separate;   border-spacing:15px;  ">
							<tr>
								<td align="right">用户名</td>
								<td><input class="form-control"  id="uname" type="text" name="userName" maxlength="16"style="width: 210px;" 
								 placeholder="6-16位数字字母组成" /></td>
								<td><div id="un"></div></td>
							</tr>
							<tr>
								<td align="right">密码</td>
								<td><input class="form-control"  id="psd1" type="password" name="userPassword"maxlength="16" style="width: 210px;" /></td>
								<td><div id="psd_d1"></div></td>
							</tr>
							<tr>
								<td align="right">确认密码</td>
								<td><input class="form-control"  id="psd2" type="password" name="userPasswordSure"
									maxlength="16" style="width: 210px;"></td>
							</tr>
							<tr>
								<td align="right">邮箱</td>
								<td><input id="userEmail" class="form-control"  type="text" name="userEmail" maxlength="64" style="width: 210px;" /></td>
								<td><div id="email" style="color:red;font-size: 15px"></div></td>
							</tr>
							<tr>
								<td align="right">验证码</td>
								<td>
									<div class="form-inline">
										<input id="verification" class="form-control" type="text" name="userEmail" maxlength="6" style="width: 100px;">
										<input class="vfc" type="button" value="获取验证码" style="height: 32px;width: 100px" onclick = "Verification(this)"/>
									</div>
								</td>
								<td>
									<div id="vercheck" style="color:red;font-size: 15px"></div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<button id="reg" type="button" class="btn btn-primary"style="background-color: green">注册</button>
								</td>
							</tr>
						</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//邮箱验证
	function checkEmail(){
		var uemail = $("#userEmail").val()
		var email = document.getElementById("email");
		var emcheck = new RegExp("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?");
		var emailcheckRes = false;
		if(uemail==""){
			email.innerHTML = "邮箱不能为空"
			email.style.color="red";
		}else if(!emcheck.test(uemail)){
			email.innerHTML="邮箱格式不正确";
		}else{
			emailcheckRes = true;
			email.innerHTML=""
		}
		return emailcheckRes;
	}
	
 	var cutdown = 5;
	//点击按钮时进入倒计时
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
	//向注册邮箱内发送验证码
	$(function(){
		$(".vfc").click(function(){
			var check = checkEmail();
			if(check){
				var email = $("#userEmail").val();
				$.ajax({
					url:"registverf?userEmail="+email,
					type:"get",
					dateType:"json",
					success:function(date){
					}
				}) 
			}
		})
	})
	
	//格式验证
	function formatCheck(){
		var uname = $("#uname").val();
		var un = document.getElementById("un");
		var uncheck  = new RegExp("^\\w+$");
		var unamecheckRes = false;
		if(uname==""){
			un.innerHTML = "用户名不能为空"
			un.style.color = "red"
		} else if(!uncheck.test(uname)){
			un.innerHTML="用户格式不正确";
		}else if(uname.length<6||uname.length>16){
			un.innerHTML="用户名请在6-16数字或字母之间"
		}else{
			unamecheckRes = true;
			un.innerHTML="";
		}
		var psd1 = $("#psd1").val();
		var psd2 = $("#psd2").val();
		var psdc = document.getElementById("psd_d1");
		var psdcheckRes = false;
		if(psd1==""||psd2==""){
			psdc.innerHTML="密码与确认密码不能为空"
		}else if(psd1.length>16||psd1.length<6){
			psdc.innerHTML="密码请在6-16任意字符之间"
		}else if(psd1!=psd2){
			psdc.innerHTML="两次密码不一致"
		}else{
			psdcheckRes = true;
			psdc.innerHTML="";
		}
		
		var verf = $("#verification").val();
		var vercheckres = false;
		if(verf==""){
			$("#vercheck").html("验证码不能为空")
		}else if(verf.length!=6){
			$("#vercheck").html("验证码不正确")
		}else{
			vercheckres = true;
			$("#vercheck").empty();
		} 
		if(unamecheckRes&&psdcheckRes&vercheckres&&vercheckres){
			return true;
		}else{
			return false;
		}
	} 
	//用户注册
	$(function(){
		$("#reg").click(function(){
			var ce = checkEmail();
			var fc = formatCheck();
			var userName = $("#uname").val();
			var userPsd = $("#psd1").val();
			var userEmail = $("#userEmail").val();
			var userVer = $("#verification").val();
			//alert(userName+userPsd+userEmail+userVer)
			if(ce&&fc){
				$.ajax({
					url:'regist',
					type:'post',
					data:{
						'userName':userName,
						'userPassword':userPsd,
						'userVerification':userVer,
						'userEmail':userEmail
					},
					dataType:'json',
					success:function(data){
						var res = date.res;
						alert(res)
						if(res=="codewrong"){
							alert("输入的验证码不正确");
							window.location.reload();
						}else if(res=="emailused"){
							$("#email").html("邮箱已被使用");
						}else if(res=="userexist"){
							$("#email").html("用户已存在");
						}else if(res=="registfailed"){
							alert("注册失败请稍后再试。");
							window.location.reload();
						}else if(res=="success"){
							window.location.href="userlogin.jsp"
						}
					}
				})
			}
		})
	})
</script>
</html>