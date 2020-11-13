<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, String>> mapList = (List<Map<String, String>>)request.getAttribute("mapList");
	String ordSt = "";
%>       
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<title>주문내역 리스트</title>
<script>
$(function(){
	/* 배송준비 상태인 주문을 배송중으로 상태 변환 */
	$('#tab').on('click', 'input.deliveryOn', function(){
// 		console.log($(this).parents('.resultList').find('td.ordNo').text());
// 		console.log($(this).parents('.resultList').find('td.memId').text());
		$.ajax({
			url : '/RainBooks/ordDeliveryOn',
			data : {"ordSt" : $(this).prev().val(),
				    "ordNo" : $(this).parents('tr.resultList').find('td.ordNo').text(),
				    "memId" : $(this).parents('tr.resultList').find('td.memId').text()},
			type :'get',
			dataType : 'json',
			success : function(res){
				alert("처리 결과 : "+res.sw);
			},
			error : function(xhr){
				alert("상태 : "+ xhr.status);	
			}	
		})
	})
	/* 환불 승인 버튼 누를 시 환불 처리  */
	$('#tab').on('click', 'input.refundOn', function(){
		$.ajax({
			url : '/RainBooks/ordRefundOn',
			data : {"ordSt" : $(this).prev().val(),
				    "ordNo" : $(this).parents('tr.resultList').find('td.ordNo').text(),
				    "memId" : $(this).parents('tr.resultList').find('td.memId').text()},
			type :'get',
			dataType : 'json',
			success : function(res){
				alert("처리 결과 : "+res.sw);
			},
			error : function(xhr){
				alert("상태 : "+ xhr.status);	
			}	
		})
	})
	/* 환불 거절시 사유 적어서 전송해서 환불 거절 처리  */
	$('#tab').on('click', 'input.refundOff', function(){
		$.ajax({
			url : '/RainBooks/ordRefundOff',
			data : {"ordSt" : $(this).prev().val(),
				    "ordNo" : $(this).parents('tr.resultList').find('td.ordNo').text(),
				    "memId" : $(this).parents('tr.resultList').find('td.memId').text()},
			type :'get',
			dataType : 'json',
			success : function(res){
				alert("처리 결과 : "+res.sw);
			},
			error : function(xhr){
				alert("상태 : "+ xhr.status);	
			}	
		})
	})
})
</script>
<style>
*{font:1.0em NanumBarunGothic;}
.table{border-collapse: collapse;border-top: 3px solid #5a810c; margin-left: 130px;}
.table th{color: #81b912; background: #f7fced; text-align: center; }
.table th, .table td{padding: 10px; border: 1px solid #ddd;}
.table th:first-child ,.table td:first-child{border-left: 0;} 
.table th:last-child ,.table td:last-child{border-left: 0;} 
.table tr td {text-align: center;}
</style>
</head>
<body>
<table class="table" id="tab" >
<%if(mapList.isEmpty()){
%>	<tr><td colspan="12">해당 결과가 존재하지 않습니다.</td></tr>
	
<% }else{
%>
		<tr>
			<th>주문날짜</th>
			<th>주문번호</th>
			<th>카트번호</th>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>ISBN코드</th>
			<th>도서명</th>
			<th>상품코드</th>
			<th>수량</th>
			<th>총 합계</th>
			<th>주문금액</th>
			<th colspan="2">기타</th>
		</tr>
<%	
		for(int i=0;i<mapList.size();i++){
%>
			<tr class="resultList">
			<td><%=mapList.get(i).get("ordDt") %></td>
			<td class = "ordNo"><%=mapList.get(i).get("ordNo") %></td>
			<td><%=mapList.get(i).get("cartNo") %></td>
			<td class = "memId"><%=mapList.get(i).get("memId") %></td>
			<td><%=mapList.get(i).get("memNm") %></td>
			<td><%=mapList.get(i).get("isbn") %></td>
			<td><%=mapList.get(i).get("bkNm") %></td>
			<td><%=mapList.get(i).get("prodCd") %></td>
			<td><%=mapList.get(i).get("qty") %></td>
			<td><%=mapList.get(i).get("cartPrice") %></td>
			<td><%=mapList.get(i).get("ordPrice") %></td>
<%			if(mapList.get(i).get("prodCd").equals("P001")){ %>			
			<td>
<%			
				switch(Integer.valueOf(mapList.get(i).get("ordSt"))){
				case 1: ordSt= "배송준비"; break;
				case 2: ordSt="배송중"; break;
				case 3: ordSt= "수령완료"; break;
				case 4: ordSt= "주문취소"; break;
				case 5: ordSt= "환불신청"; break;
				case 6: ordSt= "환불완료"; break;
				case 7: ordSt= "환불거절";
				}	
%>		
				<%=ordSt %></td>
			
		<%
				if(Integer.valueOf(mapList.get(i).get("ordSt"))==1){			
			%>		
					<td>
					<input type="hidden" class="deliveryCd" value="2">
					<input type="button" class="deliveryOn" value="배송시작">
					</td>
		<%
				}else if(Integer.valueOf(mapList.get(i).get("ordSt"))==5){ %>
					<td>
					<input type="hidden" class="deliveryCd" value="6">
					<input type="button" class="refundOn" value="환불 승인">
					<input type="hidden" class="deliveryCd" value="7">
					<input type="button" class="refundOff" value="환불 거절">
					</td>		
		<%			
				}else{
%>					<td colspan="2"></td>	
<%				}
			}else{
%>
					<td colspan="2"></td>
<%				
			}
%>
			</tr>
<%		
		}
	}

%>
</table>
</body>
</html>