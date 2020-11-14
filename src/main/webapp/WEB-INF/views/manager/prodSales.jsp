<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
<script>
$(function(){
	
})
function md01(){
	$('#totalSales').empty();
	$.ajax({
		url:'<%=request.getContextPath()%>/totalSales',
		type:'get',
		dataType:'html',
		success : function(res){
			$('#totalSales').append(res);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		}
	})
}

function md02(){
	$('#prodSales').empty();
	$.ajax({
		url:'<%=request.getContextPath()%>/groupByProd',
		type:'get',
		dataType:'html',
		success : function(res){
			$('#prodSales').append(res);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		}
	})
}

function md03(){
	$('#dateSales').empty();
	$.ajax({
		url:'<%=request.getContextPath()%>/manager/groupByDate.jsp',
		type:'get',
		dataType:'html',
		success : function(res){
			$('#dateSales').append(res);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		}
	})
}

function md04(){
	$('#pblSales').empty();
	$.ajax({
		url:'<%=request.getContextPath()%>/groupByPBL',
		type:'get',
		dataType:'html',
		success : function(res){
			$('#pblSales').append(res);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		}
	})
}


</script>
<style>
.modal-title{text-align: center;font:2.0em 나눔고딕 ExtraBold;}
#totalSales{padding-left: 10%;}
#prodSales{padding-left: 30%;}
#dateSales{padding-left: 30%;}
#pblSales{padding-left: 12%;}
html,body{ height:100%;}
body{text-align:center;}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:top;
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font:1.5em 나눔고딕 ExtraBold;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
/* #ifr1{width: 100%;height: 50%;border:3px solid blue;} */
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<!-- 	<a href="#md01" data-toggle="modal" onclick="md01()">총 매출 조회</a> -->
<!-- 	<a href="#md02" data-toggle="modal" onclick="md02()">상품분류별 조회</a> -->
<!-- 	<a href="#md03" data-toggle="modal" onclick="md03()">기간별 조회</a> -->
<!-- 	<a href="#md04" data-toggle="modal" onclick="md04()">출판사별 조회</a> -->
<!-- 		<button type="button" onclick="md01()">총 매출 조회</button> -->
		<button type="button" data-toggle="modal" data-target="#md01" onclick="md01()">총 매출 조회</button>
		<button type="button" data-toggle="modal" data-target="#md02" onclick="md02()">상품분류별 조회</button>
		<button type="button" data-toggle="modal" data-target="#md03" onclick="md03()">기간별 조회</button>
		<button type="button" data-toggle="modal" data-target="#md04" onclick="md04()">출판사별 조회</button>
<!-- 	<iframe id="ifr1"> -->
<!-- 	</iframe> -->
		<!-- 총 매출조회 -->
	<div class="modal fade" id="md01" role="dialog">
		<div class="modal-dialog" style="width:65%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">총 매출조회</h4>
				</div>
				<div class="modal-body">
					<div class="modalRes" id="totalSales"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>	
	</div>
		<!-- 상품분류별 조회 -->
	<div class="modal fade" id="md02" role="dialog">
		<div class="modal-dialog" style="width: 40%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상품분류별 조회</h4>
				</div>
				<div class="modal-body">
					<div class="modalRes" id="prodSales"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>	
	</div>
		<!-- 기간별 매출조회 -->
	<div class="modal fade" id="md03" role="dialog">
		<div class="modal-dialog" style="width:35%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">기간별 매출조회</h4>
				</div>
				<div class="modal-body">
					<div class="modalRes" id="dateSales"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>	
	</div>
		<!--출판사별 매출조회 -->
	<div class="modal fade" id="md04" role="dialog">
		<div class="modal-dialog" style="width:30%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">출판사별 매출조회</h4>
				</div>
				<div class="modal-body">
					<div class="modalRes" id="pblSales"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>