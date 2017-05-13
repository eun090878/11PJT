<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>구매상세조회</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<link href="/css/creative.css" rel="stylesheet" >		
	<link href="/css/animate.min.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<style>
 		body {
            padding-top : 70px;
             color : white;
        }
     </style>
	     
	<script type="text/javascript">
	
		$(function() {
			
			$("#update").on("click", function() {
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}";			
			});
	
			 $( "#complete" ).on("click" , function() {
				history.go(-1);
			});
				
		});
	
	</script>

</head>

<body>
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
		       <h3 class=" text-info">구매상세조회</h3>
		       <h5 class="text-muted">구매정보입니다.</h5>
		</div>
		
		<div class="row">
			<input type="hidden" name="tranNo" value="${purchase.tranNo}">
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
				<div class="col-xs-8 col-md-4"> ${(purchase.paymentOption =='1  ') ? "현금구매" : "신용구매"}  </div>
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
	  		<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.dlvyRequest}</div>
		</div>		
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주문일</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.dlvyDate}</div>
		</div>		
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송희망일</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info" id="update"> 수정</button>
	  			<button type="button" class="btn btn-info" id="complete">확인</button>
	  		</div>
		</div>
					
<%-- 
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif"	width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매상세조회</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			물품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
					${purchase.purchaseProd.prodNo}</td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자아이디 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>

	<tr>
		<td width="104" class="ct_write">구매방법</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">		
			 ${(purchase.paymentOption =='1  ') ? "현금구매" : "신용구매"}   
			 ${purchase.paymentOption} 

			
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자이름</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자연락처</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.dlvyAddr}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매요청사항</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.dlvyRequest}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.dlvyDate}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>

	<tr>
		<td width="104" class="ct_write">주문일</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.orderDate}</td>
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
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<a href="/updatePurchaseView.do?tranNo=${purchase.tranNo}">수정</a>
						<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo}"></a>
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1);"></a> -->
						확인
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif"width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table> --%>

</body>
</html>