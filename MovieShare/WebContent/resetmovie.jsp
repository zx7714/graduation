<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影片修改</title>
</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<style type="text/css">
#plus {
	border: 0px solid white;
	background-color: white;
}

#input {
	width: 220px;
	height: 30px
}

select {
	height: 30px；
}
</style>
<script type="text/javascript">
	$(window).on('load', function() {
		$('.selectpicker').selectpicker({
			'selectedText' : 'cat'
		});
	});
	$(function() {
		$("#plus")
				.click(
						function() {
							var tab = document.getElementById("resetmovie")
							var rows = tab.rows.length - 6;
							var tr = "<tr><td></td><td><input id='input' type='text' name='filmmakerName'/>&nbsp;<select name ='filmmakerJob'><option value='0'>职业</option><c:forEach  items='${jobs}' var='job' ><option value='${job['jobName']}''>${job['jobName']}</option></c:forEach></select></td></tr>"
							$("table tr:eq(" + rows + ")").before(tr);
						});
	});
	$(function() {
		$("#movieCover").change(function() {
			$("#showCover").attr("src", $(this).val())
		})
	})
	$(function() {
		$(".movieDate").datepicker({
			changeYear : true,
			changeMonth : true,
			yearRange : '-100:+1',
			dateFormat : "yy-mm-dd"
		});
	})
</script>
<body>

	<s:action name="type" namespace="/"></s:action>
	<s:action name="job" namespace="/"></s:action>
	<div align="center">
		<div style="width: 680px">
			<div align="left">
				<div>
					<h1>影片管理</h1>
					<%-- ${applicationScope.rmovie} --%>
				</div>
				<div><h3>影片修改</h3></div>
				<div>
					<form action="resetmovie" name="movieform"
						onsubmit="return formatCheck(this)" method="post"
						enctype="multipart/form-data">
						<table id="resetmovie"
							style="border-collapse: separate; border-spacing: 10px;">
							<tr>
								<td align="right">影片名：</td>
								<td><input id="input" type="text" maxlength="50"
									name="movieName" value="${rmovie['movieName']}" />&nbsp;<label
									id="mname"></label></td>
							</tr>
							<tr>
								<td align="right" valign="top">封面：</td>
								<td><img src="${rmovie['movieCover'] }" id="showCover"
									height="180" width="120"></td>
							</tr>
							<tr>
								<td></td>
								<td><s:file id="movieCover" name="movieCover"
										value="files/zzzz.jpg">
										<label id="mcover"></label>
									</s:file></td>
							</tr>
							<s:iterator value="#application.rmovie.filmmakerList" status="d">
								<tr>
									<s:if test="#d.index==0">
										<td align="right">影人：</td>
									</s:if>
									<s:else>
										<td></td>
									</s:else>
									<td><input id="input" type='text' name='filmmakerName'
										value="${filmmakerName }" /> <select name="filmmakerJob">
											<c:forEach items="${jobList}" var="job">
												<option value="${job['jobName']}">${job['jobName']}</option>
												<c:forEach items="${jobs}" var="jobb">
													<c:if test="${job['jobName']!=jobb['jobName'] }">
														<option value="${jobb['jobName']}">${jobb['jobName']}</option>
													</c:if>
												</c:forEach>
											</c:forEach>
									</select> <s:if test="#d.index==0">
											<input type="button" id="plus" value="+" />
										</s:if> <label id="finfo"></label></td>
								</tr>
							</s:iterator>

							<tr>
								<td align="right">类型：</td>
								<td><select name="movieType" id="id_select"
									class="selectpicker bla bla bli" multiple
									data-live-search="true">
										<c:forEach items="${types}" var="type">
											<option value="${type['typeID'] }">${type['typeName'] }</option>
										</c:forEach>
								</select> <label id="mtype"></label></td>
							</tr>
							<tr>
								<td align="right">语言：</td>
								<td><input id="input" type="text" maxlength="10"
									name="movieLanguage" value="${rmovie['movieLanguage'] }" /> <label
									id="mlanguage"></label>
								<td>
							</tr>
							<tr>
								<td align="right">上映时间：</td>
								<td><input id="input" type="text" name="movieDate"
									class="movieDate" value="${rmovie['movieDate']}" /> <label
									id="mdate"></label>
								<td>
							</tr>
							<tr>
								<td align="right">片长：</td>
								<td><input id="input" type="text" name="movieLong"
									maxlength="3" style="width: 50px" value="150" /><label>分钟</label><label
									id="mlong"></label></td>
							</tr>
							<tr>
								<td align="right" valign="top">影人介绍：</td>
								<td><textarea name="movieDescribe" rows="10" cols="50"
										placeholder="不超过 2000 字">${rmovie['movieDescribe']}</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><label id="mdescribe"></label></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="hidden" value="${rmovie['movieID'] }"
									name="movieID" /> <input type="submit" value="修改" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/moviecheck.js"></script>
</html>