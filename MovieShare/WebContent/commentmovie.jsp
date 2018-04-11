<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="ckeditor/ckeditor.js"></script>

<title>影评发表</title>
<style type="text/css">
#sub {
	background-color: #228B22;
	font-size: 15px;
	height: 23px;
	padding-top: 7px;
	color: white;
	float: right;
	width: 50px;
	font-weight: bold;
	cursor: pointer;
}
a:hover {color: black;text-decoration: none;}
a:visited {color: black;text-decoration: none;}
a:active {color: black;text-decoration: none;}
a:link {color: black;text-decoration: none;}
</style>

</head>
<body>
	<div
		style="top: 0px; width: 100%; height: 30px; left: 0px; right: 0px; position: fixed; background-color: #F5F5F5; min-width: 600px"
		align="center">
		<div style="width: 750px">
			<div align="left" style="padding-top: 5px; float: left">
				<label><span style="color: #228B22; font-weight: bold;">漠影人</span>·写影评</label>
			</div>
		</div>
		<div id="sub" align="center">发表</div>

	</div>

	<br>
	<br>
	<br>
	<div align="center" style="clear: both">
		<div style="width: 680px">
			<div align="left">
				<div style="height: 80px; background-color: #F0F0F0">

					<div style="height: 80px; width: 60px; float: left">
						<a href="checkmovie?movieID=${cmovie['movieID']}"> <img
							src="${cmovie['movieCover'] }" width="60px" height="80px" />
						</a>
					</div>
					<div
						style="height: 80px; width: 600px; float: right; margin-top: 20px">
						<a href="checkmovie?movieID=${cmovie['movieID']}">${cmovie['movieName'] }</a>
						<div style="margin-top: 5px"></div>
						导演：
						<s:iterator value="#application.cmovie.filmmakerList">
							<s:iterator value="jobList">
								<c:if test="${jobName eq '导演' }">
													${filmmakerName }
												</c:if>
							</s:iterator>
						</s:iterator>
						&nbsp; 主演：
						<s:iterator value="#application.cmovie.filmmakerList">
							<s:iterator value="jobList">
								<c:if test="${jobName eq '演员' }">
												${filmmakerName }
											</c:if>
							</s:iterator>
						</s:iterator>
					</div>

				</div>
				<div>
					<input id="title" type="text" name="commentTitle" maxlength="50"
						style="width: 100%; font-size: 18px; height: 40px; border: none"
						placeholder="添加标题" /><label id="ctitle"
						style="color: red; font-size: 15px"></label> <input type="hidden"
						name="userID" value="7" /> <input type="hidden" name="movieID"
						value="${movieID}" />
				</div>
				<div style="margin-bottom: 5px">
					<input type="checkbox" value="yes" name="ifSpoiler" /> <label>本文涉及剧透</label>
				</div>
				<div>
					<label id="cContent" style="color: red; font-size: 15px"></label>
					<textarea id="content_tt" name="commentContent"></textarea>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	CKEDITOR.replace('content_tt', {
		height : '524px'
	})
</script>
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function commentCheck() {
		var commentTitle = $("#title").val();
		var ctitlehint = document.getElementById("ctitle");
		var ctitleTrue = false;
		if (commentTitle == "") {
			ctitlehint.innerHTML = "请给影评添加一个标题";
		} else if (commentTitle.length > 50 || commentTitle.length < 5) {
			ctitlehint.innerHTML = "影片标题请在5到50个字之间"
		} else {
			ctitlehint.innerHTML = ""
			ctitleTrue = true;
		}
		var commentContent = CKEDITOR && CKEDITOR.instances["content_tt"] ? CKEDITOR.instances["content_tt"]
				.getData()
				: document.getElementById("content_tt").value;
		var cContenthint = document.getElementById("cContent");
		var ccontentTrue = false;
		if (commentContent == "" || commentContent.length < 140) {
			cContenthint.innerHTML = "影评的内容请在140字以上";
		} else {
			cContenthint.innerHtml = "";
			ccontentTrue = true;
		}
		if (ctitleTrue && ccontentTrue) {
			return true;
		} else {
			return false;
		}

	}

	$(function() {

		$("#sub").click(function() {
			var b = commentCheck();
			var ctitle = $("#title").val();
			var userID = "${sessionScope.user.userID}"
			var movieID = "${cmovie['movieID']}"
			var ifSpoiler = $("input[name=ifSpoiler]:checked").val();
			var cContent = CKEDITOR&& CKEDITOR.instances["content_tt"] ? CKEDITOR.instances["content_tt"]
					.getData()
					: document.getElementById("content_tt").value;
			if (b == true) {
				$.ajax({
					url : 'commentmovie',
					type : 'post',
					data:{
						"commentTitle":ctitle,
						"commentContent":cContent,
						"userID":userID,
						"movieID":movieID,
						"ifSpoiler":ifSpoiler
					},
					dateType:'json',
					success:function(date){
						res = date[0].res;
						if(res=="success"){
							alert("评论成功。")
							window.location.href ="checkmovie?movieID=${cmovie['movieID']}";											
						}else{
							alert("发表失败，请稍后再试。")
						}	
					}
				})
			}
		})
	})
</script>
</html>