<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />	
	<link href="/css/creative.css" rel="stylesheet" >				
	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	 <link href="/css/animate.min.css" rel="stylesheet">
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
			<!-- Bootstrap Dropdown Hover CSS -->
	   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">	   
	    <!-- Bootstrap Dropdown Hover JS -->
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

<body >
 <jsp:include page="/layout/toolbar.jsp" /> 
	<!-- <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
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
		</nav> -->
		
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
		
		
		<%-- 
		

<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품상세조회</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품이미지 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
					<img src = "/images/uploadFiles/${product.fileName}" width="250"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.manuDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<a href="/purchase/addPurchase?prodNo=${product.prodNo}">구매</a>
					구매
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- 	<a href="javascript:history.go(-1)">이전</a> -->
					이전
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>
</form>
 --%>
</body>
</html>