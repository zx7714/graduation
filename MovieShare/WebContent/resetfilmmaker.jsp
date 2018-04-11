<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#filmmakerPhoto").change(function() {
			$("#showPhoto").attr("src", $(this).val())
		})
	})
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
	#input{width: 220px;height: 25px}
</style>
<title>Insert title here</title>
</head>
<body>
	<s:action name="job" namespace="/"></s:action>
	<div align="center">
		<div style="width: 650px">
			<div align="left">
				<div><h1>影人管理</h1></div>
				<div><h3>影人修改</h3></div>
				<hr>
				<div>
					<s:form action="resetfilmmaker" method="post" name="filmmakerform" onsubmit="return formatCheck(this)" enctype="multipart/form-data">
						<table style="border-collapse: separate;border-spacing:15px; ">
							<tr>
								<td align="right">影人名：</td>
								<td><input id="input" type="text" maxlength="50" name="filmmakerName"
									value="${gfilmmaker['filmmakerName']}" /><label id="fname" style="color:red;font-size: 15px"></label></td>
							</tr>
							<tr>
								<td align="right" valign="top">头像：</td>
								<td><img src="${gfilmmaker['filmmakerPhoto']}"
									id="showPhoto" height="180" width="120" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td><s:file id="filmmakerPhoto" name="filmmakerPhoto" ><label id="fphoto" style="color:red;font-size: 15px"></label></s:file></td>
							</tr>

							<tr>
								<td align="right">性别：</td>
								<td>
									<input type="radio" name="filmmakerSex" value="男" />男
									<input type="radio" name="filmmakerSex" value="女" />女
									<label id="fsex" style="color:red;font-size: 15px"></label>
								</td>
								
							</tr>

							<tr>
								<td align="right">影人生日：</td>
								<td><input id="input"  type="text" name="filmmakerBirth"
									id="filmmakerBirth" value="${gfilmmaker['filmmakerBirth']}" />
									<label id="fbirth" style="color:red;font-size: 15px"></label>
								</td>
							</tr>
							<tr>
								<td align="right">出生地：</td>
								<td><input id="input"  type="text" name="filmmakerBirthPlace"
									maxlength="20" value="${gfilmmaker['filmmakerBirthPlace']}" />
									<label id="fbirthplace" style="color:red;font-size: 15px"></label>
								</td>
							</tr>
							<tr>
								<td align="right">影人职业:</td>
								<td><c:forEach items="${applicationScope.jobs}" var="job">
										<input  type="checkbox" name="filmmakerJob"
											value=" ${job['jobID']}" />
 								${job['jobName']}
 							</c:forEach> 
 							<label id="fjob" style="color:red;font-size: 15px"></label></td>
							</tr>
							<tr>
								<td align="right" valign="top">影人介绍：</td>
								<td><textarea name="filmmakerDescribe" rows="10" cols="50"
										placeholder="不超过 2000 字">${gfilmmaker['filmmakerDescribe']}</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><label id="fdescribe" style="color:red;font-size: 15px"></label></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="hidden"
									value="${gfilmmaker['filmmakerID'] }" name="filmmakerID" /> <input
									type="submit" value="修改" name="add" /></td>
							</tr>
						</table>
					</s:form>
				</div>
			</div>
		</div>
	</div>

</body>
	<script type="text/javascript" src="js/filmmakercheck.js"></script>
</html>