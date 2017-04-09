<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Insert title here</title>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
	 $(function() {
		 $('form').attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}");
		 
	 })
	
	</script>
</head>

<body>

<%-- <form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${purchase.tranNo}" method="post"> --%>
<form name="updatePurchase">
������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>		
		<c:if test="${purchase.paymentOption == '1'}">		
			���ݱ���	
		</c:if>
		<c:if test="${purchase.paymentOption == '2'}" >
			�ſ뱸��	
		</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.dlvyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.dlvyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.dlvyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>