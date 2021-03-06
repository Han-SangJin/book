/**
 * 
 */
/**
 * 
 */

currentpage = 1;

var updateboardServer = function() {
   $.ajax({
      url : '/RainBooks/updateNoticeboard',
      type : 'post',
      data : $('#uform').serialize(),
      success : function(res) {
//         alert(res.sw);
         readServer(1)
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      },
      dataType : 'json'
   })
}

var viewServer = function() {
   
   $.ajax({
      url : "/RainBooks/updateNoticeboard",
      type : 'get',
      data : { "ntNo" : idx },
      dataType : 'json',
      success : function(res) {
         $('#umngId').val(res.mngId);
         $('#untTitle').val(res.ntTitle);
         //content = res.content.replace(/<br>/g, "\n");
         //$('#ucontent').val(content);
         $('#untCont').val(res.ntCont);
         
         $('#uModal').modal('show');
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status)
      }
   })
}

var writeServer = function() {
   
   $.ajax({
      url : '/RainBooks/insertNoticeboard',
      data : $('#wform').serialize(), /*write,*/
      dataType : 'json',
      type : 'post',
      success : function(res) {
//         alert(res.sw);
         readPageServer(1);
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      }
   })
}

var deleteServer = function(idx, button) {
   $.ajax({
      url : '/RainBooks/deleteNoticeboard',
      data : {"ntNo" : idx},
      type : 'post',
      dataType : 'json',
      success : function(res) {
         //alert(res.sw);
         $(button).parents('.panel').remove();
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      }
   })
   
}
var replyDeleteServer = function(idx, button) {
   $.ajax({
      url : '/RainBooks/deleteQnaReply',
      data : {"qryReNo" : idx},
      type : 'post',
      dataType : 'json',
      success : function(res) {
         //alert(res.sw);
         $(button).parents('.rep').remove();
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      }
   })
};

var replyUpdateServer = function() {
   $.ajax({
      url : '/RainBooks/updateQnaReply',
      data : reply, // cont, renum
      type : 'post',
      dataType : 'json',
      success : function(res) {
         alert(res.sw);
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      }
      
   })
};

var replyListServer = function(button) {
   console.log("reply list=" + reply.qryNo);
   $.ajax({ 
      data : {"qryNo" : reply.qryNo},
      url : '/RainBooks/selectQnaReply',
      type : 'get',
      dataType : 'json',
      success : function(res) {
         $(button).parents('.panel').find('.rep').remove();
         repl = "";
         
         $.each(res, function(i, v) {
            
                 repl +='    <div class="panel-body rep">';
                 repl +='       <p style="float:left; width:70%;" >';
                 repl +='         <span>' + v.mngId + '&nbsp;&nbsp;&nbsp;&nbsp;';
                 repl +=           v.qryReDt + '&nbsp;&nbsp;&nbsp;&nbsp;';
                 repl +='          </span><br><br>';
                 repl +='          <span class="cont">' + v.qryReCont + '</span></p>';
                 repl +='       <p style="float:right; width:20%;" >';
                 repl +='          <input idx="'+ v.qryReNo +'" type="button" name="r_modify" class="action" value="댓글수정">';
                 repl +='          <input idx="'+ v.qryReNo +'" type="button" name="r_delete" class="action" value="댓글삭제">';
                 repl +='       </p>';
                 repl +='   </div>';   

         })
         $(button).parents('.panel').find('.pbody').append(repl);
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      }
   })
};

var replySaveServer = function(button) {
   
   // reply객체를 서버로 보낸다.
   $.ajax({
      url : '/RainBooks/insertQnaReply',
      data : reply,
      type : 'post',
      success : function(res) {
//         alert(res.sw); //DB에 저장만
         replyListServer(button);
      },
      error : function(xhr) {
         alert("상태 : " + xhr.status);
      },
      dataType : 'json'
   })
}

