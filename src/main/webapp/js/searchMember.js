/**
 * 
 */

var ctx ="";
var hostIndex = location.href.indexOf(location.host) + location.host.length;
ctx = location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));

var searchMember = function(data, type){
	$.ajax({
		data : {"data" : data, "type" : type},
		url : ctx+'/searchMem',
		type : 'get',
		dataType : 'html',
		success : function(res){
			$('#searchResult').append(res);
		},
		error : function(xhr){
			alert("상태코드 : "+xhr.status);
		}
	})
}

var deleteMember = function(memId){
	$.ajax({
		data : {"memId" : memId},
		url : ctx+'/deleteMem',
		type : 'post',
		success : function(res){
			location.href= ctx+"/selectAllMember";
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		}
	})
}
