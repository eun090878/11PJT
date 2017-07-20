<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">	
	<link href="/css/creative.css" rel="stylesheet" >					
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 100px;
        }
     </style>
     
	<script type="text/javascript">
	
		$( function() {
			$("#complete").bind("click", function() {
				self.location = "/product/listProduct?menu=manage";
				
			});
			
			$("#add").bind("click", function() {
				self.location = "../product/addProductView.jsp"
			});
		});
	
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
<div class="container">
	<div class="page-header">
		<h3 class=" text-info">상품정보조회</h3>
		<h5 class="text-muted">등록한 상품정보입니다</h5>
	</div>

	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>	
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품 상세정보</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>		
		<hr/>		
	
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품 제조일자</strong></div>
				<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품가격</strong></div>
				<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>	
		<hr/>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품 이미지</strong></div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>			
		<hr/>
		
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-info" id="complete"> 확인</button>
				<button type="button" class="btn btn-info" id="add">추가등록</button>
			</div>
		</div>
		<br/>	
	</div>
</body>
</html>
