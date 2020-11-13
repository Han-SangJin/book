<%@page import="rb.cmm.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
  	    BookVO rv = (BookVO)request.getAttribute("bookvo");
    %>
    
    {
		"bkIsbn" : "<%= rv.getBkIsbn() %>",
		"prodCd" : "<%= rv.getProdCd() %>",
		"bkGreCd" : "<%= rv.getBkGreCd() %>",
		"bkSt" : "<%= rv.getBkSt() %>",
		"bkNm" : "<%= rv.getBkNm() %>",
		"bkAtr" : "<%= rv.getBkAtr() %>",
		"bkPbl" : "<%= rv.getBkPbl() %>", 
		"bkPage" : "<%= rv.getBkPage() %>",
		"bkArti" : "<%= rv.getBkArti() %>",
		"bkGrade" : "<%= rv.getBkGrade() %>",
		"bkSelPrice" : "<%= rv.getBkSelPrice() %>",
		"bkFixPrice" : "<%= rv.getBkFixPrice() %>",
		"bkSalesQty" : "<%= rv.getBkSalesQty() %>",
		"fileId" : "<%= rv.getFileId() %>",
		"imgId" : "<%= rv.getImgId() %>",
		"bkDt" : "<%= rv.getBkDt() %>"
    }