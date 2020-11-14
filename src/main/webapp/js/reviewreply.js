/**
 *  <result property="rvReNo" column="RVRE_NO"/>
 	<result property="rvNo" column="RV_NO"/>
 	<result property="memId" column="MEM_ID"/>
 	<result property="rvReCont" column="RVRE_CONT"/>
 	<result property="rvReDt" column="RVRE_DT"/>
 */



var rvreplyListServer = function(button){
	
	$.ajax({
		data : {'rvNo' : rvreply.rvNo },
		url : '/RainBooks/RvReplyList',
		type : 'get',
		dataType : 'json',
		success : function(res){
			$(button).parents('.panel').find('.rep').remove();
			repl = "";
			
			
			$.each(res, function(i, v){ 
				repl += '   <div class="panel-body rep" display:inline-block>';
				repl += '   	<p style="float:left; width:70%;">';
				repl += ' 			<span>' + v.memId + '&nbsp;&nbsp;&nbsp;&nbsp;';
				repl += 			v.rvReDt + '&nbsp;&nbsp;&nbsp;&nbsp;';
				repl += ' 			</span><br><br>';
				repl += ' 			<span class="cont">' + v.rvReCont + '</span>';
				repl += ' 		</p>';
				repl += '  		<p style="float:right; width:20%;">';
				repl += '  			<input idx="' + v.rvReNo + '" type="button" name="r_modify" class="action" value="댓글수정">';
				repl += '  			<input idx="' + v.rvReNo + '" type="button" name="r_delete" class="action" value="댓글삭제">';
				repl += '  		<hr>';
				repl += '  		</p>';
				repl += '  </div>'; 
			
			})
			
			$(button).parents('.panel').find('.pbody').append(repl);
			
		},
		error : function(xhr){
			//alert("상태 : " + xhr.status);
		}
		 
	})
	
}




var rvreplyUpdateServer = function(){
	
	$.ajax({
		url : '/RainBooks/RvReplyUpdate',
		data : rvreply,
		type : 'post',
		dataType : 'json',
		success : function(res){
			//alert(res.sw);
		},
		error : function(xhr){
			//alert("상태 : " + xhr.status);
		}
	}) 
}
  
  
  
  
var rvreplyDeleteServer = function(idx, button){
	
	$.ajax({
		url : '/RainBooks/RvReplyDelete',
		data : {"rvReNo" : idx },
		type : 'post',
		dataType : 'json',
		success : function(res){
			//alert(res.sw);
			$(button).parents('.rep').remove();
		},
		error : function(xhr){
			//alert("상태 : " + xhr.status);
		}
	})
}




var rvreplySaveServer = function(button){
	
	// reply 객체를 서버로 보낸다.
	$.ajax({
		url : '/RainBooks/RvReplySave', 
		data : rvreply,
		type : 'post',
		success : function(res){
			//alert(res.sw);
			rvreplyListServer(button);
		},
		error : function(xhr){
			//alert("상태 : " + xhr.status);
		}, 
		dataType : 'json'
		
	})
	
	
}
