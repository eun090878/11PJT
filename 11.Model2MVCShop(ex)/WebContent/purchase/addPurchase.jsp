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
	
	<style>
       body > div.container{
            margin-top: 100px;
        }
    </style>
	<script type="text/javascript">
		$( function() {
			$("#complete").bind("click", function() {
				alert("ddddd")
				self.location = "/purchase/listPurchase";			
			});	
		});
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
	<div class="container">
		<div class="page-header">
			<h3 class=" text-info">��ǰ ���� ����</h3>
			<h5 class="text-muted">������ ���� ���Ű� �Ǿ����ϴ�.</h5>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>	
		<hr/>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>	 	 	
		<hr/>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
				<c:if test="${purchase.paymentOption == '1'}">
					<div class="col-xs-8 col-md-4">���ݱ���</div>
				</c:if>
				<c:if test="${purchase.paymentOption == '2'}" >
					<div class="col-xs-8 col-md-4">�ſ뱸��</div>
				</c:if>
		</div>	
		<hr/>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>	 	 	
		<hr/> 
			
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>	 	 	
		<hr/> 
			
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyAddr}</div>
		</div>	 	 	
		<hr/> 
			
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�����ڿ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
		</div>	 	 	
		<hr/> 
			
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
		</div>	 	 	
		<hr/> 
			
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-info" id="complete"> Ȯ��</button>
			</div>
		</div>
	</div>
</body>
</html>