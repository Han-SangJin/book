W<%@page import="rb.cmm.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVO> mList = (List<MemberVO>) request.getAttribute("memList");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
<head>
<style>
.table{border-collapse: collapse;border-top: 3px solid #5a810c;}
.table th{color: #81b912; background: #f7fced; text-align: center; }
.table th, .table td{padding: 10px; border: 1px solid #ddd;}
.table th:first-child ,.table td:first-child{border-left: 0;} 
.table th:last-child ,.table td:last-child{border-left: 0;} 
.table tr td {text-align: center;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원검색테이블</title>
</head>
<body>
	<table class="table">
		<tr>
			<th>No.</th>
			<th>회원상태</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
		</tr>
		<%
			for(int i=0; i<mList.size(); i++){
			MemberVO mvo = mList.get(i);
			String memCd = Integer.toString(mvo.getMemCd());
			String memGender = Integer.toString(mvo.getMemGender());
			if(memCd.equals("1")){memCd="정상회원";}else if(memCd.equals("0")){memCd="탈퇴회원";}
			if(memGender.equals("1")){memGender="남자";}else if(memGender.equals("2")){memGender="여자";}
		%>
		<tr>
			<td><%=(i+1) %></td>
			<td><%= memCd %></td>
			<td><%= mvo.getMemId() %></td>
			<td><%=mvo.getMemNm() %></td>
			<td><%=memGender %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
