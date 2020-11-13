<%@page import="rb.cmm.vo.BookImgVO"%>
<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 	List<BookVO> bkList = (List<BookVO>)request.getAttribute("bkList");
	List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgList");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장르별 품목 조회</title>
<style>
#sn{width : 200px; height: 250px;}
#book {background: white; height: 100%; width:200px; margin-top: 200px;}
.ye {font-size:1.1em;  NanumBarunGothic;}
.tb *{border:1px solid white; }
#name{font-size:1.3em;}
.banner{height: 30px; background: #FFE991;}
#last{width: 90px;height: 30px; }
</style>
<script>

</script>
</head>
<body>
		
<div class="container-fluid text-center">
			
	
		<br>
		<div class="col-sm-1 sidenav">
		</div>
		
		
		
		<div class="col-sm-7 text-left infocenter">
		<span style=font-size:2.3em; NanumBarunGothic;>국내도서</span>
		<hr style="border:solid 2px red;">
		<nav class="banner">
		&nbsp;&nbsp;&nbsp;&nbsp;<img id="last" src="images/상품.png">
		</nav>
		<br>
		<br>
	<%
		 int bkSize = bkList.size(); 
		 	if(bkSize > 0){ 
		 		for(int i=0; i<bkList.size(); i++){ 
					BookVO bvo = bkList.get(i);		
						for(int j=0; j<bkImgList.size(); j++){
							BookImgVO bivo = bkImgList.get(j);
								if(bvo.getImgId()==bivo.getImgId()){
			%>
	<form action="<%= request.getContextPath()%>/SelectBookGreEbk" method="get">
		
		<table class="tb">
			<tr>
				<th rowspan="4"><img id="sn" alt="img1"src="<%=request.getContextPath()%><%=bivo.getImgPath()%>"></th>
				<th rowspan="4" width=3></th>
				<th id="name" colspan="2" width=800  height=50><a href="/RainBooks/SelectBookDetailEbk?bkNm=<%= bvo.getBkNm()%>"><%=bvo.getBkNm()%></a></th>
			</tr>
			<tr height=50 >
				<th class="ye"><%= bvo.getBkAtr()%>&nbsp;&nbsp;<%= bvo.getBkPbl()%></th>
				<th></th>
			</tr>
			<tr height=50>
				<th class="ye"><%= bvo.getBkFixPrice()%>&nbsp;&nbsp;-><span style=color:red;>&nbsp;&nbsp;<%= bvo.getBkSelPrice()%>(10%할인)</span></th>
				<th></th>
			</tr>
			<tr>
				<th colspan="2">지금 주문하면 <span style="font:bold;">3일이내</span> 출고!!</th>
			</tr>
		
		</table>
		<br>
			
			<%
						}
					} 		
		 		}
		 	}
%>
		</div>
			
		</div>
</body>
</html>
   