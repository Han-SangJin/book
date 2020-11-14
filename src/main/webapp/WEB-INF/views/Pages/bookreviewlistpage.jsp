	<%@page import="rb.cmm.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ReviewVO> bookreviewList = (List<ReviewVO>) request.getAttribute("listvalue");
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
		for(int i=0; i<bookreviewList.size(); i++){
			ReviewVO vo = bookreviewList.get(i);
			if(i > 0) out.print(",");
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
	 
	<% 
	}
	%>
	]
}
 