<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">	
	
			function fncGetAllList(currentPage){
			//	document.getElementById("currentPage").value = currentPage;
			//   	document.detailForm.submit();	
			   	$('#currentPage').val(currentPage);
			   	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase?userId=${purchase.buyer.userId}").submit();
			}
			
			$(function() {
				
				//�������� Ȯ��
				$(".ct_list_pop td:nth-child(1) span").on("click", function() {
					alert($(this).attr('tranNo') + " :: tranNo");
					self.location="/purchase/getPurchase?tranNo="+$(this).attr('tranNo');					
				});
				
				//������ Ȯ��
				$(".ct_list_pop td:nth-child(3) span").on("click", function() {
//					alert($(this).attr('userId') + " :: userId");
//					self.location="/user/getUser?userId="+$(this).attr('userId');		
										
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
																+"���̵� : "+JSONData.user.userId+"<br/>"
																+"��  �� : "+JSONData.user.userName+"<br/>"
																+"�̸��� : "+JSONData.user.email+"<br/>"
																+"ROLE : "+JSONData.user.role+"<br/>"
																+"����� : "+JSONData.user.regDate+"<br/>"
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
				
			})

	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<%-- <form name="detailForm" action="/purchase/listPurchase?userId=${purchase.buyer.userId}" method="post"> --%>
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
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
								<c:when test="${purchase.tranCode.trim()=='1'}">���� ���ſϷ� �����Դϴ�.</c:when>
								<c:when test="${purchase.tranCode.trim()=='2'}">���� ����� �����Դϴ�.</c:when>
								<c:when test="${purchase.tranCode.trim()=='3'}">���� ��ۿϷ� �����Դϴ�.</c:when>
							</c:choose>
						</td>
						<td></td>
						<td align="left">
							<span tranNo="${purchase.tranNo}" tranCode="${purchase.tranCode}">
								<c:if test="${purchase.tranCode.trim()=='2' }"	>
									<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">���ǵ���</a><br/> --%>
									���ǵ���<br/>
								</c:if>
							</span>
						</td>
					</tr>
					
					<tr>
							<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
							<td id="${user.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					</c:forEach>
			</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
				   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>	
					<jsp:include page="../common/pageNavigator.jsp"/>	
		</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>

</div>
</body>
</html>