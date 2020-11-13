<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> map = (List<Map<String,Object>>) request.getAttribute("map");
%>
<html>
<style>
.prodTable{border-collapse: collapse;border-top: 3px solid #6525ed;font:1.2em NanumBarunGothic;}
.prodTable th{color :#6525ed; background:#d6c6fa; text-align: center; }
.prodTable th, .prodTable td{padding: 10px; border: 1px solid #ddd;}
.prodTable th:first-child ,.prodTable td:first-child{border-left :0 }
.prodTable th:last-child ,.prodTable td:last-child{border-right :0 }
.prodTable tr td{text-align: center};
.prodTable caption {text-align: center;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품분류별 매출 조회</title>
</head>
<body>
<table class="prodTable">
	<tr>
		<th>No.</th>
		<th>상품분류</th>
		<th>판매량</th>
		<th>매출액</th>
	</tr>
		<%
		String prodCd="";
			for(int i=0; i<map.size(); i++){
				if(map.get(i).get("prodCd").equals("P001")){
					prodCd="도서";
				}else{prodCd="eBook";}
		%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=prodCd %></td>
				<td><%=map.get(i).get("qty") %></td>
				<td><%=map.get(i).get("price") %></td>
			</tr>
		<%	}
		%>
</table>
</body>
</html>