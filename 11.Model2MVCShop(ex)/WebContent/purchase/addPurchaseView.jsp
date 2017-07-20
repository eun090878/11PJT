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
	
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
       body > div.container{
            margin-top: 100px;
        }
    </style>
	
	<script type="text/javascript">
		
		////// �޷� UI 
		$(function() {
			$( "#dlvyDate" ).datepicker({
					dateFormat: "yy-mm-dd"
			});
		});

		$(function() {
			$( ".btn.btn-info:contains('����')").on("click", function() {
			/* 	self.location="/purchase/addPurchase"; */
				 $("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
			});	
			
			$( ".btn.btn-info:contains('���')").on("click", function() {
				self.location="/purchase/listPurchase";
			});
		});	

	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
	<div class="container">		
		<h2 class="bg-primary text-center">��ǰ ���</h2>			
			<form class="form-horizontal">
				<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" /> 
				
				<div class="form-group">
					<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
						</div>
				</div>
				
				<div class="form-group">
					<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" readonly>
						</div>
				</div>
			
				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" readonly>
						</div>
				</div>
					
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly>
						</div>
				</div>
			
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="price" name="price" value="${product.price }" readonly>
						</div>
				</div>
							
				<div class="form-group">
					<label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�������</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate }" readonly>
						</div>
				</div>

				<input type="hidden" name="buyer.userId" value="${user.userId}" />
				<div class="form-group">
					<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
						</div>
				</div>
				
				<!-- ///////////////////  �� �� �� �� ////////////////////////// -->
				<div class="form-group" id="select_box">
					<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    			<div class="col-sm-4">
		    				<select id="paymentOption" name="paymentOption"  class="form-control">
		     				 	<option selected="selected" value="1">���ݱ���</option>
		     				 	<option value="2">�ſ뱸��</option>
		     				 </select>
						</div>
				</div>				

				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�����ڸ�</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
						</div>
				</div>

				<div class="form-group">
					<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
						</div>
				</div>

				<div class="form-group">
					<label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${user.addr}">
						</div>
				</div>

				<div class="form-group">
					<label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ�û����</label>
		    			<div class="col-sm-4">
							<input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest">
						</div>
				</div>
				
				<div class="form-group">
					<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    			<div class="col-sm-4">
		     				<input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly>
						</div>
				</div>

				<div class="row">
		  			<div class="col-md-12 text-center ">
		  				<button type="button" class="btn btn-info" id="purchase"> ����</button>
		  				<button type="button" class="btn btn-info" id="back">���</button>
		  			</div>
				</div>
			</form>
	</div>
</body>
</html>