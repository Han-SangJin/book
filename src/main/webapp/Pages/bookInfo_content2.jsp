<%@page import="java.util.Date"%>
<%@page import="rb.cmm.vo.MemberVO"%>
<%@page import="rb.cmm.vo.BookImgVO"%>
<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 	BookVO bkVO = (BookVO)request.getAttribute("bkVO");
    String bkDate = (String)request.getAttribute("bkDate");
    List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgList");
    MemberVO member = (MemberVO) session.getAttribute("member");
%> 
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	
	
	$(function(){
		
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
</style>


<div class="container-fluid text-center" id="bookInfo_content" >    
				<%
						for(int i=0; i<bkImgList.size(); i++) {
							if(bkVO.getImgId() == bkImgList.get(i).getImgId()){
				%>
				
	<div class="col-sm-7 text-left infocenter" >
	<br>
		<div>
		<span id="bkNameH3Tag" style="font-size:2.3em; font-weight:bold;" NanumBarunGothic;><%=bkVO.getBkNm() %></span>
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
						</ul>
						<input type="hidden" name="isbn" value="<%=bkVO.getBkIsbn()%>">	<br>
						<input type="hidden" id="number" name="number">				
						<input type="hidden" id="bookProd" name="bookProd" value="nomalBook">	
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
                <input type="button" value="+" class="plus" onClick="javascript:this.form.res.value++;">
                <input type="number" id="numBox" name="res" min="1" max="10" value="1" readonly/>
                <input type="button" value="-" class="minus" onClick="javascript:this.form.res.value--;">
             </div>
             <input id="inCartBtn" type="button" value="장바구니 담기">      
         </div>
	</form>
	
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div id="review_div" style="border:5px dotted white;" >
      
      
         <div id="review_Rwite_div" style="border:1px solid white;">
        
            <br>
           <jsp:include page="bookreviewall.html"></jsp:include>
                  
         </div>
      
         <form action="inReForm" id="inReForm">
            <div id="reply_div">
               리뷰게시판
               한줄평 작성 라인
               <br>
               <br>
               점수<input type="text" id="replyScore">
               <br>
               제목<input type="text" id="reply_title">
                 <br>
                 <br>
           	<div id="inReplyDiv">
              <textarea rows="6" cols="120" id="reply_content"></textarea>
              <input id="inReplySubBtn" type="submit" value="등록">
           </div>
           </div>
         </form>
      </div>
   
</div>
  
  
