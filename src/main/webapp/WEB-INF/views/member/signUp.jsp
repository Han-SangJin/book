<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/member.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
$(function(){
	var clicked = 0;
	// 폼 입력이 안됐을때 경고창    
	$('#submit').on('click',function(){
		if(clicked<=0){alert("ID검사를 해주세요");return false;}
		if($('#memId').val().trim().length==0){alert("ID를 입력하세요");$('#memId').focus();return false;}
		if($('#memPass1').val().trim().length==0){alert("비밀번호를 입력하세요");$('#memPass1').focus();return false;}
		if($('#memName').val().trim().length==0){alert("이름을 입력하세요");$('#memName').focus();return false;}
		if($('#addr1').val().trim().length==0){alert("주소를 입력하세요");$('#addr1').focus();return false;}
		if($('#addr2').val().trim().length==0){alert("상세주소를 입력하세요");$('#addr2').focus();return false;}
		if($('#memBir').val().trim().length==0){alert("생일을 입력하세요");$('#memBir').focus();return false;}
		if($('#memHp').val().trim().length==0){alert("휴대폰번호를 입력하세요");$('#memHp').focus();return false;}
		if($('#memMail').val().trim().length==0){alert("메일을 입력하세요");$('#memMail').focus();return false;}
		if(checkIdRes==0){alert("이미 사용중인 아이디입니다 다시 입력해주세요");$('#memId').focus();return false;}
	})
	
	// ID중복검사
	$('#checkId').on('click',function(){
		clicked++;
		memId = $('#memId').val();
		if(memId==""){alert("아이디를 입력해주세요");
		}else{checkId(memId);}
	})
	// 비밀번호 두개 비교해서 일치한지 확인
	$('#memPass2').on('keyup',function(){
		pass1 = $('#memPass1').val();
		pass2 = $('#memPass2').val();
		if(pass1=="" && pass2=="") {
			$('#checkPassRes').empty();
		}else{
			checkPass(pass1,pass2);
		}
	})
	// 주소검색시 주소입력후 엔터로 검색할수있는기능
	$('#addrInfo').on('keydown',function(event){
		if(event.keyCode==13){
			addr = $('#addrInfo').val();
			searchAddr(addr);
		}
	})
	// 확인버튼 눌렀을때 주소 검색
	$('#addrSearch').on('click',function(){
		addr = $('#addrInfo').val();
		searchAddr(addr);
	})
	
	// 주소입력 후 검색했을때 결과값들
	$('#addrResult').on('click','.ziptr',function(){
		zipcode = $('td:eq(0)',this).text();
		addr = $('td:eq(1)',this).text();
		sq = $('td:eq(3)',this).text();
		$('#addrSq').val(sq); // 주소 시퀀스번호
		$('#zipCode').val(zipcode);
		$('#addr1').val(addr);
		$('#myModal').modal('hide');
	})
	
	// 아이디창에 공백을 입력했을때 뜨는 문구
	$('.check').keyup(function(){
		if($('#memId').val() == ""){
			$('#checkRes').html('아이디를 확인해주세요');
			$('#checkRes').css("color","orange");
		}
	})
	
    // 주소모달창
    $('#myModal').on('click',function(){
    	$('#addrResult').empty();
    	$('#addrInfo').val("");
    })
    
    
    // 비밀번호 정규식
    // 영문(대소문자) 포함, 숫자 포함, 특수 문자 포함, 공백 X,비밀번호 자리 8~20자
    $('#memPass1').on('keyup',function(){
    	$re = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		if($(this).val()=='' || !$re.test($(this).val())){
			msg="6~20자리 영문자 1개이상의 숫자 또는 특수문자를 포함해주세요";
			$('#checkPass').html(msg).css('color','red');
		}else{
			msg="사용가능한 비밀번호입니다";
			$('#checkPass').html(msg).css('color','blue');
		}
    })
    
    // 이름 정규식
    $('#memName').on('keyup',function(){
    	$re = /^[가-힣]{2,4}$/;
    	if($(this).val()==''|| !$re.test($(this).val())){
    		msg="2-4글자 사이 한글 이름을 입력해주세요";
    		$('#checkNM').html(msg).css('color','red');
    	}else{
    		msg="o(*￣▽￣*)ブ";
    		$('#checkNM').html(msg).css('color','blue');
    	}
    })
    
    // 휴대폰 정규식
    $('#memHp').on('keyup',function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		$re=/(^02.{0}^01.{1}|[0-9]{3})(-)([0-9]+)(-)([0-9]{4})/;
		if($(this).val()==''|| !$re.test($(this).val())){
			msg="휴대폰번호 형식이 올바르지 않습니다";
			$('#checkHp').html(msg).css('color','red');
		}else{
			msg="사용가능한 번호입니다";
			$('#checkHp').html(msg).css('color','blue');
		}
	})
	
    // 이메일 정규식
    $('#memMail').on('keypress',function(){
			$re=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if($(this).val()=='' || $(this).val().length<6 || !$re.test($(this).val())) {
				msg="이메일 형식에 맞게 입력해주세요";
				$('#checkEmail').html(msg).css('color','red');
			} else {
				msg="사용가능한 이메일입니다";
				$('#checkEmail').html(msg).css('color','blue');
			}
	})
})
</script>
<style>
#addrResult{
	font:1.0em NanumBarunGothic;
	cursor: pointer;
}
.input-group .form-control{
	width: 250px;
}
/* .form-group{ */
/* 	width: 250px; */
/* } */
#frm{
	margin-left: 40%;
	margin-top: 60px ;
}
#checkId{
	width: 100px;
}

