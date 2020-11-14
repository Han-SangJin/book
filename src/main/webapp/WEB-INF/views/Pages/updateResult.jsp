<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% int cnt = (Integer)request.getAttribute("cnt");
	
	if(cnt > 0){
%>
	{ "url" : "<%=request.getContextPath() %>/memLogout",
	  "msg" : true 
	}
	



<%

	}else{
%>
	{"url" : "<%=request.getContextPath() %>/Pages/myPage.jsp",
	 "msg" : false
	}

<%		
	}

%>
    
    