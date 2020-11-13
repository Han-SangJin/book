<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String msg = (String)request.getAttribute("msg");
%>
<style>
 .infocenter *{
 	text-align: center;
 }
#searchline{
	width: 400px;
}
.sidenav{background: #444444;}
</style>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 sidenav">
      <p><a href="#myModal" data-toggle="modal">회원관리</a></p>
      <p><a href="<%=request.getContextPath() %>/manager/mngLogin.jsp">상품관리</a></p>
      <p><a href="<%=request.getContextPath() %>/manager/mngLogin.jsp">매출현황</a></p>
      <p><a href="<%=request.getContextPath() %>/manager/mngLogin.jsp">환불관리</a></p>
      <p><a href="<%=request.getContextPath() %>/manager/mngLogin.jsp">서평관리</a></p>
    </div>
    <div class="col-sm-9 text-left infocenter"><br><br><br> 
      <hr>
    </div>
  </div>
  
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
</div>