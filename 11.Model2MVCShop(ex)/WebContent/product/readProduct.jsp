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
			$( ".btn.btn-info:contains('이전')" ).on("click" , function() {
				self.location = "/product/updateProduct?prodNo=${product.prodNo}";
			});
			
			$( ".btn.btn-info:contains('구매')" ).on("click" , function() {
				//Debug..
				alert(  $( "td.ct_btn01:contains('구매')" ).html() );
				self.location = "/purchase/addPurchase?prodNo=${product.prodNo}";
			});
		});
				
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
<div class="container">
	<div class="page-header">
		<h3 class=" text-info">상품상세조회</h3>
		<h5 class="text-muted">수정한 상품정보입니다</h5>
	</div>
			
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>	
	<hr/>
		
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>	
	<hr/>
		
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
		<div class="col-xs-8 col-md-4">${product.fileName}</div>
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
		<div class="col-xs-4 col-md-2"><strong>상품등록일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>	
	<hr/>
			
	<div class="row">
		<div class="col-md-12 text-center ">
			<button type="button" class="btn btn-info" id="purchase"> 구매</button>
			<button type="button" class="btn btn-info" id="back">이전</button>
		</div>
	</div>
	<br/>	
</div>
</body>
</html>