<%@page import="kr.or.ddit.book.model.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/book.js"></script>
  
<script>

$(function(){

		// 글쓰기 모달창 에서 데이터 입력후에 전송버튼 클릭
		 $('#send').on('click', function(){
			 
			 saveServer();
				// 모달창 닫기 
				$('#wModal').modal('hide');
				// 모달창의 입력데이타 지우기 
				$('.indata').val("");
			 })
			 
			    
			 
}) 
</script>  
<body>
	
	<div class="result1"></div>
	
	
	
	
	<form name="wform" id="wform">
	          
	      <label>ISBN</label><input multiple="multiple" class="indata" type="text" id="bkIsbn" name="bkIsbn" value=""><br> 
	      <label>상품구분코드</label><input multiple="multiple" class="indata" type="text" id="prodCd" name="prodCd" value=""><br>
	      <label>도서장르코드</label><input multiple="multiple" class="indata" type="text" id="bkGreCd" name="bkGreCd" value=""><br>
	      <label>대여이용여부</label><input multiple="multiple" class="indata" type="text" id="bkSt" name="bkSt" value=""><br>
	      <label>도서명</label><input multiple="multiple" class="indata" type="text" id="bkNm" name="bkNm" value=""><br>
	      <label>저자</label><input multiple="multiple" class="indata" type="text" id="bkAtr" name="bkAtr" value=""><br>
	      <label>출판사</label><input multiple="multiple" class="indata" type="text" id="bkPbl" name="bkPbl" value=""><br>
	      <label>페이지 수</label><input multiple="multiple" class="indata" type="text" id="bkPage" name="bkPage" value=""><br>
	      <label>소개글</label><br>
	      <textarea class="indata" id="bkArti" name="bkArti" rows="20" cols="50"></textarea><br>
	      <label>평점</label><input multiple="multiple" class="indata" type="text" id="bkGrade" name="bkGrade" value=""><br>
	      <label>판매가</label><input multiple="multiple" class="indata" type="text" id="bkSelPrice" name="bkSelPrice" value=""><br>
	      <label>정가</label><input multiple="multiple" class="indata" type="text" id="bkFixPrice" name="bkFixPrice" value=""><br>
	      <label>판매량</label><input multiple="multiple" class="indata" type="text" id="bkSalesQty" name="bkSalesQty" value=""><br>
	      <label>파일ID</label><input multiple="multiple" class="indata" type="file" id="fileId" name="fileId" value=""><br>
	      <hr>
	      
		  <input id="send" type="submit" value="전송" style="float: right;">
	 	    
	</form>  
		  
		  
		  
	
	<form method="post" enctype="multipart/form-data" action="/test/BookImgSave">
	
		  <label>첨부파일(이미지ID)</label><input class="indata" type="file" id="imgId" name="imgId" value=""><br>
		  <input id="filesend" type="submit" value="파일 등록">
	 
	</form>

</body>