<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(function(){
	var ctx ="";
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	ctx = location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));1
	$('#startDate').on('change',function(){
		start = $(this).val();
	})
	$('#endDate').on('change',function(){
		end = $(this).val();
	})
	$('#submit').on('click',function(){
		$('#result').empty();
		$.ajax({
			data:{"start":start,"end":end},
			url: ctx+'/groupByDateSales',
			type:'get',
			dataType:'json',
			success : function(res){
				code = "<table class='dateTable'>";
				code += "<tr><td>날짜</td><td>상세날짜</td><td>수량</td><td>가격</td></tr>";
				$.each(res,function(i,v){
					code += "<tr><td rowspan='"+v.row+"'>"+v.date+"</td><td>"+v.ordDt+"</td><td>"+v.qty+"</td><td>"+v.price+"</td></tr>";
				})
				code += "</table>";
				$('#result').append(code);
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			}	
		})
	})
	
})
</script>
<style>
.dateTable{border-collapse: collapse;border-top: 3px solid #6525ed;font:1.2em NanumBarunGothic;}
.dateTable th{color :#6525ed; background:#d6c6fa; text-align: center; }
.dateTable th, .dateTable td{padding: 10px; border: 1px solid #ddd;}
.dateTable th:first-child, .dateTable td:first-child{border-left :none;}
.dateTable th:last-child, .dateTable td:last-child{border-right :none;}
.dateTable tr td{text-align: center;}
.dateTable caption {text-align: center;}
</style>
<title>기간별 매출조회</title>
</head>
<body>
<table class="dateSearch" style="margin-right:50px;">
	<tr>
		<td style="text-align:center">시작날짜</td>
		<td style="text-align:center">종료날짜</td>
		<td rowspan="2" style="height:21px;"><input type="button" id="submit" value="검색" style="margin-top:21px;"></td>
	</tr>
	<tr>
		<td><input type="date" id="startDate" name="startDate"></td>
		<td><input type="date" id="endDate" name="endDate"></td>
	</tr>
</table>
	<div id="result" style="margin-top:10px;"></div>
</body>
</html>