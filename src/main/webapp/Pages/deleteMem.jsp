<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% int cnt =(Integer)request.getAttribute("cnt");	
	if(cnt>0){
%>		
		{"msg" : "탈퇴가 완료되었습니다. 다음에 또 이용해주세요.",
		 "code" : true
		}	
		
	<%}else{ %>
		{"msg" : "탈퇴 실패!!!",
		 "code" : false
		 }
<%		
	}

%>