/**
 * 마이페이지에서 사용할 자바 스크립트
 */


var showMyInfo = function(memid){
	$.ajax({
		url : '/RainBooks/memInfo',
		data : {"memId" : memid},
		type : 'post',
		success : function(res){
			$('#content').empty();
			$('#content').html(res);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})
}
var delMem = function(memid){
	$.ajax({
		url : '/RainBooks/deleteMember?memId='+memid,
		type : 'get',
		dataType : 'json',
		success : function(res){
			alert("결과 : "+ res.msg);
			if(res.code){
				window.location.href = "http://localhost/RainBooks/memLogout";
			}else{
				return false;
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})
}



var updateMyInfo = function(info){
	$.ajax({
		url : '/RainBooks/updateInfo',
		data : info,
		type : 'post',
		dataType : 'json',
		success : function(res){
//			$('#memInfoForm').text(res.msg);
			if(res.msg == true){
				alert( "수정 완료 \n 다시 로그인해 주십시오.");
				window.location.href=res.url;
			} else{
				alert( "수정 실패 \n 마이페이지로 돌아갑니다.");
				return false;
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})
}


var addrSearch = function(addrKey){
	$.ajax({
		url : '/RainBooks/addrSearch',
		data : {"key" : addrKey},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = "<table id='addrTab' border='1'><tr id='addrHead'><td>우편번호</td><td class='addrResult'>주소</td></tr>";
			$.each(res, function(i, v){
				code+="<input type='hidden' id='addrSeq' name='addrSeq' value='"+v.addr_sq+"'>";
				code+=`<tr class='addrCont'><td>${v.addr_zip}</td><td class='addrResult'>${v.addr1}</td></tr>`;
			})
			code += "</table>";
			$('#addrResult').html(code);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		} 
		
	})
	
}

var charge = function(money){
	$.ajax({
		url : '/RainBooks/eMoneyCharge',
		data : {"money" : money},
		type : 'post',
		success : function(){
			alert("충전이 완료되었습니다.");
			window.location.href = "http://localhost/RainBooks/Pages/myPage.jsp";
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		}
	})
}

var refund = function(money){
	$.ajax({
		url : '/RainBooks/eMoneyRefund',
		data : {"money" : money},
		type : 'post',
		success : function(){
			alert("환불이 완료되었습니다.");
			window.location.href = "http://localhost/RainBooks/Pages/myPage.jsp";
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		}
	})
}

