<%@page import="rb.cmm.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	List<ReviewVO> bookreviewList = (List<ReviewVO>) request.getAttribute("listvalue");
 %> 

[
<%
	for(int i=0; i<bookreviewList.size(); i++){
		ReviewVO vo = bookreviewList.get(i);
		if(i>0) out.print(",");
%>
	{
		"rvNo" : "<%= vo.getRvNo() %>",
		"memId" : "<%= vo.getMemId() %>",
		"ordNo" : "<%= vo.getOrdNo() %>",
		"cartNo" : "<%= vo.getCartNo() %>",
		"rvTitle" : "<%= vo.getRvTitle() %>",
		"rvCont" : "<%= vo.getRvCont() %>",
		"rvDt" : "<%= vo.getRvDt() %>",
		"rvGr" : "<%= vo.getRvGr() %>"
	}
<%		
	}  
%>
]
<%-- <table border="1">
 
<% 
	int reviewSize = bookreviewList.size();
	if(reviewSize > 0){
		for(int i=0; i<reviewSize; i++){
%>			
	
	
		<div class="panel-group" id="accordion">
		
				     
				   <div class="panel panel-default">
				      <div class="panel-heading">
				       <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%= bookreviewList.get(i).getRvNo() %>">  &nbsp;&nbsp;&nbsp; <%= bookreviewList.get(i).getRvTitle() %> </a>
				        </h4>
				      </div>
				   <div id="collapse<%= bookreviewList.get(i).getRvNo() %>"  class="panel-collapse collapse">
				    <div class="panel-body">
				    	<p style="float:left width:70%">
				  			 글 번호 : <%= bookreviewList.get(i).getRvNo() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 회원 아이디 : <%= bookreviewList.get(i).getMemId() %>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 주문번호 : <%= bookreviewList.get(i).getOrdNo() %>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 카트번호 : <%= bookreviewList.get(i).getCartNo() %>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 날짜 : <%= bookreviewList.get(i).getRvDt() %>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
							 <hr>
				    	</p> 
				   		<p style="float:right; width:20%;">
				    			<input type="button" name="modify" class="action" value="수정">
				   			<input type="button" name="delete" class="action" value="삭제">
				   	</p>
				    		<hr>
				   	<p>
							 서평 내용 : <%= bookreviewList.get(i).getRvCont() %>
				  	</p>
				  	<p>
				  		<textarea cols="80"></textarea>
				  		<input type="button" name="reply" class="action" value="등록">
				 	 </p>
				      </div>
				   </div>
				 </div>
			
			</div>
	
	
	
	
		<tr>
			<td id="reviewdetailno"><%= bookreviewList.get(i).getRvNo() %></td>
			<td><%= bookreviewList.get(i).getMemId() %></td> 
			<td><a href="<%= request.getContextPath() %>/selectBookReview?rvNo=<%= bookreviewList.get(i).getRvNo() %>" id=reviewdetailtitle><%= bookreviewList.get(i).getRvTitle() %></a></td>
			<td><%= bookreviewList.get(i).getRvDt() %></td>	
		</tr>
 
	
<% 	
		} 
	}else{ // 회원정보가 존재하지 않을 경우...
  %>
	<tr>
		<td colspan="4">서평정보가 존재하지 않습니다.</td>
	</tr>
<%	
	}  
%> 	 
</table>
 
 
 <%
 	if(msg.equals("성공")){
 %>	
 	<script>
 		alert('정상적으로 처리되었습니다.');
 	</script>
 <% 	
 	}	
 %> --%>