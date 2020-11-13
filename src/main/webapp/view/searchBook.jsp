<%@page import="rb.cmm.vo.MemberVO"%>
<%@page import="rb.cmm.vo.BookImgVO"%>
<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 	List<BookVO> bkList = (List<BookVO>)request.getAttribute("bkVO");
	List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgVO");
	MemberVO member = (MemberVO) session.getAttribute("member");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>RainBooks</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    .navbar { margin-bottom: 0;  border-radius: 0; }
    .row.content {height: 450px}
    .sidenav {  padding-top: 20px;  background-color: #f1f1f1; height: 100%;}
    footer {  background-color: #555; color: white; padding: 15px; }
    @media screen and (max-width: 767px) {
    .sidenav {  height: auto; padding: 15px; }
    .row.content {height:auto;} 
    }
  </style>
</head>
<body>
<%-- 	<jsp:include page="/Pages/main_nav.jsp"></jsp:include> --%>



	<%if(member == null){ %>
	 <jsp:include page="/Pages/main_nav.jsp"></jsp:include>
	<%}else{ %>
		<jsp:include page="/Pages/main_nav_login.jsp"></jsp:include>
	<%} %>
	
	
	<jsp:include page="searchBook_content.jsp"></jsp:include>
	<jsp:include page="/Pages/main_footer.jsp"></jsp:include>
</body>
</html>