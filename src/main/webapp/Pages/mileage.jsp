<%@page import="rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% MemberVO member = (MemberVO)request.getAttribute("member"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마일리지</title>
<style>
	#mileageTab td{
		width : 300px;
		height : 100px;
		text-align: right;
		font-size : 18px;
	}
	body{
		font-family: fantasy;
	}
</style>
</head>
<body>
<h2><%=member.getMemNm() %>님의 마일리지 보유 현황</h2>
<hr>
<table id="mileageTab"  align="left">
<tr><td>현재 마일리지 : </td><td><%=member.getMemMile() %> pt</td></tr>
</table>

</body>
</html>