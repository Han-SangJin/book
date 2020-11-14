<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int bkIsbn = (Integer)request.getAttribute("bkIsbn");
	System.out.println("bkIsbn= " + bkIsbn);
	
	if(bkIsbn > 0){
%>
	{ "sw" : "저장 성공" }
	
	 
<%	}else{ %>
	
	{ "sw" : "저장 실패" }
		
<%
	}
%>
    