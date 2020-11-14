/**
 * 
 */

var msg="";
var checkId = function(memId){
	$.ajax({
		data : {"memId" : memId},
		url : '/RainBooks/CheckId',
		type : 'get',
		dataType : 'json',
		success : function(res){
			if(res.sw=="1"){
				msg="사용이 가능한 아이디 입니다";
				$('#checkRes').html(msg).css({'font':'1.2em a말괄량이','color':'black','padding-top':'5px','padding-left':'5px','margin':'5px'});
			}else{
				msg="이미 사용중인 아이디 입니다";
				$('#checkRes').html(msg).css({'font':'1.2em a말괄량이','color':'red','padding-top':'5px','padding-left':'5px','margin':'5px'});
			}
		},
		error : function(xhr){
			alert("상태코드 : "+xhr.status);
		}
	})
}

var checkPass = function(pass1, pass2){
	if(pass1 == pass2){
		res1 = "일치합니다";
		$('#checkPassRes').html(res1).css({'font' :'1.2em a말괄량이','color':'black','padding-top':'5px','padding-left':'5px','margin':'5px'});
	}else{
		res2 = "일치하지 않습니다";
		$('#checkPassRes').html(res2).css({'font' :'1.2em a말괄량이','color':'red','padding-top':'5px','padding-left':'5px','margin':'5px'});
	}
}

var searchAddr = function(addr1){
	$.ajax({
		data : {"addr1":addr1},
		url : '/RainBooks/SearchAddr',
		type : 'get',
		dataType : 'json',
		success : function(res){
			code =	"<table border=1>";
			code +=	"<tr><td>우편번호</td><td>주소</td><td>번지</td><td>시퀀스</td></tr>";
			$.each(res,function(i,v){
				code += "<tr class='ziptr'><td>"+v.zip+"</td><td>"+v.addr+"</td><td>"+v.bunji+"</td><td>"+v.sq+"</td></tr>";
			})
			code+="</table>";
			$('#addrResult').html(code);
		},
		error : function(xhr){
			alert("상태코드 : "+xhr.status);
		}
	})
}