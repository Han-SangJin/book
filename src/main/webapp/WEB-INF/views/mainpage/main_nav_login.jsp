<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberVO member = (MemberVO)session.getAttribute("member");

%>
<style>
.header_inner img{ width: 300px; height: 150px; margin-top: 20px;}
.navbar1{background: #ffffff; border: 0px; height: 200px;}
.search_box #bookName{margin-bottom: 50px;}
.navbar-header{height: 100px;}
.text-left{margin-left: 300px; margin-top: 0px; }
.header_inner h1 {float:left;} 
.header_inner h1 a {display:block;}
.header_inner h1 img {display:block;width:300px;height:150px;}
.header_inner .search_box input[type="text"] { height: 50px; width:450px; padding:0px; font-size:15px; 
									margin: 80px 0 0 0px;  border:3px solid #F26000; }
.header_inner .search_box #bookName {width:450px;}
#prod {height: 50px;  margin-left:300px; border:3px solid #F26000;  }
#search {height: 50px; width:70px; border:3px solid #F26000;}
.navbar2{background:#F26000; width: 100%; height: 30px;}
.navbar2{background:#F26000; width: 100%; height: 60px;}
.collapse .dropdown{display : inline; margin-right:185px; margin-top: 5px; 
					color : red;font-weight: bold; letter-spacing : 9px; font-size: 1.1em; cursor: pointer;}
.collapse .dropdown .dropdown-toggle{color:white;}
.navbar2 .nav li a:hover{ background: white; color:#F26000; }
.dropdown-toggle{ background: #F26000; color:white; height: 100%;}
.navbar2{font:1.2em NanumGothicExtraBold;}
.search_box{font:1.2em NanumGothicExtraBold;}
.search_box select, .search_box input[type="text"]{text-align: center;}
.search_box select{cursor: pointer;}
.nav_top{height:40px;  background: #f3c3af;}
.nav_top ul{list-style: none;margin-left: 10px; padding-top:4px; float: right;}
.nav_top li{margin:5px 0 0 20px;padding:0; border: 0; float: left;font:1.2em NanumGothicExtraBold;vertical-align: middle;}
.nav_top li *{color:black;}

	/* content 상단의 메뉴바 크기 고정  */
	body{
	 	min-width: 1800px; 
	}
	#myNavbar{
	 	box-sizing : border-box; 
	 	min-width: 1800px; 
	}
	.container-fluid{
	 	min-width: 1800px; 
		height: 60px;
	}
	.dropdown{
		height: 50px;
	}
	#ba{
		height: 60px;			
	}


</style>
<!-- nav1 -->
<nav class="navbar navbar1 navbar-inverse">
	<div>
		<div class="nav_top">
			<ul>
				<li><a href="<%= request.getContextPath() %>/Pages/myPage.jsp" ><span class="glyphicon glyphicon-log-in" ></span> <%=member.getMemNm() %>님</a></li>
		        <li><a href="/RainBooks/MyCartView"><span class="glyphicon glyphicon-user"></span> 장바구니</a></li>
		        <li><a href="/RainBooks/memLogout"><span class="glyphicon glyphicon-tags"></span> 로그아웃</a></li>
		        <li></li>
			</ul>
		</div>
<!-- 		<div class="top_until"> -->
<!-- 			<ul class="nav navbar-nav navbar-right"> -->
<!-- 		        <li><a href="Pages/login2.jsp" ><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
<!-- 		        <li><a href="/RainBooks/insertMember"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li> -->
<!-- 		        <li><a href="#"><span class="glyphicon glyphicon-tags"></span>  고객센터</a></li> -->
<!-- 	     	</ul> -->
<!-- 		</div> -->
		<div class="header_inner">
			<h1 id="logoH"><a id="logo" href="<%= request.getContextPath() %>/Main"><img src="<%= request.getContextPath() %>/images/로고수정.png" alt="cola-image"></a></h1>
			<div class="search_box" id="w_search_box">
				<form action="/RainBooks/searchBook" id="searchBook">
		      		<select name="bookProd" id="prod">
		      			<option value="P001">서적</option>
		      			<option value="P002">eBook</option>
		      		</select>
		      		<input type="text" name="bookName" id="bookName" value="" placeholder="오늘은 무슨책을 읽어볼까?">
		      		<input id="search" type="submit" value="검색"> 
	     	 	</form>
			</div>
		</div>
	</div>
</nav>

<br>
<br>

<nav class="navbar2">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle"  id="menu1" data-toggle="dropdown">도서<span class="caret"></span></a>
					<ul class="dropdown-menu"  aria-labelledby="menu1">
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG01?">문학</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG02?">역사</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG03">예술</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG04">종교</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG05">경제</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG06">사회</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG07">자기계발</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG08">생활</a></li>	
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG09">여행</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG10">취미</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG11">청소년</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG12">참고서</a></li>
						<li><a href="/RainBooks/SelectBookGre?bkGreCd=BG13">만화</a></li>
					</ul>
				</li>
			  
				<li class="dropdown">
					<a class="dropdown-toggle"  id="menu1" data-toggle="dropdown">eBooK<span class="caret"></span></a>
					<ul class="dropdown-menu"  aria-labelledby="menu1">
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG01">문학</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG02">역사</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG03">예술</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG04">종교</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG05">경제</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG06">사회</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG07">자기계발</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG08">생활</a></li>	
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG09">여행</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG10">취미</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG11">청소년</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG12">참고서</a></li>
						<li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG13">만화</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle"  id="menu1" data-toggle="dropdown" >베스트셀러<span class="caret"></span></a>
					<ul class="dropdown-menu"  aria-labelledby="menu1">
						<li><a href="/RainBooks/SelectBookGreBst" >국내도서</a></li>
						<li><a href="/RainBooks/SelectBookGreBst_Ebk" >eBook</a></li>
					</ul>	
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle"  id="menu1" data-toggle="dropdown" >신간<span class="caret"></span></a>
					<ul class="dropdown-menu"  aria-labelledby="menu1">
						<li><a href="/RainBooks/SelectBookGreLt" >국내도서</a></li>
						<li><a href="/RainBooks/SelectBookGreLt_Ebk" >eBook</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle"  id="menu1">추천도서</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
