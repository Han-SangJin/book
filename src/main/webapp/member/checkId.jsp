<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	boolean res = (Boolean)request.getAttribute("result");
	if(res){
%>
	{"sw" : "1" }
<%
	}else{
%>
	{"sw" : "2" }
<%	
	}
%>