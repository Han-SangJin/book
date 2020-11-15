<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
    
</head> 
<style> 
	label{   
		display : inline-block;
		width : 100px;
		height : 30px;
	} 
	td.bkIsbn{
		width : 10px;
	}  
	td.bkArti{ 
		width : 500px;
	}     
	div#btngroup1{ 
		width : 150px;  
		height : 10px;
	}
	table {
		text-align : center;	
	}  
	    
</style> 
<script>


var listServer = function(cpage){
	 
	$.ajax({
		
		url: '/book/BookListPage',
		data : { "page" : cpage },
		type : 'get',
		dataType : 'json',
		success : function(res){
		
			$('.result1').empty();
			code = '';
			code += '		<table border="1">';
			code += '		<tr>';
			code += '			<td class="bkIsbn">ISBN코드</td>';
			code += '			<td>상품구분코드</td>';
			code += '			<td>도서장르코드</td>';
			code += '			<td>대여이용여부</td>';
			code += '			<td>도서명</td>';
			code += '			<td>저자</td>';
			code += '			<td>출판사</td>';
			code += '			<td>페이지 수</td>';
			code += '			<td class="bkArti">소개글</td>';
			code += '			<td>평점</td>;';
			code += '			<td>판매가</td>';
			code += '			<td>정가</td>';
			code += '			<td>판매량</td>';
			code += '			<td>파일ID</td>';
			code += '			<td>이미지ID</td>';
			code += '			<td>출판날짜</td>';
			code += '			<td>수정</td>';
			code += '			<td>삭제</td>';
			code += '			<td>'+ cpage +'</td>';
			code += '		</tr>';
			$.each(res.data, function(i, v) {

			code += '		<tr>';
			code += '			<td class="bkIsbn">' + v.bkIsbn + '</td>';
			code += '			<td>' + v.prodCd + '</td>';
			code += '			<td>' + v.bkGreCd + '</td>';
			code += '			<td>' + v.bkSt + '</td>';
			code += '			<td><a href="#">' + v.bkNm + '</a></td>';
			code += '			<td>' + v.bkAtr + '</td>';
			code += '			<td>' + v.bkPbl + '</td>';
			code += '			<td>' + v.bkPage + '</td>';
			code += '			<td class="bkArti">' + v.bkArti + '</td>';
			code += '			<td>' + v.bkGrade + '</td>';
			code += '			<td>' + v.bkSelPrice + '</td>';
			code += '			<td>' + v.bkFixPrice + '</td>';
			code += '			<td>' + v.bkSalesQty + '</td>';
			code += '			<td>' + v.fileId + '</td>';
			code += '			<td>' + v.imgId + '</td>';
			code += '			<td>' + v.bkDt + '</td>';
			code += '	    	<td><input idx="' + v.bkIsbn + '" type="button" name="modify" class="action" value="수정"></td>';
			code += '	   		<td><input idx="' + v.bkIsbn + '" type="button" name="delete" class="action" value="삭제"></td>';
			code += '		</tr>';
			
			})
			code += '	</table>';
			
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
					
		},
		error : function(xhr){
		}
		
	})
}








var saveServer = function(bkIsbn,prodCd,bkGreCd,bkSt,bkNm,bkAtr,bkPbl,bkPage,bkArti,bkGrade,bkSelPrice,bkFixPrice,bkSalesQty,fileId,imgId){

	$.ajax({
		url : '/book/BookSave',
		dataType : 'json',
		data : {
			"bkIsbn":bkIsbn,
			"prodCd":prodCd,
			"bkGreCd":bkGreCd,
			"bkSt": bkSt,
			"bkNm":bkNm,
			"bkAtr":bkAtr,
			"bkPbl":bkPbl,
			"bkPage":bkPage,
			"bkArti":bkArti,
			"bkGrade":bkGrade,
			"bkSelPrice":bkSelPrice,
			"bkFixPrice":bkFixPrice,
			"bkSalesQty":bkSalesQty,
			"fileId":fileId,
			"imgId":imgId
			 
		},   
		dataType : 'json',
		type : 'post',
		success : function(res){
			listServer(1);
		},
		error : function(xhr){

		}
		
	})		
	
}	








