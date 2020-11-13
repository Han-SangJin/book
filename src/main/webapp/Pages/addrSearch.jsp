<%@page import="rb.cmm.vo.AddrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<AddrVO> addrList = (List<AddrVO>)request.getAttribute("list"); %>

[

<% 	for(int i=0;i<addrList.size();i++){
		AddrVO addr = addrList.get(i);
		if(i>0) out.print(",");
%>
	
		{
			"addr_sq" : "<%=addr.getAddrSq() %>",
			"addr_zip" : "<%=addr.getAddrZip() %>", 
			"addr1" : "<%=addr.getAddrSido() %> <%=addr.getAddrGugun() %> <%=addr.getAddrDong() %>"
		}
	<%
	}
	%>
	
]
