function formatCheck(){
		var fName = document.filmmakerform.filmmakerName.value;
		var fnamehint = document.getElementById("fname");
		var namecheck = new RegExp("^[\u4e00-\u9fa5\·]+$");
		var fnameTrue = false;
		if(fName==""){
			fnamehint.innerHTML = "[影人名不能为空]"
		}else if(fName.length>20){
			fnamehint.innerHTML="[影人名不能大于20个字]";
		}else if(!namecheck.test(fName)){
			fnamehint.innerHTML="[影人名格式不正确]"
		}else{
			fnameTrue=true;
			fnamehint.innerHTML=""
		}
		var fPhoto = document.filmmakerform.filmmakerPhoto.value;
		var fphotohint = document.getElementById("fphoto");
		var fphotoTrue = false;
		if(fPhoto.trim()==""){
			fphoto.innerHTML="[影人照片不能为空]";
		}else{
			fphotoTrue = true;
			fphoto.innerHTML="";
		} 
		var fSex = document.filmmakerform.filmmakerSex;
		var fsexhint = document.getElementById("fsex");
		var fsexTrue = false;
		fsexhint.innerHTML = "[请选择影人性别]"
		for(var i = 0;i<fSex.length;i++){
			if(fSex[i].checked){
				fsexTrue = true;
				fsexhint.innerHTML = ""
				break;
			}
		}
		
		var fBirth = document.filmmakerform.filmmakerBirth.value;
		var fbirthhint = document.getElementById("fbirth")
		var fbirthTrue = false;
		var c = "^(?:(?!0000)[0-9]{4}-"+
				"(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|"+
						"(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|"+
								"(?:0[48]|[2468][048]|[13579][26])00)-02-29)$";
		var birthCheck = new RegExp(c);
		if(fBirth==""){
			fbirthhint.innerHTML="[影人生日不能为空]"
		}else if(!birthCheck.test(fBirth)){
			fbirthhint.innerHTML="[影人生日不正确]"
		}else{
			fbirthTrue = true;
			fbirthhint.innerHTML=""
		}
		var fBirthPlace = document.filmmakerform.filmmakerBirthPlace.value;
		var fbirthplaceCheck = new RegExp("[\u4e00-\u9fa5]");
		var fbirthplacehint = document.getElementById("fbirthplace");
		var fbirthplaceTrue = false;
		if(fBirthPlace ==""){
			fbirthplacehint.innerHTML = "[影人出生地不能为空]"
		}else if(fBirthPlace.length>20){
			fbirthplacehint.innerHTML = "[影人出生请小于20字]"
		}else if(!fbirthplaceCheck.test(fBirthPlace)){
			fbirthplacehint.innerHTML = "[影人出生地格式不正确]";
		}else{
			fbirthplaceTrue = true;
			fbirthplacehint.innerHTML = "";
		}
		var fJob = document.filmmakerform.filmmakerJob;
		var fjobhint = document.getElementById("fjob");
		var fjobTrue = false;
		fjobhint.innerHTML = "[请选择影人职业]"
		for(var i = 0;i<fJob.length;i++){
			if(fJob[i].checked){
				fjobTrue = true;
				fjobhint.innerHTML = ""
				break;
			}
		}
		
		var fDescribe = document.getElementsByName("filmmakerDescribe")[0].value;
		
		var fjobhint = document.getElementById("fdescribe");
		var fdescribeTrue = false;
		if(fDescribe==""){
			fjobhint.innerHTML="[影人介绍不能为空]";
		}else if(fDescribe.length<20){
			fjobhint.innerHTML="[影人介绍不能少于20字]";
		} else if(fDescribe.length>2000){
			fjobhint.innerHTML="[影人介绍不能多于2000字]"
		} else{
			fdescribeTrue = true;
			fjobhint.innerHTML="";
		}
		if(fnameTrue && fphotoTrue && fsexTrue && fbirthTrue && fbirthplaceTrue && fjobTrue && fdescribeTrue){
			return true;
		}else{
			return false;
		}
		
	}
	