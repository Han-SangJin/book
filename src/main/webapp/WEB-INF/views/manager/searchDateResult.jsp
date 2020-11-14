<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> map = (List<Map<String,Object>>) request.getAttribute("dateMap");
%>

[
<%
		int row = 0;
	for(int i=0; i<map.size(); i++){
		if(i>0)out.print(",");
		SimpleDateFormat format1;
		format1 = new SimpleDateFormat("yyyy-MM-dd");
		String date = format1.format(map.get(i).get("ordDt"));
		if(date!=format1.format(map.get(i).get("ordDt"))){
			row = 1;
		}else{
			++row;
		}
%>
	{
<%-- 		"bkIsbn" : "<%=map.get(i).get("bkIsbn") %>", --%>
		"date" : "<%=map.get(i).get("date") %>",
		"qty" : "<%=map.get(i).get("qty") %>",
		"price" : "<%=map.get(i).get("price") %>",
		"ordDt" : "<%=date %>",
		"row": "<%= row %>"
	}
<%		
	}
%>

]