<%@page import="java.util.Date"%>
<%@page import="rb.cmm.vo.MemberVO"%>
<%@page import="rb.cmm.vo.BookImgVO"%>
<%@page import="kr.or.ddit.book.model.BookVO"%>
<%@page import="java.util.List"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 	BookVO bkVO = (BookVO)request.getAttribute("bkEbkVO");
    String bkDate = (String)request.getAttribute("bkDate");
    List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgList");
    MemberVO member = (MemberVO) session.getAttribute("member");
%> 
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="<%=request.getContextPath() %>/js/bookreview.js"></script>
  <script src="<%=request.getContextPath() %>/js/reviewreply.js"></script>
<script type="text/javascript">
 
	
	 
	$(function(){
		
		
		
		readpageServer(1);
		 $('#modifyForm').hide();
		
		
		
		
		$('#inCartBtn').on('click',function(){
			
			<%
			if(member == null){
			%>
				alert("로그인을 해주세요.");
				
				$('#cartInForm').attr('action', 'memberLogin');
				$('#cartInForm').attr('method', 'POST');
				$('#cartInForm').submit();
			<%
			}else{
			%>	
				alert("장바구니에 추가되었습니다.");
				
				$('#bkNamePath').val($('#bkNameH3Tag').text());
				$('#number').val($('#numBox').val());
				$('#cartInForm').attr('action', 'InsertCart');
				$('#cartInForm').attr('method', 'POST');
				$('#cartInForm').submit();
			<%	
			}
			%>
			
		})
		
		
		
		
		
		
		
		
		

		// 페이지 번호 클릭하면 이벤트 설정
	 	$('#btngroup1').on('click', '.paging', function(){
	 		$('body').append($('#modifyForm'));
 			$('#modifyForm').hide();
	 		currentpage = $(this).text().trim();
	 		readpageServer(currentpage);
	 	}) 
	 	      
	 	// 이전버튼 클릭하면
	 	$('#btngroup1').on('click', '.previous a', function(){
	 		$('body').append($('#modifyForm'));
 			$('#modifyForm').hide();
	 		currentpage = parseInt($('.paging:first').text().trim()) -1;
	 		readpageServer(currentpage);
	 	}) 
	 	     
	 	// 다음버튼 클릭하면
	 	$('#btngroup1').on('click', '.next a', function(){
	 		$('body').append($('#modifyForm'));
 			$('#modifyForm').hide();
	 		currentpage = parseInt($('.paging:last').text().trim()) +1;
	 		readpageServer(currentpage);
	 	})
	 	   
	 	    
	
	 	// 버튼에 대한 이벤트
	 	$('.result1').on('click', '.action', function(){
	 		actionname = $(this).attr('name');
	 		idx = $(this).attr('idx');
	 		
	 		if(actionname == "modify"){
	 			viewServer();
 	 		
	 		}else if(actionname == "delete"){
	 			alert(idx + "번 글 삭제"); 
	 			deleteServer(idx, this); 
	 			readpageServer(1);
	 		}else if(actionname == "reply"){
	 		
	 			rvreply.rvNo = idx;
	 			rvreply.memId = 'a001';
	 			rvreply.rvReCont = $(this).parent().find('textarea').val();
	 			rvreplySaveServer(this);	
	 			$(this).parent().find('textarea').val("");
	 			rvreplyListServer(this);
	 			
	 		}else if(actionname == "list"){
	 			rvreply.rvNo = idx;
	 			rvreplyListServer(this);
	 			      
	 		}else if(actionname == "r_modify"){
	 			redx = $(this).attr('idx');
	 			if($('#modifyForm').css('display') != 'none'){
	 				rvreplyReset();
	 			}  
	 			    
	 			
	 			  
	 			// 댓글내용 가져오기
	 			modifyCont = $(this).parents('.rep').find('.cont').html().replace(/<br>/g, "\n");
	 			// 댓글 수정 폼에 댓글 내용 출력
	 			$('#modifyForm #text').val(modifyCont);
				// 댓글 수정폼을 댓글내용 자리에 추가	 			
	 			$(this).parents('.rep').find('.cont').empty().append($('#modifyForm'))
				// 댓글 수정폼 보이기 
	 			$('#modifyForm').show();
	 			   
	 		}else if(actionname == "r_delete"){
	 			rvreplyDeleteServer(idx,this); 
	 		}else if(actionname == "reset"){
	 			//댓글 수정 폼에서 취소버튼 클릭
	 			rvreplyReset();
	 		}else if(actionname == "reok"){
	 			//댓글 수정 폼에서 확인버튼 클릭
	 			    
	 			// textarea 에서  새로 수정된 내용을 가져오기;
	 			modifyCont = $('#modifyForm #text').val();
	 			spanTag = $('#modifyForm').parent();
	 			 
	 			// Db에 적용시킬 수정 내용 - reply 객체에 추가 ( cont, renum )
	 			rvreply.rvReCont = modifyCont; 
	 			rvreply.rvReNo = redx;
	 			rvreplyUpdateServer();
	 			    
	 			$('body').append($('#modifyForm'));
	 			$('#modifyForm').hide();
	 			
	 			spanTag.html(modifyCont.replace(/\n/g, "<br>"))
	 		}      
	 		      
	 	})    
	 	 
	 	  rvreplyReset = function(){
		 	 
		 	 // 수정폼의 부모
		 	 spanTag = $('#modifyForm').parent();
		 	 
		 	 // 수정폼을 잘라내기 해서 body로 이동
		 	 $('body').append($('#modifyForm'));
		 	 $('#modifyForm').hide();
		 	  
		 	 // 원래 내용을 span 태그에 다시 출력 
		 	 spanTag.html(modifyCont.replace(/\n/g, "<br>"));
		 	 	
		  }  
	               
	 	  
	 	 // 수정 모달창에서 데이타 수정후 전송버튼 클릭
		 $('#usend').on('click', function(){
			 
			 updateboardServer();
				// 모달창 닫기 
				$('#uModal').modal('hide');
				// 모달창의 입력데이타 지우기 
				$('.indata').val("");
		 })
		 
	    
		  
		 // 글쓰기 모달창 에서 데이터 입력후에 전송버튼 클릭
		 $('#send').on('click', function(){
			
			writeServer();
	
			// 모달창 닫기 
			$('#wModal').modal('hide');
			// 모달창의 입력데이타 지우기 
			$('.indata').val("");

		 })
	})

