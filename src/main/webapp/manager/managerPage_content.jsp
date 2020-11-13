<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
 /*  .infocenter *{text-align: center;} */
/* #searchline{width: 400px;} */
/* .sidenav{background: #444444;} */
#ulClass2 *{color: white; font:1.2em NanumBarunGothic;}
#ulClass2 li {list-style: none;}
.divClass2{width: 100%;height: 100%;}
#div1{width:160px;  height: 100%; background: #282828; float: left;}
#div2{width: 1760x; height: 100%; float: left;}
.ifr{width:1760px; height: 100%;}
</style>
<script>

</script>
<div class="divClass2" >
	<div id="div1" >
		<ul id="ulClass2">
			<li><a href="<%= request.getContextPath() %>/selectAllMember" target="test1">회원리스트</a></li>
			<li><a href="<%= request.getContextPath() %>/Pages/book.jsp" target="test1">상품관리</a></li>
			<li><a href="<%= request.getContextPath() %>/manager/prodSales.jsp" target="test1">매출현황</a></li>
			<li><a href="<%= request.getContextPath() %>/manager/orderManage.jsp" target="test1">주문관리</a></li>
		</ul>
	</div>
	<div id="div2" >
		<iframe class="ifr" name="test1"></iframe>
	</div>
</div>