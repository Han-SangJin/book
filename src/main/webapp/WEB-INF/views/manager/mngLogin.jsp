<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<style>
#login{border:2px solid blue;}
</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
</head>
<body>
<div id="login">
	
	<form id="loginForm" action="<%= request.getContextPath() %>/main/mngLogin" method="POST">
		<div id="inputbox">
			<input class="input" type="text" name="mng_id" id="mngId" placeholder="아이디"><br>
			<input class="input" type="password" name="mng_pass" id="mngPass" placeholder="비밀번호">		
		</div>
		<input type="submit" id="submit" value="로그인">	
		<hr>	
	</form>
	
</div>
  
</body> 
</html>