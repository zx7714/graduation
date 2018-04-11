function formatCheck(){
		var mname = document.movieform.movieName.value;
		var mnamehint = document.getElementById("mname");
		var namecheck = new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]+$");
		var nameTrue = false;
		if(mname==""){
			mnamehint.innerHTML="[影片名不能为空]"
		}else if(!namecheck.test(mname)){
			mnamehint.innerHTML="[影片名格式不正确]"
		}else if(mname.length>20){
			mnamehint.innerHTML="[影片名请在20字符之间]"
		}else{
			nameTrue = true;
			mnamehint.innerHTML=""
		}
		
		var mcover = document.movieform.movieCover.value;
		var mcoverhint = document.getElementById("mcover");
		var coverTrue=false;
		if(mcover==""){
			mcoverhint.innerHTML="[请选择一张图片作为影片的封面]"
		}else{
			coverTrue=true;
			mcoverhint.innerHTML=""
		}
		
		var mfilmmaker = document.getElementsByName("filmmakerName");
		var mfimmakerjob = document.getElementsByName("filmmakerJob");
		var finfohint = document.getElementById("finfo");
		var actorTrue = false;
		for(var i =0;i<mfilmmaker.length;i++){
			if(mfilmmaker[i].value!=""&&mfimmakerjob[i].value=="演员"){
				finfohint.innerHTML=""
				actorTrue=true;
				break;
			}else{
				finfohint.innerHTML="[请选择一个演员]"
			}
		}
		var directorTrue = false;
		for(var i =0;i<mfilmmaker.length;i++){
			if(mfilmmaker[i].value!=""&&mfimmakerjob[i].value=="导演"){
				directorTrue=true;
				break;
			}else{
				finfohint.innerHTML="[请选择一个导演]"
			}
		}
		
		var mtype = document.movieform.movieType.value;
		var mtypehint = document.getElementById("mtype");
		var typeTrue = false;
		if(mtype==""){
			mtypehint.innerHTML = "[请选择影片类型]"
		}else{
			typeTrue = true;
			mtypehint.innerHTML="";
		}
		
		var mlanguage = document.movieform.movieLanguage.value;
		var mlanguageCheck = new RegExp("[\u4e00-\u9fa5]");
		var mlanguagehint = document.getElementById("mlanguage");
		var languageTrue = false;
		if(mlanguage==""){
			mlanguagehint.innerHTML = "[影片语言不能为空]"
		}else if(mlanguage.length>10){
			mlanguagehint.innerHTML="[影片语言请少于10个字]"
		}else if(!mlanguageCheck.test(mlanguage)){
			mlanguagehint.innerHTML="[影片语言格式不正确]"
		} else{
			languageTrue = true;
			mlanguagehint.innerHTML=""
		}
		var mdate = document.movieform.movieDate.value;
		var c = "^(?:(?!0000)[0-9]{4}-"+
		"(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|"+
				"(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|"+
						"(?:0[48]|[2468][048]|[13579][26])00)-02-29)$";
		var datecheck = new RegExp(c);
		var mdatehint = document.getElementById("mdate");
		var dateTrue = false;
		if(mdate==""){
			mdatehint.innerHTML="[请输入影片上映日期]"
		}else if(!datecheck.test(mdate)){
			mdatehint.innerHTML="[影片日期格式错误]"
		}else{
			dateTrue = true;
			mdatehint.innerHTML=""
		}
		
		var mlong = document.movieform.movieLong.value;
		var mlongcheck = new RegExp("^[0-9]*$")
		var mlonghint = document.getElementById("mlong");
		var longTrue = false;
		if(mlong==""){
			mlonghint.innerHTML="&nbsp;[请输入影片片长]"
		}else if(!mlongcheck.test(mlong)){
			mlonghint.innerHTML="&nbsp;[影片时长只能为数字]"
		}else if(mlong==0){
			mlonghint.innerHTML="&nbsp;[ 影片片长必须大于0]"
		}else{
			longTrue = true;
			mlonghint.innerHTML=""
		}
		
		var mdescribe = document.getElementsByName("movieDescribe")[0].value;
		var mdescribehint = document.getElementById("mdescribe");
		var descrieTrue = true;
		/*if(mdescribe.length<140){
			mdescribehint.innerHTML= "影人介绍请大于140字";
		}else if(mdescribe.length>2000){
			mdescribehint.innerHTML="影人介绍请少于2000字";
		}else{
			describeTrue = true;
		}*/
		if(nameTrue&&coverTrue&&actorTrue&&directorTrue&&typeTrue&&
				longTrue&&languageTrue&&dateTrue&&describeTrue){
			return true;
		}else{
			return false;
		}

	}