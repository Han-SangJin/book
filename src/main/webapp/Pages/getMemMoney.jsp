<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int memMoney = (Integer) request.getAttribute("memMoney");
%>
{ "sw" : "<%= memMoney %>" }