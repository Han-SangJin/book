<%@page import="rb.cmm.vo.AddrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AddrVO> addrList = (List<AddrVO>) request.getAttribute("addrList");
%>
 
[
<%
	for(int i=0; i<addrList.size();i++){
		AddrVO avo = addrList.get(i);
		if(i>0) out.print(",");
		String bunji = avo.getAddrBunji();
		if(bunji == null) bunji = "";
		// zip+ 시도 + 구군 + 동 + 번지
%>
	{
		"zip" : "<%= avo.getAddrZip() %>",
		"addr" : "<%= avo.getAddrSido() %> <%= avo.getAddrGugun() %> <%= avo.getAddrDong() %>",
		"bunji" : "<%= bunji %>",
		"sq" : "<%= avo.getAddrSq() %>"
	}
<%		
	}
%>
]