.box-radio-input input[type="radio"]{
	display:none;
}

.box-radio-input input[type="radio"] + span{
	display:inline-block;
	background:none;
	border:1px solid #dfdfdf;	 
	padding:0px 10px;
	text-align:center;
	height:25px;
	line-height:23px;
	font-weight:500;
	cursor:pointer;
}

.box-radio-input input[type="radio"]:checked + span{
	border:1px solid #23a3a7;
	background:#23a3a7;
	color:#fff;
}

.but{
	margin-left: 5px;
	margin-top: 5px;
	border-radius: 10px;
	padding-top : 5px;
	border: 1px solid #f7f4ed;
	font: 1.2em NanumBarunGothic;
}
#frm{
	font : 1.0em NanumBarunGothic;
}

.checkInfo{
/*  	border:1px solid red; */
 	margin-top : 10px; 
	margin-left: 10px;
	padding-left: 10px;
	vertical-align: middle;
}

.check input[type="checkbox"]{
	position:absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}
.check input[type="checkbox"] + label{
	display: inline-block;
	position: relative;
	cursor: pointer;
}
.check input[type="checkbox"] + label:before {
	content: ' ';
	display: inline-block;
	width: 21px;
	height: 21px;
	line-height: 21px;
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.check input[type="checkbox"] + label:active:before,
.check input[type="checkbox"]:checked + label:active:before {
	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.check input[type="checkbox"]:checked + label:before{
	content: '\2714';
	color: #99a1a7;
	text-shadow: 1px 1px #fff;
	background: #e9ecee;
	border-color: #adb8c0;
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록</title>
</head>
<body>
      
<form id="frm" action="<%= request.getContextPath() %>/insertMember" method="post" >
	<img alt="로고" src="<%=request.getContextPath()%>/images/logo.png" style="width:300px; height: 200px;">
	<div class="input-group">
		<span class="input-group-addon"><img src="<%=request.getContextPath() %>/IconImg/iconmonstr-user-20-240.png" style="width:16px"></span>
		<input id="memId" type="text" class="form-control check" name="memId" placeholder="아이디">
		<button class="but" type="button" id="checkId" name="checkId" >ID중복검사</button>
	</div>
		<div id="checkRes"></div>
	
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-key-1-240.png" style="width:16px"></span>
		<input id="memPass1" type="password" class="form-control" name="memPass1" placeholder="비밀번호 입력">
		<div class="checkInfo" id="checkPass"></div>
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-key-1-240.png" style="width:16px"></span>
		<input id="memPass2" type="password" class="form-control" name="memPass2" placeholder="비밀번호 확인">
		<div class="checkInfo" id="checkPassRes"></div>
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-text-25-240.png" style="width:16px"></span>
		<input type="text" class="form-control" id="memName" name="memName" placeholder="이름">
		<div class="checkInfo" id="checkNM"></div>
	</div>
	<br>
	<img src="<%= request.getContextPath()%>/IconImg/iconmonstr-party-22-240.png" style="width:30px">
	<label class="box-radio-input"><input type="radio" id="male" name="gender" value="1" checked="checked"><span>남자</span></label>
	<label class="box-radio-input"><input type="radio" id="female" name="gender" value="2"><span>여자</span></label>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-candy-18-240.png" style="width:16px"></span>
		<input type="date" class="form-control" id="memBir" name="memBir">
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-location-1-240.png" style="width:16px"></span>
		<input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="우편번호" readonly>
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-location-1-240.png" style="width:16px"></span>
		<input type="text" class="form-control" id="addr1" name="addr1" placeholder="기본주소" readonly>
		<button class="but" type="button" data-toggle="modal" data-target="#myModal">주소검색</button>
	</div>
	<input type="hidden" id="addrSq" name="addrSq" >
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-location-1-240.png" style="width:16px"></span>
		<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%= request.getContextPath()%>/IconImg/iconmonstr-smartphone-4-240.png" style="width:16px"></span>
		<input type="text" class="form-control" id="memHp" name="memHp" placeholder="전화번호">
		<div class="checkInfo" id="checkHp"></div>
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon"><img src="<%=request.getContextPath() %>/IconImg/iconmonstr-email-2-240.png" style="width:16px"></span>
		<input id="memMail" type="text" class="form-control" name="memMail" placeholder="이메일">
		<div class="checkInfo" id="checkEmail"></div>
	</div>
	<br>
	
	<div class="input-group">
		<span class="input-group-addon" style="font-size:1.2em;text-align:center;width:290px;height:20px;">[관심도서장르]</span>
	</div>
	<br>
	<div class="input-group check">
		<input class="intrGre" type="checkbox" id="BG01" name="bkGre" value="BG01">
		<label for="BG01">문학&nbsp;</label>
		<input class="intrGre" type="checkbox" id="BG02" name="bkGre" value="BG02">
		<label for="BG02">역사&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG03" name="bkGre" value="BG03">
		<label for="BG03">예술&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG04" name="bkGre" value="BG04">
		<label for="BG04">종교&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG05" name="bkGre" value="BG05">
		<label for="BG05">경제&nbsp; </label>
		<br>
		<input class="intrGre" type="checkbox" id="BG06" name="bkGre" value="BG06">
		<label for="BG06">사회&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG08" name="bkGre" value="BG08">
		<label for="BG08">생활&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG09" name="bkGre" value="BG09">
		<label for="BG09">여행&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG10" name="bkGre" value="BG10">
		<label for="BG10">취미&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG13" name="bkGre" value="BG13">
		<label for="BG13">만화&nbsp; </label>
		<br>
		<input class="intrGre" type="checkbox" id="BG11" name="bkGre" value="BG11">
		<label for="BG11">청소년&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG12" name="bkGre" value="BG12">
		<label for="BG12">참고서&nbsp; </label>
		<input class="intrGre" type="checkbox" id="BG07" name="bkGre" value="BG07">
		<label for="BG07">자기계발&nbsp; </label>
	</div>
	<br>
	<input id="submit" type="submit" value="회원 등록" class="btn">
</form>
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">우편번호 찾기</h4>
        </div>
        <div class="modal-body">
			<p>주소를 입력해주세요</p>
			<input type="text" id="addrInfo">
			<input id="addrSearch" type="button" value="확인">
			<div id="addrResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>