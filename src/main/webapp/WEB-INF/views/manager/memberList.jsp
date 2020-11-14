<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="rb.cmm.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVO> mList = (List<MemberVO>) request.getAttribute("memList");
%>    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/js/searchMember.js"></script>
<html>
<script>
$(function(){
	$('#searchStart').on('click',function(){
		data = $('#searchInfo').val();
		type = $('#searchType option:selected').val();
		searchMember(data, type);
	})
	
	$('#searchInfo').on('keydown',function(event){
		if(event.keyCode==13){
			type = $('#searchType option:selected').val();
			info = $('#searchInfo').val();
			searchMember(info, type);
		}
	})
	// 검색정보 비우기
	$('#myModal').on('click',function(){
		$('#searchResult').empty();
		$('#searchInfo').val("");
		$('#searchType').find('option:first').attr('selected', 'selected');
	})
	
	$('.memDelete').on('click',function(){
		var deleteBtn = $(this);
		var tr = deleteBtn.parent().parent(); // 클릭한 행
		var td = tr.children(); // 클릭한 행의 td들
		var memId = td.eq(6).text();
		console.log(memId);
		deleteMember(memId); // 클릭한 행의 memId 넘겨줌
	})
})

// 회원상세정보 페이지 (모달창)
function aSelect(memId){
	console.log(memId);
	 $('#testRes').empty();
	$.ajax({
		url:'<%= request.getContextPath()%>/selectMember',
		data:{"memId":memId},
		type:'get',
		dataType:'html',
		success : function(res){
		 $('#testRes').append(res);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		}
	})
}
</script>
<style>
th,td{border: 2px solid black;}
.memGB{padding: 3px;font: 1.2em NanumBarunGothic;text-align: center;}
.memList{margin-top:20px;margin-left:25%;border-collapse: collapse;border-top: 3px solid #168;font: 1.2em NanumBarunGothic;}
.memList th{color: #168;background: #f0f6f9;text-align: center;}
.memList th, .memList td{padding: 10px;border: 1px solid #ddd;}
.memList th:first-child, .memList td:first-child{border-left: 0;}
.memList th:last-child, .memList td:last-child {border-right: 0;}
.memList tr td:first-child {text-align: center;}
.but{font:1.em NanumBarunGothic;float: right;}
.aFont{font: 1.3em NanumBarunGothic;}
.table{border-collapse: collapse;border-top: 3px solid #5a810c;}
.table th{color: #81b912; background: #f7fced; text-align: center; }
.table th, .table td{padding: 10px; border: 1px solid #ddd;}
.table th:first-child ,.table td:first-child{border-left: 0;} 
.table th:last-child ,.table td:last-child{border-left: 0;} 
.table tr td {text-align: center;}
#tempTd{display: none;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
<div class="container">
	<table class="memList">
		<caption>
			회원리스트 <button class="but" type="button" data-toggle="modal" data-target="#myModal" >회원검색</button>
		</caption>
		<tr><th>No.</th><th>회원상태</th><th>아이디</th><th>이름</th><th>성별</th><th>탈퇴처리</th></tr>
		<%
			for(int i=0; i<mList.size(); i++){
				MemberVO mvo = mList.get(i);
				String gender=""; String cd="";
				int cnt = i+1;
				if(mvo.getMemGender()==1){gender="남자";}else{gender="여자";}
				if(mvo.getMemCd()==1){cd="정상회원";}else{cd="탈퇴회원";}
		%>
			<tr>
				<td><%= cnt %></td>
				<td><%=cd%></td>
				<td><a href="#myModal2" data-toggle="modal" onclick="aSelect('<%=mvo.getMemId() %>')"><%=mvo.getMemId()%></a></td>
				<td><%=mvo.getMemNm()%></td>
				<td><%=gender%></td>
				<td><input type="button" class="memDelete" value="회원삭제"></td>
				<td id="tempTd"><%=mvo.getMemId() %></td>
			</tr>
		<%
			}
		%>
	</table>
</div>

	<!-- 모달 -->
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" style="text-align:center;font:1.3em NanumBarunGothic;">회원검색</h4>
	        </div>
	        <div class="modal-body">
				<span class="memGB" >회원구분[1:정상회원 0:탈퇴회원]<br>&nbsp;성별구분[1:남자 2:여자]</span><br><br>
	        	<select id="searchType" name="searchType" class="aFont">
	        		<option value="MEM_ID">아이디</option>
	        		<option value="MEM_NM">이름</option>
	        		<option value="MEM_CD">회원상태</option>
	        		<option value="MEM_GENDER">성별</option>
	        	</select>
				<input type="text" id="searchInfo" >
				<input class="aFont" id="searchStart" type="button" value="확인">
				<div class="aFont" id="searchResult"></div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	</div>

	<!-- 모달 -->
	<div class="modal fade" id="myModal2" role="dialog">
	    <div class="modal-dialog " style="width:70%;">
<!-- 	    modal-lg -->
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" style="text-align:center;font:1.3em NanumBarunGothic;">회원상세정보</h4>
	        </div>
	        <div class="modal-body">
				<div id="testRes"></div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	</div>
</body>
</html>