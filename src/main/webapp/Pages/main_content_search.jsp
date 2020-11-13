<%@page import="rb.cmm.vo.BookImgVO"%>
<%@page import="rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 	List<BookVO> bkList = (List<BookVO>)request.getAttribute("bkVO");
	List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgVO");
	
	%> 
<style>

.dropmenu{
border:none;
border:0px;
margin:0px;
padding:0px;
font: "sans-serif";
font-size:18px;
}

.dropmenu ul{
background: #666;
height:100px;
list-style:none;
margin:0;
padding:0;
}

.dropmenu li{
float:left;
padding:0px;
}

.dropmenu li a{
background: #666;
color:#fff;
display:block;
line-height:100px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.dropmenu li a:hover, .dropmenu ul li:hover a{
background: rgb(31,31,31);
color:#FFFFFF;
text-decoration:none;
}

.dropmenu li ul{
background: red;
display:none; 
height:auto;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.dropmenu li:hover ul{
display:block;
}

.dropmenu li li {
background: red;
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.dropmenu li:hover li a{
background:none;
}

.dropmenu li ul a{
display:block;
height:80px;
font-size:14px;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.dropmenu li ul a:hover, .dropmenu li ul li:hover a{
background: rgb(171,171,171);
border:0px;
color:#ffffff;
text-decoration:none;
}

.dropmenu p{
clear:left;

}

</style>


<div class="container-fluid text-center">    





  <div class="row content">
  	<div class="col-sm-2 sidenav dropmenu">
  		<ul>
  		 <li><a href="#" id="cirrent">도서</a>
  		  <ul>
	      <li><a id="ct1" href="/RainBooks/SelectBookGre?bkGreCd=BG01?">문학</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG02?">역사</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG03">예술</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG04">종교</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG05">경제</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG06">사회</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG07">자기계발</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG08">생활</a></li>	
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG09">여행</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG10">취미</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG11">청소년</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG12">참고서</a></li>
	      <li><a href="/RainBooks/SelectBookGre?bkGreCd=BG13">만화</a></li>
  		  </ul>
  		 </li>
  		</ul>
  		<ul>
  		  <li><a href="#">eBooK</a>
  		  <ul>
	      <li><a id="ct1" href="/RainBooks/SelectBookGreEbk?bkGreCd=BG01">문학</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG02">역사</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG03">예술</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG04">종교</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG05">경제</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG06">사회</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG07">자기계발</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG08">생활</a></li>	
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG09">여행</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG10">취미</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG11">청소년</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG12">참고서</a></li>
	      <li><a href="/RainBooks/SelectBookGreEbk?bkGreCd=BG13">만화</a></li>
  		  </ul>
  		 </li>
  		</ul>
  	</div>
    
    
    
    
    
    
    <div class="col-sm-8 text-left infocenter"><br><br><br> 
      <form action="/RainBooks/searchBook" id="searchBook"">
	      <p>
	      	RAINBOOKS
	      	<select name="bookProd">
	      		<option value="P001">서적</option>
	      		<option value="P002">eBook</option>
	      	</select>
	      	<input type="text" name="bookName" id="bookName" name="bookInfo">
	      	<input type="submit" value="검색"> 
	      	
	      </p>
      </form>
      
      
      <hr>
      
      
      
      
      <!-- 내용  -->
      <div id="showBooksInfo">
      	베스트 셀러
      	<jsp:include page="/view/searchBook.jsp" flush="false"/>
      </div>
    </div>
    
    
    
    <div class="col-sm-2 sidenav">
      
      <div class="well">
      <a href="/RainBooks/SelectBookGreBst">
        <p>베스트셀러</p>
 	  </a>
      <a href="/RainBooks/SelectBookGreLt">
        <p>신간</p>
 	  </a>
      <a href="#">
        <p>이벤트</p>
 	  </a>
      <a href="#">
        <p>관심분야 추천도서</p>
 	  </a>
      </div>
    </div>
    
    
  </div>
  
  
  
  
</div>