<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="rb.cmm.vo.BookGenreVO"%>
<%@page import="java.util.List"%>
<%@page import="rb.cmm.vo.AddrVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberVO member = (MemberVO)request.getAttribute("member"); 
   AddrVO memAddr = (AddrVO)request.getAttribute("memAddr");
   List<BookGenreVO> genreList = (List<BookGenreVO>)request.getAttribute("genreList");

	int gender = member.getMemGender();
	String gend = "";
	switch(gender){
	case 1: 
		gend = "남성";
		break;
	case 2: gend = "여성";
		break;
	}
	
	
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 조회 화면</title>
<script src="../js/mypage.js"></script>
<script>
$(function(){
	$('#update').on('click',function(){
		$('.updateMyinfo').show();
		$('#addr2').prop('readonly', false);
		$(this).hide();
	})
	
	$('#memInfo .updateMyinfo').on('click', function(){
		$(this).prev().prop('readonly', false);	
	})
	
	$('#updateSubmit').on('click', function(){
		info = $('#memInfoForm').serialize();
		
		updateMyInfo(info);

	})
	
	$('#addrSearch').on('click', function(){
		addrKey = $('#addrInput').val();
		
		addrSearch(addrKey);
			
	})
	
	$('#addrResult').on('click','.addrCont', function(){
		seq = $(this).prev().val();
		zip = $('td:first', this).text();
		addr1 = $('.addrResult', this).text();

		$('#addrHidden').val(seq);
		$('#zip').val(zip);
		$('#addr1').val(addr1);		
		$('#addrModal').modal('hide');
		$('#addrResult').empty();
		$('#addrInput').empty();
		
		
		
		
	})
	
	
	
	
	
})





</script>
<style>

#addr1, #addr2{
	width : 400px;
}
label{
	width : 200px;

}
#genre{
	display: inline-block;
	vertical-align: text-top;
}
#genre td{
	width : 200px;
}

body .updateMyinfo{
	display : none;
}
#addrTab td{
	text-align : center;
	
}
#addrTab .addrCont:hover{
	background : pink;
}

#addrTab .addrResult{
	width : 800px;
}


</style>

</head>
<body>
	<form id="memInfoForm" action="/RainBooks/updateInfo" method='post'>
	<fieldset id="memInfo">
		<legend><%=member.getMemNm() %>님의 회원 정보</legend>
		<hr>
		<label>ID :</label> 
		<input type="text" name="memId" value="<%=member.getMemId()%>" readonly="readonly">
		<hr>
		<label>비밀번호 :</label> 
		<input type="password" name="memPass" value="<%=member.getMemPass() %>" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updatePass" value="변경하기" >
		<hr>
		<label>이름 :</label> 
		<input type="text" name="memNm" value="<%=member.getMemNm() %>" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updateName" value="변경하기">
		<hr>
		<label>성별 :</label> 
		<%=gend %>
		<hr>
		<label>생년월일 :</label> 
		<%=member.getMemBir() %>
		<hr>

		<label>우편번호 :</label>
		<input type="hidden" id="addrHidden" name="addrSq" value="<%=member.getAddrSq() %>"> 
		<input type="text" class="addrInfo" id="zip" value="<%=memAddr.getAddrZip() %>" ">
		<input type="button" class="updateMyinfo" id="updateAddr" data-toggle="modal" data-target="#addrModal" value="우편번호 검색">
		<hr>
		<label>기본주소 :</label> 
		<input type="text" class="addrInfo" id="addr1" value="<%=memAddr.getAddrSido()%> <%=memAddr.getAddrGugun()%> <%=memAddr.getAddrDong() %>" readonly="readonly">
		<hr>
		<label>상세주소 :</label> 
		<input type="text" class="addrInfo" name="addrDetail"  id="addr2" value="<%=member.getAddrDetail() %>" readonly="readonly">

		<hr>
		<label>전화번호 :</label> 
		<input type="text" id="phone" name="memHp" value="<%=member.getMemHp() %>" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updatePhone" value="변경하기">
		<hr>
		<label>메일 :</label> 
		<input type="text" name="memMail" id="email" value="<%=member.getMemMail() %>" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updateMail" value="변경하기">
		<hr>
		<label>관심장르 :</label>
		<table id="genre">
			
				<% if(!genreList.isEmpty()){
					  for(int i=0;i<genreList.size();i++){
						  BookGenreVO genre = genreList.get(i);
				 %>		
				 		<tr><td><%=i+1%> <%=genre.getBkGreNm() %></td></tr>		  
					<% 
					  }					
					%>	  
					<%					
					}
					%>
		</table>
		<input type="button" class="updateMyinfo" id="updateGenre" value="변경하기">		
		<hr>
	</fieldset>
	</form>
	<input type="button" class="updateMyinfo" id="updateSubmit" value="확인">
	<input type="button" id="update" value="수정하기">
	
	 <!-- Modal -->
 <div> 
  <div class="modal fade" id="addrModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">우편번호 검색</h4>
        </div>
        <div class="modal-body">
          <p>원하는 주소를 입력해주세요..</p>
          <input type="text" id="addrInput" name="addrInput" value="">
          <input type="button" class="btn btn-default" id="addrSearch" value="검색">
          <div id="addrResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
	
	
</body>
</html>