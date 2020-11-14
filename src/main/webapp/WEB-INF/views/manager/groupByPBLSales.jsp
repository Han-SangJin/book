<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> pblMap = (List<Map<String,Object>>) request.getAttribute("pblMap");
%>
<html>
<head>
<style>
.pblTable{border-collapse: collapse;border-top: 3px solid #6525ed;font:1.2em NanumBarunGothic;}
.pblTable th{color :#6525ed; background:#d6c6fa; text-align: center; }
.pblTable th, .pblTable td{padding: 10px; border: 1px solid #ddd;}
.pblTable th:first-child, .pblTable td:first-child{border-left :none;}
.pblTable th:last-child, .pblTable td:last-child{border-right :none;}
.pblTable tr td{text-align: center;}
.pblTable caption {text-align: center;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출판사별 매출조회</title>
</head>
<body>
<table class="pblTable"> 
	<tr>
		<th>No.</th>
		<th>출판사</th>
		<th>분류코드</th>
		<th>판매량</th>
		<th>판매액</th>
	</tr>
	<%
		for(int i=0; i<pblMap.size();i++){
	%>
		<tr>
			<td><%=(i+1) %></td>
			<td><%=pblMap.get(i).get("bkPbl") %></td>
			<td><%=pblMap.get(i).get("prodCd") %></td>
			<td><%=pblMap.get(i).get("qty") %></td>
			<td><%=pblMap.get(i).get("price") %></td>
		</tr>
	<%		
		}
	%>
</table>
</body>
</html>