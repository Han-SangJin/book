<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$('#showResult').on('click', function(){
		category = $('#category option:selected').val();
		ordSt = $('#searchBar input:radio:checked').val();
		console.log(category);
		console.log(ordSt);
		$.ajax({
			url : '/RainBooks/mngOrdHistory',
			type : 'get',
			data : {"category" : category, "ordSt" : ordSt},
			success : function(res){
				$('#resultView').empty();
				$('#resultView').html(res);
			}, 
			error : function(xhr){
				alert("상태 : "+xhr.status);
			}
		})
	})
})
</script>
<style>
#searchBar{
	width : 1300px;
	margin : 10px;
}
</style>
</head>
<body>
	<h4>검색 조건</h4>
	<table border="0" id="searchBar">
		<tr>
			<td>상품 분류 : <select id="category">
							<option class="category" id="all" name="category" value="">전체</option> 
							<option class="category" id="book" name="category" value="P001">도서</option> 
							<option class="category" id="ebook" name="category" value="P002">eBook</option> 
						</select> 
			</td>
			<td>주문 상태 : <input type="radio" name="ordSt" value="" checked="checked">전체
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="1">배송 준비
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="2">배송중
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="3">수령 완료	
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="4">주문 취소	
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="5">환불 신청	
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="6">환불 완료	
						 &nbsp;&nbsp;<input type="radio" name="ordSt" value="7">환불 거부	
			 </td>
			<td><input type="button" id="showResult" value="조회"></td>		
		</tr>
	</table>
	<div id="resultView"></div>
</body>
</html>