<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />	
	<link href="/css/bootstrap.min.css" rel="stylesheet">		
	<link href="/css/creative.css" rel="stylesheet" >				
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   	<style>
 		body {
            padding-top : 100px;
        }
     </style>   
	
	<script type="text/javascript">
	
		$(function() {
			$( ".btn.btn-info:contains('����')" ).on("click" , function() {
				self.location = "/product/updateProduct?prodNo=${product.prodNo}";
			});
			
			$( ".btn.btn-info:contains('����')" ).on("click" , function() {
				//Debug..
				alert(  $( "td.ct_btn01:contains('����')" ).html() );
				self.location = "/purchase/addPurchase?prodNo=${product.prodNo}";
			});
		});
				
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
<div class="container">
	<div class="page-header">
		<h3 class=" text-info">��ǰ����ȸ</h3>
		<h5 class="text-muted">������ ��ǰ�����Դϴ�</h5>
	</div>
			
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>	
	<hr/>
		
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>	
	<hr/>
		
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
		<div class="col-xs-8 col-md-4">${product.fileName}</div>
	</div>	
	<hr/>
		
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ ������</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>	
	<hr/>		
	
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ ��������</strong></div>
		<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>		
	<hr/>
			
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ����</strong></div>
		<div class="col-xs-8 col-md-4">${product.price}</div>
	</div>	
	<hr/>	
	
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>��ǰ�������</strong></div>
		<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>	
	<hr/>
			
	<div class="row">
		<div class="col-md-12 text-center ">
			<button type="button" class="btn btn-info" id="purchase"> ����</button>
			<button type="button" class="btn btn-info" id="back">����</button>
		</div>
	</div>
	<br/>	
</div>
</body>
</html>