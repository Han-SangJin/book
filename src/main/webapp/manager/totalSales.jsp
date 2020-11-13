<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String totalsales = (String)request.getAttribute("totalSales");
	List<Map<String, Object>> bkMap = (List<Map<String, Object>>)request.getAttribute("bkMap");
%>    
<script>
</script>
<style>
.totalTable{border-collapse: collapse;border-top: 3px solid #6525ed;font:1.2em NanumBarunGothic;}
.totalTable th{color :#6525ed; background:#d6c6fa; text-align: center; }
.totalTable th, .totalTable td{padding: 10px; border: 1px solid #ddd;}
.totalTable th:first-child, .totalTable td:first-child{border-left :none;}
.totalTable th:last-child, .totalTable td:last-child{border-right :none;}
.totalTable tr td{text-align: center;}
.totalTable caption {text-align: center;}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>총 매출현황</title>
</head>
<body>
	<table class="totalTable">
		<caption>총 매출 : <%= totalsales %></caption>
		<tr>
			<th>No.</th>
			<th>회원ID</th>
			<th>주문날짜</th>
			<th>주문번호</th>
			<th>상품분류</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<%
			SimpleDateFormat format1;
			for(int i=0;i<bkMap.size();i++){
				format1 = new SimpleDateFormat("yyyy년 MM월 dd일");
		%>
			<tr>
				<td><%= (i+1) %></td>
				<td><%= bkMap.get(i).get("memId") %></td>
				<td><%= format1.format(bkMap.get(i).get("ordDt")) %></td>
				<td><%= bkMap.get(i).get("ordNo") %></td>
				<td><%= bkMap.get(i).get("prodCd") %></td>
				<td><%= bkMap.get(i).get("bkgreCd") %></td>
				<td><%= bkMap.get(i).get("bkNM") %></td>
				<td><%= bkMap.get(i).get("bkSelPrice") %></td>
				<td><%= bkMap.get(i).get("qty") %></td>
				<td><%= bkMap.get(i).get("price") %></td>
			</tr>
		<%	} %>
	</table>
</body>
</html>