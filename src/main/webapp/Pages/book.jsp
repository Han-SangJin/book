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
  <script src="<%=request.getContextPath() %>/js/book.js"></script>
  
    
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
		 		}
		 		 
		 		 
		 		 
		 		
		 		
		 		else if(actionname == "bookdelete"){
					imgdeleteServer(idx, this);
		 		}
		 		
	 		})	    
	 		     
	 		
	 	// 수정 모달창에서 데이타 수정후 전송버튼 클릭
	 	$('#usend').on('click', function(){
	 		updateServer();
	 		
			// 모달창 닫기 
			$('#uModal').modal('hide');
			// 모달창의 입력데이타 지우기 
			$('.indata').val("");
		    
	 }) 
	 
	 
	 

 		 
})     

</script>

<body> 

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

