<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
%>
[ 
<%
	for(int i=0; i<bookList.size(); i++){
		BookVO vo = bookList.get(i);
		if(i>0) out.print(",");
%>
	{
		"bkIsbn" : "<%= vo.getBkIsbn() %>",
		"prodCd" : "<%= vo.getProdCd() %>",
		"bkGreCd" : "<%= vo.getBkGreCd() %>",
		"bkSt" : "<%= vo.getBkSt() %>",
		"bkNm" : "<%= vo.getBkNm() %>",
		"bkAtr" : "<%= vo.getBkAtr() %>",
		"bkPbl" : "<%= vo.getBkPbl() %>", 
		"bkPage" : "<%= vo.getBkPage() %>",
		"bkArti" : "<%= vo.getBkArti() %>",
		"bkGrade" : "<%= vo.getBkGrade() %>",
		"bkSelPrice" : "<%= vo.getBkSelPrice() %>",
		"bkFixPrice" : "<%= vo.getBkFixPrice() %>",
		"bkSalesQty" : "<%= vo.getBkSalesQty() %>",
		"fileId" : "<%= vo.getFileId() %>",
		"imgId" : "<%= vo.getImgId() %>",
		"bkDt" : "<%= vo.getBkDt() %>"
	}
<%		
	}
%>
]