</script>
    
    
<style>
/* 	#bookInfo_content {min-width: 500px;} */
	.container-fluid * {text-align: center; }
	#searchline {width: 400px;}
	.selectCountDiv {display: inline-block; height: 80px;}	
																	
	#inCartBtn {width:200px;height: 50px;font-size: 1.2em;}
	#inReplySubBtn {width:80px; height: 50px;vertical-align : top;}
	#inReForm {margin-left: 250px;min-width: 500px;}
	.infocenter #inReForm * {text-align:left;}	
	#tdfix {height: 70px;}
	#can1 .{height:10px; }
	td {width : 400px; }
	#sn {width:380px; height: 500px;}
	#mubtn{ width:100px; height:40px; background:#F5F796; color:black; font-size:0.9em; float:left; border-radius: 50px;   }
	#bookInfo_ITP_div{width:100%;}
	#imgDiv{width:380px; float: left;}
	.conDiv{width:60%; height:500px; float: left; text-align:left; }
	#contFont{font-size:1.3em;}
	.cart{width:300px; height:150px; margin-left: 500px; }
	.Litem{width: 100px; font-size:1.3em; list-style-type:none; float:left; margin-left: 10px; text-align: left;}
	.Ritem{width: 300px;font-size:1.3em; margin-left: 20px; list-style-type:none; float:left; text-align: left;}
	#Ritem_font{font-size: 1.5em; font-weight: bold;}		
	.well{width: 300px; height: 150px;}
	#review_div{width:60%; margin-left: 350px;}
	#cartSQ{width:30%; float: right;}
	#reply_div{margin-right: 200px;}
	#text_size{font-size: 1.0em;}
	.result1{
		width : 70%;
		margin-left:17%;
	}
	#write{
		margin-right:60%;
	}
	.panel{
		text-align:center;
		margin-left:10px;
	}
	#a{
		text-align: left;
	}
	#text_size{font-size: 1.0em;}
	.Ritem{font:1.3em NanumBarunGothic;}
	#text_size{font: 1.2em NanumBarunGothic;}
</style>


