<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<title>상품구매정보</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link href="/css/creative.css" rel="stylesheet" >	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">				
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>			
	
	<script src="http://malsup.github.com/jquery.form.js"></script>			
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
      
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<style>
       body > div.container{
            margin-top: 100px;
        }
    </style>
	
	<script type="text/javascript">
		
	////// 달력 UI 
		$(function() {
			$( "#dlvyDate" ).datepicker({
					dateFormat: "yy-mm-dd"
			});
		});

		$(function() {
			$( ".btn.btn-info:contains('구매')").on("click", function() {
			/* 	self.location="/purchase/addPurchase"; */
				 $("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
			});	
			
			$( ".btn.btn-info:contains('취소')").on("click", function() {
				self.location="/purchase/listPurchase";
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
			<h2 class="bg-primary text-center">상품 등록</h2>			
			
			<form class="form-horizontal">
				<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" /> 
				<div class="form-group">
					<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
						</div>
				</div>
				
				<div class="form-group">
					<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" readonly>
						</div>
				</div>
			
				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" readonly>
						</div>
				</div>
					
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">상품제조일자</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly>
						</div>
				</div>
			
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="price" name="price" value="${product.price }" readonly>
						</div>
				</div>
							
				<div class="form-group">
					<label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">상품등록일자</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate }" readonly>
						</div>
				</div>

			   <input type="hidden" name="buyer.userId" value="${user.userId}" />
				<div class="form-group">
					<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
						</div>
				</div>
				
				<!-- ///////////////////  구 매 입 력 ////////////////////////// -->
				<div class="form-group" id="select_box">
					<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    			<div class="col-sm-4">
		    				<select id="paymentOption" name="paymentOption"  class="form-control">
		     				 	<option selected="selected" value="1">현금구매</option>
		     				 	<option value="2">신용구매</option>
		     				 </select>
						</div>
				</div>				

				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자명</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
						</div>
				</div>

				<div class="form-group">
					<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
						</div>
				</div>

				<div class="form-group">
					<label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${user.addr}">
						</div>
				</div>

				<div class="form-group">
					<label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매자요청사항</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest">
						</div>
				</div>
				
				<div class="form-group">
					<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly>
						</div>
				</div>

			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-info" id="purchase"> 구매</button>
		  			<button type="button" class="btn btn-info" id="back">취소</button>
		  		</div>
			</div>
		</form>
	</div>

<%-- 
<form name="addPurchase">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품구매</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="300" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01" width="299">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo }</td>
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
			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
		<td class="ct_write01">${product.regDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	

	<tr>
		<td width="104" class="ct_write">
			구매자아이디 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.userId}</td>
		<input type="hidden" name="buyer.userId" value="${user.userId}" />
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
<!-- 	listUser.jsp 참고!!!!!!!!!!!!!!! -->
	<tr>
		<td width="104" class="ct_write">구매방법</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2"					 >신용구매</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자이름</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="${user.userName}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자연락처</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" value="${user.phone}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="dlvyAddr" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" 	value="${user.addr}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매요청사항</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="dlvyRequest" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<input 	type="text" readonly="readonly" name="dlvyDate" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
			<img 	src="../images/ct_icon_date.gif" width="15" height="15"/>
			<!-- 			onclick="show_calendar('document.addPurchase.dlvyDate', document.addPurchase.dlvyDate.value)"/> -->
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:fncAddPurchase();"></a> -->
						구매
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)"></a> -->
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form> --%>

</body>
</html>