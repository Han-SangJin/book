W<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO mvo = (MemberVO) request.getAttribute("mvo");
	String memCd="";
	String memGender="";
	if(mvo.getMemCd()==1){memCd="정상회원";}else{memCd="탈퇴회원";}
	if(mvo.getMemGender()==1){memGender="남자";}else{memGender="여자";}
	String addr = (String) request.getAttribute("addr");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/js/searchMember.js"></script>
<html>
<style>
table{border-collapse: collapse;}
.table1{border-collapse: collapse;border-top: 3px solid #ef854c;font:1.2em NanumBarunGothic;}
.table1 th{color:#ef854c;background: #f9dccb;text-align: center;}
.table1 th, .table1 td{padding: 10px; border: 1px solid #ddd;}
.table1 th:first-child , .table1 td:first-child{border-left: 0;}
.table1 th:last-child , .table1 td:last-child{border-left: 0;}
.table1 tr td{text-align:center;}
</style>
<script>
$(function(){
	$('#memDelete').on('click',function(){
		var deleteBtn = $(this);
		var tr = deleteBtn.parent().parent(); // 클릭한 행
		var td = tr.children(); // 클릭한 행의 td들
		var memId = td.eq(1).text();
		console.log(memId);
		deleteMember(memId); // 클릭한 행의 memId 넘겨줌
	})
})
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
</head>
<body>
<table class="table1">
	<tr>
		<th>회원상태</th>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>생일</th>
		<th>기본주소</th>
		<th>상세주소</th>
		<th>휴대폰번호</th>
		<th>메일</th>
		<th>E-Money</th>
		<th>마일리지</th>
		<th>탈퇴처리</th>
	</tr>
	<tr>
		<td><%=memCd %></td>
		<td><%=mvo.getMemId() %></td>
		<td><%=mvo.getMemNm()%></td>
		<td><%=memGender %></td>
		<td><%=mvo.getMemBir()%></td>
		<td><%=addr%></td>             
		<td><%=mvo.getAddrDetail()%></td>        
		<td><%=mvo.getMemHp()%></td> 
		<td><%=mvo.getMemMail()%></td>
		<td><%=mvo.geteMoney()%></td>
		<td><%=mvo.getMemMile()%></td>
		<td><input id="memDelete" type="button" value="회원삭제"></td>
	</tr>
</table>
</body>
</html>