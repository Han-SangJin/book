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
		"bkIsbn" : "<%= vo.getBk_isbn() %>",
		"prodCd" : "<%= vo.getProd_cd() %>",
		"bkGreCd" : "<%= vo.getBkgre_cd() %>",
		"bkSt" : "<%= vo.getBk_st() %>",
		"bkNm" : "<%= vo.getBk_nm() %>",
		"bkAtr" : "<%= vo.getBk_atr() %>",
		"bkPbl" : "<%= vo.getBk_pbl() %>", 
		"bkPage" : "<%= vo.getBk_page() %>",
		"bkArti" : "<%= vo.getBk_arti() %>",
		"bkGrade" : "<%= vo.getBk_grade() %>",
		"bkSelPrice" : "<%= vo.getBk_sel_price() %>",
		"bkFixPrice" : "<%= vo.getBk_fix_price() %>",
		"bkSalesQty" : "<%= vo.getBk_sales_qty() %>",
		"fileId" : "<%= vo.getFile_id() %>",
		"imgId" : "<%= vo.getImg_id() %>",
		"bkDt" : "<%= vo.getBk_dt() %>"
	}
<%		
	}
%>
]