var viewServer = function(){
	
	$.ajax({
		url : "/book/BookSelect",
		type : 'get',
		data : { "bkIsbn" : idx },
		dataType : 'json',
		success : function(res){
			$('#ubkIsbn').val(res.bkIsbn);
			$('#uprodCd').val(res.prodCd);
			$('#ubkGreCd').val(res.bkGreCd);
			$('#ubkSt').val(res.bkSt);
			$('#ubkNm').val(res.bkNm);
			$('#ubkAtr').val(res.bkAtr);
			$('#ubkPbl').val(res.bkPbl);
			$('#ubkPage').val(res.bkPage);
			
			bkArti = res.bkArti.replace(/<br>/g, "\n")
			$('#ubkArti').val(bkArti);
			
			$('#ubkGrade').val(res.bkGrade);
			$('#ubkSelPrice').val(res.bkSelPrice);
			$('#ubkFixPrice').val(res.bkFixPrice);
			$('#ubkSalesQty').val(res.bkSalesQty);
			$('#ufileId').val(res.fileId);
			$('#uimgId').val(res.imgId);
			$('#uModal').modal('show');
			  
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	
	})
}











var updateServer = function(bkIsbn,prodCd,bkGreCd,bkSt,bkNm,bkAtr,bkPbl,bkPage,bkArti,bkGrade,bkSelPrice,bkFixPrice,bkSalesQty,fileId,imgId){
	
	$.ajax({
		
		url : '/book/BookUpdate',
		type : 'post',
		data :  {
			"bkIsbn":bkIsbn,
			"prodCd":prodCd,
			"bkGreCd":bkGreCd,
			"bkSt": bkSt,
			"bkNm":bkNm,
			"bkAtr":bkAtr,
			"bkPbl":bkPbl,
			"bkPage":bkPage,
			"bkArti":bkArti,
			"bkGrade":bkGrade,
			"bkSelPrice":bkSelPrice,
			"bkFixPrice":bkFixPrice,
			"bkSalesQty":bkSalesQty,
			"fileId":fileId,
			"imgId":imgId
		},
		dataType : 'json',
		success : function(res){
			listServer(1);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})

}











var deleteServer = function(idx, button){
	$.ajax({
		url : '/book/BookDelete',
		data : {"bkIsbn" : idx },
		type : 'post',
		dataType : 'json',
		success : function(res){
			$(button).parents('.rep').remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
	
}









$(function(){
	
	listServer(1);
	$('#modifyForm').hide();
	 
 	// 페이지 번호 클릭하면 이벤트 설정
 	$('#btngroup1').on('click', '.paging', function(){
 		$('body').append($('#modifyForm'));
			$('#modifyForm').hide();
 		currentpage = $(this).text().trim();
 		listServer(currentpage);
 	})  
 	         
 	// 이전버튼 클릭하면 
 	$('#btngroup1').on('click', '.previous a', function(){
 		$('body').append($('#modifyForm'));
			$('#modifyForm').hide();
 		currentpage = parseInt($('.paging:first').text().trim()) -1;
 		listServer(currentpage);
 	})     
 	     
 	// 다음버튼 클릭하면
 	$('#btngroup1').on('click', '.next a', function(){
 		$('body').append($('#modifyForm'));
			$('#modifyForm').hide();
 		currentpage = parseInt($('.paging:last').text().trim()) +1;
 		listServer(currentpage);
 	}) 
	  
 		   
 		// 글쓰기 모달창 에서 데이터 입력후에 전송버튼 클릭
		 $('#send').on('click', function(){
			 
			 bkIsbn = $('#bkIsbn').val();
			 prodCd = $('#prodCd').val();
			 bkGreCd = $('#bkGreCd').val();
			 bkSt = $('#bkSt').val();
			 bkNm = $('#bkNm').val();
			 bkAtr = $('#bkAtr').val();
			 bkPbl = $('#bkPbl').val();
			 bkPage = $('#bkPage').val();
			 bkArti = $('#bkArti').val();
			 bkGrade = $('#bkGrade').val();
			 bkSelPrice = $('#bkSelPrice').val();
			 bkFixPrice = $('#bkFixPrice').val();
			 bkSalesQty = $('#bkSalesQty').val();
			 fileId = $('#fileId').val();
			 imgId = $('#imgId').val();
			 
			 saveServer(bkIsbn,prodCd,bkGreCd,bkSt,bkNm,bkAtr,bkPbl,bkPage,bkArti,bkGrade,bkSelPrice,bkFixPrice,bkSalesQty,fileId,imgId);
				// 모달창 닫기 
				$('#wModal').modal('hide');
				// 모달창의 입력데이타 지우기 
				$('.indata').val("");
				listServer(1);
			 })   
			    
 		      
 		   
		 // 버튼에 대한 이벤트
		 	$('.result1').on('click', '.action', function(){
		 		actionname = $(this).attr('name');
		 		idx = $(this).attr('idx');
		 		  
		 		if(actionname == "modify"){
		 			viewServer();
		 			
		 		}else if(actionname == "delete"){
		 			deleteServer(idx, this);
		 			listServer(1);
		 		}
		 		 
		 		 
		 		 
		 		
		 		
		 		else if(actionname == "bookdelete"){
					imgdeleteServer(idx, this);
					listServer(1);
		 		}
		 		
	 		})	    
	 		     
	 		
	 	// 수정 모달창에서 데이타 수정후 전송버튼 클릭
	 	$('#usend').on('click', function(){

			 bkIsbn = $('#ubkIsbn').val();
			 prodCd = $('#uprodCd').val();
			 bkGreCd = $('#ubkGreCd').val();
			 bkSt = $('#ubkSt').val();
			 bkNm = $('#ubkNm').val();
			 bkAtr = $('#ubkAtr').val();
			 bkPbl = $('#ubkPbl').val();
			 bkPage = $('#ubkPage').val();
			 bkArti = $('#ubkArti').val();
			 bkGrade = $('#ubkGrade').val();
			 bkSelPrice = $('#ubkSelPrice').val();
			 bkFixPrice = $('#ubkFixPrice').val();
			 bkSalesQty = $('#ubkSalesQty').val();
			 fileId = $('#ufileId').val();
			 imgId = $('#uimgId').val();
			 
	 		updateServer(bkIsbn,prodCd,bkGreCd,bkSt,bkNm,bkAtr,bkPbl,bkPage,bkArti,bkGrade,bkSelPrice,bkFixPrice,bkSalesQty,fileId,imgId);
	 		
			// 모달창 닫기 
			$('#uModal').modal('hide');
			// 모달창의 입력데이타 지우기 
			$('.indata').val("");
		    
	 }) 
	 
	 
	 

 		 
})     

</script>

<body> 
	상품관리
 <div id="modifyForm">
 	<textarea id="text" rows="5" cols="50"></textarea>
 	<input type="button" value="확인" class="action" name="reok" id="btnOK">
 	<input type="button" value="취소" class="action" name="reset" id="btnReset">
 </div>

  
    <input multiple="multiple" data-toggle="modal" data-target="#wModal" id="write" type="button" value="상품등록" ><br>
	<div class="result1"></div><br>
	 <div id="btngroup1"></div>
    
  <!-- 글쓰기 Modal -->
<div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
      
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">상품등록</h4>
      </div>
      <div class="modal-body">  
 	  	      
	      <form name="wform" id="wform">
	      <label>ISBN</label><input class="indata" type="text" id="bkIsbn" name="bkIsbn" value=""><br> 
	      <label>상품구분코드</label><input class="indata" type="text" id="prodCd" name="prodCd" value=""><br>
	      <label>도서장르코드</label><input class="indata" type="text" id="bkGreCd" name="bkGreCd" value=""><br>
	      <label>대여이용여부</label><input class="indata" type="text" id="bkSt" name="bkSt" value=""><br>
	      <label>도서명</label><input class="indata" type="text" id="bkNm" name="bkNm" value=""><br>
	      <label>저자</label><input class="indata" type="text" id="bkAtr" name="bkAtr" value=""><br>
	      <label>출판사</label><input class="indata" type="text" id="bkPbl" name="bkPbl" value=""><br>
	      <label>페이지 수</label><input class="indata" type="text" id="bkPage" name="bkPage" value=""><br>
	      <label>소개글</label><br>
	      <textarea class="indata" id="bkArti" name="bkArti" rows="20" cols="50"></textarea><br>
	      <label>평점</label><input class="indata" type="text" id="bkGrade" name="bkGrade" value=""><br>
	      <label>판매가</label><input class="indata" type="text" id="bkSelPrice" name="bkSelPrice" value=""><br>
	      <label>정가</label><input class="indata" type="text" id="bkFixPrice" name="bkFixPrice" value=""><br>
	      <label>판매량</label><input class="indata" type="text" id="bkSalesQty" name="bkSalesQty" value=""><br>
	      <label>파일ID</label><input class="indata" type="text" id="fileId" name="fileId" value=""><br>
	      <input class="indata" type="text" id="imgId" name="imgId" value="" style="display: none"><br>
	          		  
	      <hr>  
		  <input id="send" type="submit" value="전송" style="float: right;">
	 	    
		  </form>   
		  
		     
		  <form method="post" enctype="multipart/form-data" action="/RainBooks/BookImgSave" target="iframe1">
	
			  <label>첨부파일(이미지ID)</label><input class="indata" type="file" id="fimgId" name="imgId" value=""><br>
			  <input id="filesend" type="submit" value="파일 등록">
	   		  
		  </form>
		   
     	  <iframe name="iframe1" style="display:none;"></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>	
	
  </div>
</div>  
 
  
        
   
  <!--글 수정 form  Modal -->
<div id="uModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">정보수정</h4>
      </div>
      <div class="modal-body">  
          
	      <form name="uform" id="uform">
	    
		  <label>ISBN</label><input class="indata" type="text" id="ubkIsbn" name="bkIsbn"><br> 
	      <label>상품구분코드</label><input class="indata" type="text" id="uprodCd" name="prodCd"><br>
	      <label> 도서장르코드</label><input class="indata" type="text" id="ubkGreCd" name="bkGreCd"><br>
	      <label> 대여이용여부</label><input class="indata" type="text" id="ubkSt" name="bkSt"><br>
	      <label> 도서명</label><input class="indata" type="text" id="ubkNm" name="bkNm"><br>
	      <label>저자</label><input class="indata" type="text" id="ubkAtr" name="bkAtr"><br>
	      <label>출판사</label><input class="indata" type="text" id="ubkPbl" name="bkPbl"><br>
	      <label>페이지 수</label><input class="indata" type="text" id="ubkPage" name="bkPage"><br>
	      <label>소개글</label><br> 
	      <textarea class="indata" id="ubkArti" name="bkArti" rows="20" cols="50"></textarea><br> 
	      <label> 평점</label><input class="indata" type="text" id="ubkGrade" name="bkGrade"><br>
	      <label> 판매가</label><input class="indata" type="text" id="ubkSelPrice" name="bkSelPrice"><br>
	      <label> 정가</label><input class="indata" type="text" id="ubkFixPrice" name="bkFixPrice"><br>
	      <label> 판매량</label><input class="indata" type="text" id="ubkSalesQty" name="bkSalesQty"><br>
	      <label> 파일ID</label><input class="indata" type="text" id="ufileId" name="fileId"><br>
		  <input class="indata" type="text" id="uimgId" name="imgId" value="" style="display: none"><br>
	 
	      <input id="usend" type="button" value="수정완료"> 
	      </form>
     	    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div> 
 
	
</body>
</html>

