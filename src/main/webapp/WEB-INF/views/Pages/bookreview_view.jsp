<%@page import="rb.cmm.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
  	    ReviewVO vo = (ReviewVO)request.getAttribute("Reviewvo");
    %>
    
    {
			 "rvNo" : "<%= vo.getRvNo() %>",  
			 "memId" : "<%= vo.getMemId() %>",   
			 "ordNo" : "<%= vo.getOrdNo() %>",   
			"cartNo" : "<%= vo.getCartNo() %>",  
			 "rvTitle" : "<%= vo.getRvTitle() %>",
			"rvCont" : "<%= vo.getRvCont() %>",
			 "rvDt" : "<%= vo.getRvDt() %>",
			 "rvGr" : "<%= vo.getRvGr() %>"
    } 