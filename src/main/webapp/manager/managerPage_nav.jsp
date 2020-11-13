<%@page import="rb.cmm.vo.ManagerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ManagerVO mvo = (ManagerVO) session.getAttribute("mvo");
%>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.divClass{background: #444444;}
.ulClass{list-style: none; margin: 0; padding: 0; float: right;}
.ulClass li{margin: 28px 0 0 0; padding: 0 0 0 0; float: left; }
.ulClass li a{color: white; font:1.2em 나눔고딕 ExtraBold;}
.ulClass li span{font-size: 1.2em;}
</style>
<div class="divClass">
	<a href="#">
	<img src="<%=request.getContextPath() %>/IconImg/managerLogo.png" alt="Logo" style="width: 120px; height: 83px; padding-bottom: 3px;">
	</a>
	<ul class="ulClass" >
		<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>  <%=mvo.getMngId() %>님 </a></li>
		<li><a href="<%=request.getContextPath() %>/managerLogout"><span class="glyphicon glyphicon-tags"></span>  로그아웃  </a></li>
	</ul>
</div>
