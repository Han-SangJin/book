<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
// 해당 html 이 로딩이 완료 되었을때 실행되는 이벤트 핸들러 함수
$(document).ready(function(){

		memberListAjaxHTML(1);
		//memberListAjax(1);
	$("#memberList").on("click", "tr", function() {
			// data-userid
			var userid = $(this).data("userid");
			console.log("userid : " + userid);

			//document.location = "/member/member?userid=" + userid;
			document.location = "/member/memberAjaxPage?userid=" + userid;
		});
	});
	
	
	function memberListAjax(p){

		$.ajax({url :"/member/listAjax",
			data : {page : p, pageSize : 5},
			//data : "page=1&pageSize=5",
			//data : JSON.stringify({page : 1, pageSize : 5}),  
			//        Controller에서 @RequestBody    JSON  <---> JAVA OBEJCT
			method : "get",
			success : function(data){
				var i =0;
 
				//memberList tbody영역에 들어갈 html 문자열 생성
				var html = "";
				for(var i = 0; i < data.memberList.length; i++){
					var member = data.memberList[i];
					
					html += "<tr data-userid='" + member.userid +"' >";
					html += "	<td>" + member.userid + "</td>";
					html += "	<td>" + member.usernm + "</td>";
					html += "	<td>" + member.alias + "</td>";
					html += "	<td>"+ member.fmt_reg_dt + "</td>";
					html += "</tr>"; 
				}
				
				$("#memberList").html(html);
				
				html = "";
				//페이지 내비게이션 html 문자열 동적으로 생성하기
				for(var i= 1; i <= data.pages; i++){
					if(i == data.pageVo.page){
						html += "<li class=\"active\"><span>"+ i +"</span></li>";
					}
					else{
						// <a href="javascript:memberListAjax(1);"/>
						html += "<li><a href=\"javascript:memberListAjax("+ i +");\">" + i + "</a></li>";	
					}
				}
				
				$("ul.pagination").html(html);
			}
	});
	
	}
	
	
	function memberListAjaxHTML(p){
	
	$.ajax({url :"/member/listAjaxHTML",
		data : {page : p, pageSize : 5},
		method : "get",
		success : function(data){
			var html = data.split("$$$ seperator $$$");

			$("#memberList").html(data.split("$$$ seperator $$$")[0]);
			
			$("ul.pagination").html(data.split("$$$ seperator $$$")[1]);
		}
	});
	
}  

</script>

<body> 


<div class="row">
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				 <tr> 
				 	<td><p>사용자 아이디</p></td>
				 	<td><p>사용자 이름</p></td>
				 	<td><p>사용자 별명</p></td>
				 	<td><p>등록 일시</p></td>
				 </tr>
				 <tbody id="memberList">
				 
			
				</tbody>
				
			</table> 
		</div>  
		<a href="${pageContext.request.contextPath}/memberRegist/view" class="btn btn-default pull-right">사용자 등록</a>
		<ul class="pagination">
		
		</ul>
 	<%-- 	 page : ${pageVo.getpage() }
 		 pages : ${pages }
 		memeberList : ${memberList}
		<div class="text-center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${pages }">
					<c:choose>
						 
						<c:when test="${i == page}">
							<li class="active"><span>${i}</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/memberList?page=${i}">${i}</a></li>
							<%=request.getContextPath()%>  =  ${pageContext.request.contextPath }
						</c:otherwise>	
					</c:choose>				
				</c:forEach>
			</ul>
		</div> --%>
</div>
	</div>
		</div>
	</div>
</body>


 