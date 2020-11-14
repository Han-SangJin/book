/**
 * 
 */

var showOrdHistoryDetail = function(ordNum){
	$.ajax({
		url : '/RainBooks/showOrdHistoryDetail',
		data : {"ordNum" : ordNum},
		dataType : 'json',
		type : 'post',
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

var ordCancel = function(ordNo, ordSt){
	$.ajax({
		url : '/RainBooks/ordCancel?ordNo='+ordNo+'&ordSt='+ordSt,
		type : 'get',
		dataType : 'json',
		success : function(res){
			alert("주문 취소 결과 :" + res.sw);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	
	})
	
}

var ordRefund = function(ordNo, ordSt){
	$.ajax({
		url : '/RainBooks/ordRefund?ordNo='+ordNo+'&ordSt='+ordSt,
		type : 'get',
		dataType : 'json',
		success : function(res){
			alert("환불 신청 결과 :" + res.sw);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	
	})
	
}
	
var ordComp = function(ordNo, ordSt){
	$.ajax({
		url : '/RainBooks/ordComp?ordNo='+ordNo+'&ordSt='+ordSt,
		type : 'get',
		dataType : 'json',
		success : function(res){
			alert("수령완료 결과 :" + res.sw);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	
	})
	
}