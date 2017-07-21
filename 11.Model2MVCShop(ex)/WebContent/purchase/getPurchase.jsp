<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
	
	<script type="text/javascript">

		$(function() {
			$(".ct_btn01:contains('����')").on("click", function() {
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}";
			});
	
			 $( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
				history.go(-1);
			});
		});
	</script>

</head>
<body>
 <jsp:include page="/layout/toolbar.jsp" /> 
		<div class="container">
			<div class="page-header">
		       <h3 class=" text-info">���Ż���ȸ</h3>
		       <h5 class="text-muted">���������Դϴ�.</h5>
		</div>
		
		<div class="row">
			<input type="hidden" name="tranNo" value="${purchase.tranNo}">
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
				<div class="col-xs-8 col-md-4"> ${(purchase.paymentOption =='1  ') ? "���ݱ���" : "�ſ뱸��"}  </div>
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
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
		</div>		
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
		</div>		
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info" id="update"> ����</button>
	  			<button type="button" class="btn btn-info" id="complete">Ȯ��</button>
	  		</div>
		</div>
</div>					
</body>
</html>