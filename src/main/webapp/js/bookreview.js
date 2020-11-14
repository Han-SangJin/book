/**
 * 
 */
/*
function idchk(){
	이렇게 해도 됨
}
*/

currentpage = 1;


var writeServer = function(){
	$.ajax({
		url : '/RainBooks/insertBookReview',
		data : $('#wform').serialize(),   
		dataType : 'json',
		type : 'post',
		success : function(res){
			alert(res.sw);
			readServer();
		},
		error : function(xhr){
			alert("상태 : " +  xhr.status);
		}
		
	})
	
}


var viewServer = function(){
	
	$.ajax({
		url : "/RainBooks/updateBookReview",
		type : 'get',
		data : { "rvNo" : idx },
		dataType : 'json',
		success : function(res){
			$('#urvNo').val(res.rvNo);
			$('#urvTitle').val(res.rvTitle);
		//	rvCont = res.rvCont.replace(/<br>/g, "\n")
			$('#urvCont').val(rvCont);
			$('#uModal').modal('show');
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	}) 
}


var updateboardServer = function(){
	
	$.ajax({
		
		url : '/RainBooks/updateBookReview',
		type : 'post',
		data : $('#uform').serialize(),
		dataType : 'json',
		success : function(res){
			readServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})
	
}
 


var searchbookreviewServer = function(rvNo){
	
	$.ajax({
		
		url : '/RainBooks/selectBookReview',
		type : 'get',
		data : { 'rvNo' : rvNo },
		success : function(res){
			//$('#reviewdetailno').val(res.rvNo);
			//$('#result2').html(res);
		},
		error : function(xhr){
			 alert("상태 : " + xhr.status);
		},
		dataType :  'html'
		
	})
	
}


	
var viewServer = function(){
	
	$.ajax({
		url : "/RainBooks/updateBookReview",
		type : 'get', 
		dataType : 'json',
		data : { "rvNo" : idx },  // count.0
		success : function(res){
			//alert(res.rvTitle);
			$('#urvNo').val(res.rvNo);
			$('#urvTitle').val(res.rvTitle);
		//	content = res.rvCont.replace(/<br>/g, "\n")
			$('#urvCont').val(res.rvCont);
			$('#urvGr').val(res.rvGr);
			   
			$('#uModal').modal('show');
			 
		}, 
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
		
		
	})
}

var deleteServer = function(idx, button){
	$.ajax({
		url : '/RainBooks/delete',
		data : {"rvNo" : idx },
		type : 'post',
		dataType : 'json',
		success : function(res){
			alert(res.sw);
			$(button).parents('.rep').remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
	
}

var readpageServer = function(cpage){
	
	
	$.getJSON(
			
		'/RainBooks/BookReviewListPage',	
		{"page" : cpage},
			function(res){
			$('.result1').empty();
				code = '<div class="panel-group" id="accordion">';
				$.each(res.data, function(i, v) {
			    
		code += '	   <div class="panel panel-default">';
		code += '	      <div class="panel-heading">';
		code += '	       <h4 class="panel-title">';
		code += '	        <a idx="'+ v.rvNo + '" class="action" name="list" id="a" data-toggle="collapse" data-parent="#accordion" href="#collapse'+ v.rvNo +  '">  &nbsp;&nbsp;&nbsp; '+ v.rvNo + ".&nbsp;&nbsp;&nbsp " + v.rvTitle  +' </a> ';     
		code += '	        </h4>';
		code += '	      </div>';
		code += '	   <div id="collapse'+ v.rvNo +  '"  class="panel-collapse collapse">';
		code += '	   <div class="panel-body pbody">';
		code += '	    	<p style="float:left; width:70%;">';
		code += '	  			 글 번호 : '+ v.rvNo +  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 회원 아이디 : '+ v.memId +  ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 주문번호 : '+ v.ordNo +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 카트번호 : '+ v.cartNo +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 날짜 : '+ v.rvDt +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>';
		code += '				 평점 : '+ v.rvGr +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>';
		code += '				 <hr>'; 
		code += '	    	</p> ';
		code += '	   		<p style="float:right; width:20%;">';
		code += '	    			<input idx="' + v.rvNo + '" type="button" data-target="#uModal" name="modify" class="action" value="수정">';
		code += '	   				<input idx="' + v.rvNo + '" type="button" name="delete" class="action" value="삭제">';
		code += '	   		</p>';
		code += '	    		<hr>';
		code += '	   	<p>';
		code += '				 서평 내용 : '+ v.rvCont;
		code += '	  	</p>';
		code += '	  	<p><br><br>';
		code += '	  		<textarea cols="80"></textarea>';
		code += '	  		<input idx="' + v.rvNo + '" type="button" name="reply" class="action" value="등록">';
		code += '	 	 </p>';
		code += '	      </div>';
		code += '	   </div>';
		code += '	 </div>';
		code += '</div>';
	})
				code += '</div>';
					
					$('.result1').append(code);
					
					
					totalpage = res.tpage;
					startpage = res.spage;
					endpage = res.epage;
					currentpage = res.cpage;
					
					// 이전버튼 출력
					$('#btngroup1').empty();
					pager = "";
					if(startpage > 1){
						pager += '<ul class="pager">';
						pager += 	'<li class="previous"><a href="#">Previous</a></li>';
						pager += '</ul>';
						$(pager).appendTo('#btngroup1');
					}
					
					
					// 페이지 번호 출력
					pager = '<ul class="pagination pager">';
					for(i=startpage; i<=endpage; i++){
						
						if(currentpage == i){
							pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
						}else{
							pager += '<li><a class="paging" href="#">' + i + '</a></li>';
						}
					}
					pager += '</ul>';
					$(pager).appendTo('#btngroup1');
					
					
					// 다음버튼 출력
					if(endpage < totalpage) {
						pager = '<ul class="pager">';
						pager += 	'<li class="next"><a href="#">Next</a></li>';
						pager += '</ul>';
						$(pager).appendTo('#btngroup1');
					}
					
		}

	)	
	
}




var readServer = function(capge){
	
	
	$.getJSON(
			
		'/RainBooks/selectBookReviewAll',	
			function(res){
			$('.result1').empty();
				code = '<div class="panel-group" id="accordion">';
				$.each(res, function(i, v) {
			    
		code += '	   <div class="panel panel-default">';
		code += '	      <div class="panel-heading">';
		code += '	       <h4 class="panel-title">';
		code += '	        <a data-toggle="collapse" data-parent="#accordion" href="#collapse'+ v.rvNo +  '">  &nbsp;&nbsp;&nbsp; ' + v.rvTitle  +' </a> ';     
		code += '	        </h4>';
		code += '	      </div>';
		code += '	   <div id="collapse'+ v.rvNo +  '"  class="panel-collapse collapse">';
		code += '	    <div class="panel-body">';
		code += '	    	<p style="float:left; width:70%;">';
		code += '	  			 글 번호 : '+ v.rvNo +  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 회원 아이디 : '+ v.memId +  ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 주문번호 : '+ v.ordNo +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 카트번호 : '+ v.cartNo +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		code += '				 날짜 : '+ v.rvDt +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>';
		code += '				 평점 : '+ v.rvGr +  '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>';
		code += '				 <hr>'; 
		code += '	    	</p> ';
		code += '	   		<p style="float:right; width:20%;">';
		code += '	    			<input idx="' + v.rvNo + '" type="button" data-target="#uModal" name="modify" class="action" value="수정">';
		code += '	   				<input idx="' + v.rvNo + '" type="button" name="delete" class="action" value="삭제">';
		code += '	   		</p>';
		code += '	    		<hr>';
		code += '	   	<p>';
		code += '				 서평 내용 : '+ v.rvCont;
		code += '	  	</p>';
		code += '	  	<p>';
		code += '	  		<textarea cols="80"></textarea>';
		code += '	  		<input type="button" name="reply" class="action" value="등록">';
		code += '	 	 </p>';
		code += '	      </div>';
		code += '	   </div>';
		code += '	 </div>';
		code += '</div>';
	})
				code += '</div>';
					
					$('.result1').append(code);
					
					
		}

	)	
}