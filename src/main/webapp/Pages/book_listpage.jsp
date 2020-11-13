<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
	int spage = (Integer) request.getAttribute("spage");
	int epage = (Integer) request.getAttribute("epage");
	int tpage = (Integer) request.getAttribute("tpage");
	int cpage = (Integer) request.getAttribute("cpage");
%>
{  
	"tpage" : "<%= tpage %>",
	"epage" : "<%= epage %>",
	"spage" : "<%= spage %>",
	"cpage" : "<%= cpage %>",
	"data" : [
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
}