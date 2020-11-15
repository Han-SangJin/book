



var imgServer = function(){
	$.ajax({
		url : '/RainBooks/BookImgSave',
		type : 'post',
		dataType : 'json',
		success : function(res){
			
			res.imgId = id;
			
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}