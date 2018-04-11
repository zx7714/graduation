<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div style="width: 600px">
			<div align="left">
			<div>
				<h1>漠影人账号</h1>
			</div>
				<div>管理员登录</div>
				<div>
					<form action="admlog" method="post">
						<table>
							<tr>
								<td>账号：</td>
								<td><input type="text" name="admAccount" /></td>
							</tr>
							<tr>
								<td>密码：</td>
								<td><input type="password" name="admPassword" /></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="登录" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>