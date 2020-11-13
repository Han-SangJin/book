<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
2
<style>
	.navbar-brand img{
		width: 120px;
		height: 70px;
	}
	.navbar1{
		background: orange;
	}
	.navbar-right{
		color: blue;
	}
	.navbar-header{
		height: 100px;
	}
</style>

<!-- nav1 -->
<nav class="navbar navbar1 navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">
      	<img src="../images/로고.png" alt="cola-image">
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-tags"></span>  마이페이지</a></li>
      </ul>
    </div>
  </div>
</nav>