<div class="container-fluid text-center" id="bookInfo_content" >    
				<%
						for(int i=0; i<bkImgList.size(); i++) {
							if(bkVO.getImgId() == bkImgList.get(i).getImgId()){
				%>
				
	<div class="col-sm-7 text-left infocenter" >
	<br>
		<div>
		<span id="bkNameH3Tag" style="font-size:2.3em; font-weight:bold;" NanumBarunGothic><%=bkVO.getBkNm() %></span>
		<button id="mubtn">무료배송</button>
		</div>
		<hr style="border:solid 2px black;">
		<br>
		<br>
		<br>
		<!-- 내용  -->
		
		
		<div id="bookInfo_ITP_div" >
			<form id="cartInForm" name="cartInForm" target="popwin">
					<div id="imgDiv">
						<span><img id="sn" alt="img1" src="<%=request.getContextPath()%><%=bkImgList.get(i).getImgPath()%>"></span>
					</div>
					
					<div class="conDiv" >	
						<span>&nbsp;&nbsp;&nbsp;</span>
						<span style="font-size:1.5em; font-weight:bold; color:#F42775;" >국내도서 2만원 이상 구매시 파우치/텀블러 증정</span><br><br>
						<ul>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;정가</li>
								<li class="Ritem"><%=bkVO.getBkFixPrice() %>&nbsp;원</li>
							</div><br><br>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;할인가</li>
								<li class="Ritem" id="Ritem_font"><%=bkVO.getBkSelPrice() %>&nbsp;원</span>&nbsp;&nbsp;<span style="font-size:1.2em; color:#F42775;">(10% 할인!)</span></li><br><br>
								<input type="hidden" name="selPrice" value="<%=bkVO.getBkSelPrice() %>">
							</div><br><br>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;출간일</li>
								<li class="Ritem"><%=bkVO.getBkDt() %></li><br>
							</div><br><br>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;쪽수</li>
								<li class="Ritem"><%=bkVO.getBkPage() %>쪽</li><br>
							</div><br><br>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;ISBN코드</li>
								<li class="Ritem"><%=bkVO.getBkIsbn()%></li><br>
							</div><br><br>
							<div>
								<li class="Litem">&nbsp;&nbsp;&nbsp;책 소개</li>
								<li class="Ritem" id="text_size"><%=bkVO.getBkArti()%></li><br>
							</div><br><br>
						</ul>
						<input type="hidden" name="isbn" value="<%=bkVO.getBkIsbn()%>">	<br>
						<input type="hidden" id="number" name="number">				
						<input type="hidden" id="bookProd" name="bookProd" value="eBook">	
						<input type="hidden" id="bkNamePath" name="bkNamePath">			
					</div>
	<% 								
									}
							}
	%>			
			</form>
			 
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	<form name="cartInForm_su">
		<div id="cart" style="border:1px solid white; width:300px; float:left; height: 300px; ">
			<div class="well" style="border:1px solid white; height: 200px;" >
				<div class="selectCountDiv" >수량
					<input type="button" value="+" class="plus">
					<input type="number" id="numBox" name="res" min="1" max="10" value="1" readonly/>
					<input type="button" value="-" class="minus">
				</div>
				<input id="inCartBtn" type="button" value="장바구니 담기">      
	       </div>
		</div>
	</form>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
  <body>

 <div id="modifyForm">
 	<textarea id="text" rows="5" cols="50"></textarea>
 	<input type="button" value="확인" class="action" name="reok" id="btnOK">
 	<input type="button" value="취소" class="action" name="reset" id="btnReset">
 </div>
 
 <br><br>
 <hr>
 <input data-toggle="modal" data-target="#wModal" id="write" type="button" value="서평작성"><br><br><br><br>
<div class="result1"></div>

<div id="btngroup1"></div>
   
 <!-- 글쓰기 Modal -->
<div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">글쓰기</h4>
      </div>
      <div class="modal-body">  
 	
	      <form name="wform" id="wform">
	      	
	     	아이디<input class="indata" type="text" id="memId" name="memId"><br> 
	           주문번호<input class="indata" type="text" id="ordNo" name="ordNo"><br>
	             카트번호<input class="indata" type="text" id="cartNo" name="cartNo"><br>
	             제목<input class="indata" type="text" id="rvTitle" name="rvTitle"><br>
	     	내용<br>
	     	<textarea class="indata" id="rvCont" name="rvCont" rows="20" cols="50" name="writer"></textarea><br>
	             <input id="send" type="button" value="전송"> 
	             평점<input class="indata" type="text" id="rvGr" name="rvGr"><br>
	               
	      </form>
     	      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>	
  </div>
</div> 
  
   
      
       
     
  <!--글 수정 form  Modal -->
<div id="uModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
 
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">글수정</h4>
      </div> 
      <div class="modal-body"> 
	      <form name="uform" id="uform">
	      	글번호<input class="indata" type="text" id="urvNo" name="rvNo"><br>
	     	제목<input class="indata" type="text" id="urvTitle" name="rvTitle"><br> 
	     	내용<br>
	     	<textarea class="indata" id="urvCont" name="rvCont" rows="20" cols="50"></textarea><br>
	             <input id="usend" type="button" value="전송"> 
	     	평점<input class="indata" type="text" id="urvGr" name="rvGr"><br> 
	               
	      </form>           
     	          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div> 

 
 


	

</body>
   
</div>
  
  
