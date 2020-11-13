<%@page import="rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String msg = (String)request.getAttribute("msg");
 %>

<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
#login_wrapper{padding:1px; position:absolute; top:10%; left:35%; width: 500px; height: 600px;}
#loginForm{width:500px;}
#loginForm > div {display:flex; justify-content: center; padding-bottom: 7px; align-items: center;}
#logo{width:200px; height: 150px; margin-left:140px; }
input{width:400px; height: 70px; font-size: 1.3em; NanumBarunGothicBold; font-weight:bold;  
	  border-radius: 4px 4px 4px 4px; line-height: 50px; box-sizing: border-box;
	padding: 0 15px; border: solid 1px #dbdbdb; background-color: #ffffff;}
pwInput{margin-top: -20px;}
button{width:400px; height: 70px; margin: 20px 0; padding: 13px 15px; font-size: 17px; line-height: 1.41; 
	margin-left: 50px; NanumBarunGothicBold; font-weight:bold; background: #F26000; color: white; outline: 0; border-width: 1px; 
	border-style: solid; border-radius: 4px}
a{font-size:18px; NanumBarunGothicBold; font-weight:bold; ;}
#find_login{margin-left: 10px;}
#inputResult{margin-left: 35px;}
</style>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="login_wrapper" style="border: 15px solid #F49D6E;">
		<form id="loginForm" action="<%= request.getContextPath() %>/memberLogin" method="post" >
			<img id="logo" src="<%=request.getContextPath() %>/images/로고.png" alt="로고">
			<div>
				<input class="input" type="text" name="idInput" id="idInput" placeholder="아이디">
			</div>
			<div>
				<input class="input" type="password" name="pwInput" id="pwInput" placeholder="비밀번호"> 
			</div>
			<button id="submit" >로그인</button> 
	      	<hr>
	      	<div id="inputResult"><%if(msg!=null){%><%=msg %><% }%></div><br><br>
	      	<div id="find_login">
		     	<a id="find" href="<%= request.getContextPath() %>/Pages/searchMemInfo.jsp">아이디/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      	<a id="login" href="<%=request.getContextPath()%>/insertMember">회원가입</a>
	      	</div>
		
		</form>
	</div>

</body>
</html>