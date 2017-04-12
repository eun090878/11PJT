<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품구매</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link href="/css/creative.css" rel="stylesheet" >
	<link rel="stylesheet" href="/css/admin.css" type="text/css">				
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>			
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
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
/* 	 $(function() {
		 $('form').attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}");
		 
	 }) */
	
	</script>
</head>

<body>

		<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
                	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    	<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                	</button>
                	<a class="navbar-brand page-scroll" href="#page-top">Model 2 MVC Shop</a>
				</div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Menu</a>
                    </li>
                    <li>
                    	<a class="login"> Login </a>
                    </li>
                    <li>
                    	<a class="join">Join </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
   	
 	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">상품 구매 정보</h3>
		       <h5 class="text-muted">다음과 같이 구매가 되었습니다.</h5>
		</div>
		
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
			</div>	

			<hr/>

			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매자아이디</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
			</div>	 	 	
		
			<hr/>

			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
		  			<c:if test="${purchase.paymentOption == '1'}">
		  				<div class="col-xs-8 col-md-4">현금구매</div>
		  			</c:if>
		  			<c:if test="${purchase.paymentOption == '2'}" >
						<div class="col-xs-8 col-md-4">신용구매</div>
					</c:if>
			</div>	
			
			<hr/>

			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
			</div>	 	 	
		
			<hr/> 
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
			</div>	 	 	
		
			<hr/> 
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매자주소</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.dlvyAddr}</div>
			</div>	 	 	
		
			<hr/> 
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>구매자요청사항</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
			</div>	 	 	
		
			<hr/> 
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>배송희망일자</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
			</div>	 	 	
		
			<hr/> 
			
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info" id="complete"> 확인</button>
	  		</div>
		</div>
			
<%-- 
 <form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${purchase.tranNo}" method="post"> 
<form name="updatePurchase">
다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>		
		<c:if test="${purchase.paymentOption == '1'}">		
			현금구매	
		</c:if>
		<c:if test="${purchase.paymentOption == '2'}" >
			신용구매	
		</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<td>${purchase.dlvyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<td>${purchase.dlvyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.dlvyDate}</td>
		<td></td>
	</tr>
</table>
</form> --%>

</body>
</html>