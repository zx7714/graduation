function commentCheck() {
		var commentTitle = document.getElementByid("title").value;
		var ctitlehint = document.getElementById("ctitle");
		var ctitleTrue = false;
		if(commentTitle==""){
			ctitlehint.innerHTML="请给影评添加一个标题";
		} else if(commentTitle.length>50||commentTitle.length<5){
			ctitlehint.innerHTML="影片标题请在5到50个字之间"
		} else{
			ctitleTrue = true;
		}
	
		var commentContent = CKEDITOR && CKEDITOR.instances["content_tt"] ? CKEDITOR.instances["content_tt"].getData() : document.getElementById("content_tt").value;
		var cContenthint = document.getElementById("cContent");
		var ccontentTrue = false;
		if(commentContent=="" || commentContent.length<140){
			cContenthint.innerHTML="影评的内容请在140字以上"
		}else {
			ccontentTrue = true;
		}
		if(ctitleTrue && ccontentTrue){
			return true;
		}else{
			return false;
		}
}