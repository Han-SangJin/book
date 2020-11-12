<%@page import="kr.or.ddit.bookimg.model.BookImgVO"%>
<%@page import="kr.or.ddit.book.model.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<BookVO> bkList = (List<BookVO>)request.getAttribute("bkVO");
List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgVO");
%> 
<style>
.dropmenu{border:none;border:0px;margin:0px;padding:0px;font: "sans-serif";font-size:18px;}
.dropmenu ul{background: #666;height:100px;list-style:none;margin:0;padding:0;}
.dropmenu li{float:left;padding:0px;}
.dropmenu li a{background: #666;color:#fff;display:block;line-height:100px;margin:0px;padding:0px 25px;text-align:center;text-decoration:none;}
.dropmenu li a:hover, .dropmenu ul li:hover a{background: rgb(31,31,31);color:#FFFFFF;text-decoration:none;}
.dropmenu li ul{background: red;display:none; height:auto;border:0px;position:absolute;width:200px;z-index:200;}
.dropmenu li:hover ul{display:block;}
.dropmenu li li {background: red;display:block;float:none;margin:0px;padding:0px;width:200px;}
.dropmenu li:hover li a{background:none;}
.dropmenu li ul a{display:block;height:80px;font-size:14px;margin:0px;padding:0px 10px 0px 15px;text-align:left;}
.dropmenu li ul a:hover, .dropmenu li ul li:hover a{background: rgb(171,171,171);border:0px;color:#ffffff;text-decoration:none;}
.dropmenu p{clear:left;}
.carousel-inner img{width: 500px;height: 280px;}
.carousel-indicators, carousel-inner{padding-top: 40px;}
.carousel-control.left{background-image: url("");}
.carousel-control.right{background-image: url("");}
#mainContentRight{margin-left: 20px;}
li { list-style:none; padding-left:-10px;}
a{color:black;}
ul{padding-left:0;}
/* content 상단의 메뉴바 크기 고정  */
body{
 	min-width: 1800px; 
}
#myNavbar{
 	box-sizing : border-box; 
}
.container-fluid{
 	min-width: 1800px; 
}
li{font-size: 17px;}
.notice{font-size: 30px;}
.row content*{background: white;}
.max-small{width: auto; height: auto; max-width: 230px; max-height: 200px;}
.sidenav{background: white;}
</style>

<div class="container-fluid text-center" >
	<div class="row content">
		<div class="col-sm-2 sidenav" >
			<ul id="rbsidenav">
				<li style="font-family:나눔고딕 ExtraBold;">&lt;현재 인기작&gt;</li>
				<li><a href="<%=request.getContextPath()%>/SelectBookDetail?bkNm=아몬드">
					<img class="max-small" src="<%= request.getContextPath()%>/images/bkside1_amond.png">
					</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/SelectBookDetailEbk?bkNm=난중일기">
					<img class="max-small" src="<%= request.getContextPath()%>/images/bkside2_nan.png">
					</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/SelectBookDetail?bkNm=김미경의 리부트">
					<img class="max-small" src="<%= request.getContextPath()%>/images/bkside3_reebopng.png">
					</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/SelectBookDetail?bkNm=당신, 힘들었겠다">
					<img class="max-small" src="<%= request.getContextPath()%>/images/bkside4_reebopng.png">
					</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/SelectBookDetail?bkNm=쓰담쓰닮 로마서">
					<img class="max-small" src="<%= request.getContextPath()%>/images/bkside5_reebopng.png">
					</a>
				</li>
			</ul>
		</div>
<!-- 				<h2>Carousel Example</h2>   -->
		<div class="col-sm-7 infocenter" > 
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" >
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" >
						<div class="item active">
							<a href="/RainBooks/SelectBookDetail?bkNm=쓰담쓰닮 로마서">
								<img src="<%=request.getContextPath() %>/images/bk1.jpg" alt="쓰닮쓰닮" style="width: 100%;">
							</a>
						</div>
						<div class="item">
							<a href="/RainBooks/SelectBookDetail?bkNm=김미경의 리부트">
								<img src="<%=request.getContextPath() %>/images/bk2.jpg" alt="김미경리부트" style="width: 100%;">
						</div>
						<div class="item">
							<a href="/RainBooks/SelectBookDetail?bkNm=창문을 넘어 도망친 100세 노인">
								<img src="<%=request.getContextPath() %>/images/bk3.jpg" alt="창문" style="width: 100%;">
						</div>
					</div>
					
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
<!-- 			<form action="/RainBooks/searchBook" id="searchBook"> -->
<!-- 				<p>RAINBOOKS -->
<!-- 					<select name="bookProd"> -->
<!-- 						<option value="P001">서적</option> -->
<!-- 						<option value="P002">eBook</option> -->
<!-- 					</select> -->
<!-- 					<input type="text" name="bookName" id="bookName" name="bookInfo"> -->
<!-- 					<input type="submit" value="검색">  -->
<!-- 				</p> -->
<!-- 			</form> -->
		</div>
	    
	    <!-- 내용  -->
	<!--       <div id="showBooksInfo"> -->
	<!--       	베스트 셀러 -->
	<%--       	<jsp:include page="/view/selectPvGreBst.jsp" flush="false"/> --%>
	<!--       </div> -->
	    
		<div class="col-sm-2 sidenav" id="mainContentRight">
			<div class="well">
				<ul>
					<li class="notice"><a href="<%= request.getContextPath() %>/Pages/notice.jsp">[ 공지사항  ]</a></li>
					<li class="notice"><a href="#">[ FAQ ]</a></li>
				</ul>
			
			</div>
		</div>
	</div>
</div>