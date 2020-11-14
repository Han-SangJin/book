<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String msg = (String)request.getAttribute("msg");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
<style>
.navbar-brand img{width: 120px;height: 70px;}
.navbar1{background: orange;}
.navbar-right{color: blue;}
.navbar-header{height: 100px;}
.nav2{height: 10px;background: blue;}
#prodManageBtn{padding : 10px;}
#prodManageBtn > li{margin-left: 10px;}	
.modal *{font:1.1em 나눔고딕 ExtraBold;}
.navbar-inverse{background: #444444;}
</style>

<!-- nav1 -->
<nav class="navbar navbar1 navbar-inverse nav1" >
  <div class="container-fluid">
    <div class="navbar-header">
<!--       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span>                         -->
<!--       </button> -->
      <a class="navbar-brand" href="#">
      <img src="<%=request.getContextPath() %>/IconImg/managerLogo.png" alt="Logo" style="width: 120px; height: 83px; padding-bottom: 3px;">
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
<%--         <li><a href="<%=request.getContextPath() %>/manager/mngLogin.jsp" data-toggle="modal"> --%>
        <li><a href="#myModal" data-toggle="modal">
        		<span class="glyphicon glyphicon-log-in"></span> 관리자Login
        	</a>
       	</li>
<!--         회원리스트 <button class="but" type="button" data-toggle="modal" data-target="#myModal" >회원검색</button> -->
      </ul>
    </div>
  </div>
</nav>
<!-- 모달 -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	  <!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align:center;">관리자로그인</h4>
			</div>
			<div class="modal-body">
				<hrd>
				 <div id="login">
					<form id="loginForm" action="<%= request.getContextPath() %>/mngLogin" method="post">
						<div id="inputbox">
							<input class="input" type="text" name="mngId" id="mngId" placeholder="아이디"><br>
							<input class="input" type="password" name="mngPass" id="mngPass" placeholder="비밀번호">		
							<input type="submit" id="submit" value="로그인">	
						</div>
						<div id="inputResult"><%if(msg!=null){%><%=msg %><% }%></div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
