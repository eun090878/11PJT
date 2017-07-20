<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/creative.min.css" rel="stylesheet">
		
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
	<script type="text/javascript">	
	
		function fncGetAllList(currentPage){
		//	document.getElementById("currentPage").value = currentPage;
		//   	document.detailForm.submit();	
		   	$('#currentPage').val(currentPage);
		   	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase?userId=${purchase.buyer.userId}").submit();
		}
			
		$(function() {
			//구매정보 확인
			$(".ct_list_pop td:nth-child(1) span").on("click", function() {
				/* alert($(this).attr('tranNo') + " :: tranNo"); */
				self.location="/purchase/getPurchase?tranNo="+$(this).attr('tranNo');					
				});
				
			//고객정보 확인
			$(".ct_list_pop td:nth-child(3) span").on("click", function() {
//				alert($(this).attr('userId') + " :: userId");
//				self.location="/user/getUser?userId="+$(this).attr('userId');		
										
			var userId = $(this).attr('userId').trim();
			$.ajax( 
			{
				url : "/user/getJsonUser/"+userId ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					//Debug...
					//alert(status);
					//Debug...
					alert("JSONData : \n"+JSONData);
					alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
					
					var displayValue = "<h3>"
												+"아이디 : "+JSONData.user.userId+"<br/>"
												+"이  름 : "+JSONData.user.userName+"<br/>"
												+"이메일 : "+JSONData.user.email+"<br/>"
												+"ROLE : "+JSONData.user.role+"<br/>"
												+"등록일 : "+JSONData.user.regDate+"<br/>"
												+"</h3>";
					//Debug...									
					//alert(displayValue);
					$("h3").remove();
					$( "#"+userId+"" ).html(displayValue);
				}
			});
		});
				
		$(".ct_list_pop td:nth-child(11) span").on("click", function() {
			alert($(this).attr('tranNo') + " :: userId" + $(this).attr('tranCode'));
			self.location="/purchase/updateTranCode?tranNo="+$(this).attr('tranNo') + "&tranCode=" + $(this).attr('tranCode');					
		});
	});
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
<div class="container">

<%-- <form name="detailForm" action="/purchase/listPurchase?userId=${purchase.buyer.userId}" method="post"> --%>
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">
							<span tranNo="${purchase.tranNo}">
							<%-- 	<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"></a> --%>
							${ i }
							</span>						
						</td>						
						<td></td>							
							<td align="left">
								<span userId="${purchase.buyer.userId }">
									<%-- <a href="/user/getUser?userId=${purchase.buyer.userId }"></a> --%>
										${purchase.buyer.userId }
								</span>
							</td>
						<td></td>
						<td align="left">${purchase.receiverName}</td>
						<td></td>
						<td align="left">${purchase.receiverPhone}</td>
						<td></td>
						<td align="left">
							<c:choose>
								<c:when test="${purchase.tranCode.trim()=='1'}">현재 구매완료 상태입니다.</c:when>
								<c:when test="${purchase.tranCode.trim()=='2'}">현재 배송중 상태입니다.</c:when>
								<c:when test="${purchase.tranCode.trim()=='3'}">현재 배송완료 상태입니다.</c:when>
							</c:choose>
						</td>
						<td></td>
						<td align="left">
							<span tranNo="${purchase.tranNo}" tranCode="${purchase.tranCode}">
								<c:if test="${purchase.tranCode.trim()=='2' }"	>
									<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">물건도착</a><br/> --%>
									물건도착<br/>
								</c:if>
							</span>
						</td>
					</tr>
					
					<tr>
							<td id="${user.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					</c:forEach>
			</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
				   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>	
					<jsp:include page="../common/pageNavigator_new.jsp"/>	
		</td>
	</tr>
</table>
</form>

</div>
</body>
</html>