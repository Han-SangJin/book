/**
 * 
 */

var checkName =function(){
	var getName= RegExp(/^[가-힣]+$/);
	 //이름 유효성 검사
    if (!getName.test($("#memName").val())) {
      $('#checkNameRes').text("올바르지 않는 이름형식입니다.");
      $("#memName").val("");
      $("#memName").focus();
      return false;
    }
}