var readpageServer = function(cpage) {
   
   $.getJSON(
         '/RainBooks/selectAllNoticeboard',
         {"page" : cpage},
         function (res) {
            $('.box').empty();
                  code = '<div class="panel-group" id="accordion">';
                  $.each(res, function(i, v) {
                        code+='<div class="panel panel-default">';
                        code+='  <div class="panel-heading">';
                        code+='    <h4 class="panel-title">';
                        code+='      <a idx="' + v.ntNo + '"class="action" name="list" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.ntNo + '">' + v.ntTitle + '</a>';
                        code+='    </h4>';
                        code+='  </div>';
                        code+='  <div id="collapse' + v.ntNo + '" class="panel-collapse collapse ">';
                        code+='    <div class="panel-body pbody">';
                        code+='       <p style="float:left; width:70%;" >';
                        code+='          작성자 : '+ v.ntNo +' &nbsp;&nbsp;&nbsp;&nbsp;';
                        code+='          작성자 : '+ v.mngId +' &nbsp;&nbsp;&nbsp;&nbsp;';
                        code+='          제목 : '+ v.ntTitle +' &nbsp;&nbsp;&nbsp;&nbsp;';
                        code+='          날짜 : '+ v.ntDt +' &nbsp;&nbsp;&nbsp;&nbsp;';
                        code+='       </p>';
                        code+='       <p style="float:right; width:20%;" >';
                        code+='          <input idx="'+ v.ntNo +'" type="button" name="modify" class="action" value="수정">';
                        code+='          <input idx="'+ v.ntNo +'" type="button" name="delete" class="action" value="삭제">';
                        code+='       </p>';
                        code+='       <hr>';
                        code+='       <p>';
                        code+=         v.ntCont; 
                        code+='       </p>';
                        code+='       <p>';
                        code+='          <textarea cols="80"></textarea>';
                        code+='          <input idx="'+ v.ntNo +'" type="button" name="reply" class="action" value="등록">';
                        code+='       </p>';
                        code+='    </div>';
                        code+='  </div>';
                        code+='</div>';
                     
                  })
                  code += "</div>";
                  $('.box').append(code);
                  
                  totalpage = res.tpage;
                  startpage = res.spage;
                  endpage = res.epage;
                  currentpage = res.cpage;
                  
                  // 이전버튼 출력
                  $('#btngroup1').empty();
                  pager = "";
                  if(startpage > 1){
                     pager += '<ul class="pager">';
                     pager += '<li class="previous"><a href="#">Pervious</a></li>';
                     pager += '</ul>';
                     $(pager).appendTo('#btngroup1');
                  }
                  // 페이지번호 출력
                  
                  pager = '<ul class="pagination pager">';
                  for(i=startpage; i<=endpage; i++){
                     if(currentpage == i){
                        pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
                     }else{
                        pager += '<li><a class="paging" href="#">' + i + '</a></li>';
                     }
                     
                  }
                  pager += '</ul>';
                  $(pager).appendTo('#btngroup1')
                  
                  // 다음버튼 출력
                  if(endpage < totalpage){
                     pager = '<ul class="pager">';
                     pager += '<li class="next"><a href="#">Next</a></li></ul>';
                     $(pager).appendTo('#btngroup1');
                  }
         } 
   )// getJSON
}; // readPageServer

var readServer = function(cpage) { // html파일에서 readServer(1), readServer(2), readServer(3)
//         $.getJSON(url, data, success) //3개만올수있다.? 순서가 바뀌면 안됨
//          $.get(url, data, success.dataType) 순서바뀌면 안됨

         $.getJSON( //단축메뉴에는 error는 속성항목에 안들어간다.
            '/RainBooks/selectAllNoticeboard',   //'/board/ListPage',
            //{"page" : cpage},
            function(res) {
               $('.box').empty();
               code = '<div class="panel-group" id="accordion">';
               $.each(res, function(i, v) {
                     code+='<div class="panel panel-default">';
                     code+='  <div class="panel-heading">';
                     code+='    <h4 class="panel-title">';
                     code+='      <a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.ntNo + '">' + v.ntTitle + '</a>';
                     code+='    </h4>';
                     code+='  </div>';
                     code+='  <div id="collapse' + v.ntNo + '" class="panel-collapse collapse ">';
                     code+='    <div class="panel-body">';
                     code+='       <p style="float:left; width:70%;" >';
                     
                     code+='          번호 : '+ v.ntNo +' &nbsp;&nbsp;&nbsp;&nbsp;';
                     code+='          작성자 : '+ v.mngId +' &nbsp;&nbsp;&nbsp;&nbsp;';
                     code+='          제목 : '+ v.ntTitle +' &nbsp;&nbsp;&nbsp;&nbsp;';
                     code+='          날짜 : '+ v.ntDt +' &nbsp;&nbsp;&nbsp;&nbsp;';
                     code+='       </p>';
                     code+='       <p style="float:right; width:20%;" >';
                     code+='          <input idx="'+ v.ntNo +'" type="button" name="modify" class="action" value="수정">';
                     code+='          <input idx="'+ v.ntNo +'" type="button" name="delete" calss="action" value="삭제">';
                     code+='       </p>';
                     code+='       <hr>';
                     code+='       <p>';
                     code+=         v.ntCont; 
                     code+='       </p>';
                     code+='       <p>';
                     code+='          <textarea cols="80"></textarea>';
                     code+='          <input idx="'+ v.ntNo +'" type="button" name="reply" calss="action" value="등록">';
                     code+='       </p>';
                     code+='    </div>';
                     code+='  </div>';
                     code+='</div>';
                  
               })
               code += "</div>";
               $('.box').append(code);
                           
            }
         ) 
         
}