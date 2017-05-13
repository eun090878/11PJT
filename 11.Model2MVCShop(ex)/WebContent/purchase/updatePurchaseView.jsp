<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>�������� ����</title>

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
   
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
   	<link rel="stylesheet" href="/resources/demos/style.css"> 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
   
	<style>
 		body {
            padding-top : 100px;
        }
     </style>

	<script type="text/javascript">

		function fncUpdatePurchase() {
			
			var receiverName = $("input[name='receiverName']").val();
			var receiverPhone = $("input[name='receiverPhone']").val();
			var dlvyAddr = $("input[name='dlvyAddr']").val();
			
			
			if( receiverName == null || receiverName.length<1) {
				alert('������ �̸��� �ݵ�� �Է����ּ���!');
				return;
			}
			
			if(receiverPhone == null || receiverPhone.length<1) {
				alert('������ ����ó�� �ݵ�� �Է����ּ���!');
				return;
			}
			
			if(dlvyAddr == null || dlvyAddr.length<1) {
				alert('����� �ּҸ� �ݵ�� �Է����ּ���!');
				return;
			}
			
			$('form').attr("method", "POST"	).attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
			
		}
		
		$(function () {
			//��� �� ���� ó��
			$("#cancle").bind("click", function() {
				history.go(-1);
			});		
			$("#update").bind("click", function() {
				fncUpdatePurchase();
			});				
		});
		
		////// �޷� UI 
		$(function() {
			$( "#dlvyDate" ).datepicker({				
					dateFormat: "yy-mm-dd"
			});
		});

	</script>
</head>

<body >
	 <jsp:include page="/layout/toolbar.jsp" />

	<<!-- nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
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
 -->
<div class="container">
		<div class="page-header">
	       <h3 class=" text-info">������������</h3>	       
	    </div>
	    
 <form class="form-horizontal">
		    <input type="hidden" name="tranNo" value="${purhcase.tranNo}"/>
			
			<div class="form-group">
				<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label ">�����ھ��̵�</label>
					 <div class="col-sm-4">
					 
						 <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId }">
			 		</div>
			</div>
			
			<div class="form-group">
		   		 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    		<div class="col-sm-4">
		    			<select id="paymentOption" name="paymentOption"  class="form-control">
		     				 	<option selected="selected" value="1">���ݱ���</option>
		     				 	<option value="2">�ſ뱸��</option>
		     			</select>
		   			 </div>
		 	 </div>
		 	 
				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" >
						</div>
				</div>

		 	<div class="form-group">
		   		 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone }">
		   			 </div>
		 	 </div>
		 	 
	 		<div class="form-group">
		   		 <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr }">
		   			 </div>
		 	 </div>
		 	 
		 	 		 	 
	 		<div class="form-group">
		   		 <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${purchase.dlvyRequest }">
		   			 </div>
		 	 </div>
		
			<div class="form-group">
		   		 <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly>
		   			 </div>
		 	 </div>
		
		  <div class="form-group">
		   	 <div class="col-sm-offset-4  col-sm-4 text-center">
		     	 <button type="button" class="btn btn-primary" id="update" >�� &nbsp;��</button>
		     	  <button type="button" class="btn btn-primary"  id="cancle">�� &nbsp;��</button><!-- 
			 		 <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a> -->
		   	 </div>
		   	 
		  </div>
		</form>		 	 
	
	</div>

<%-- 
 <form name="updatePurchase" method="post"	action="/purchase/updatePurchase?tranNo=${purchase.tranNo}"> 
<form name="updatePurchase">
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif"  width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">������������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ھ��̵�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId }</td>
		<input type="hidden" name="buyerId" value="${purchase.buyer.userId }">
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź��</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������̸�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverName" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverName }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ ����ó</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverPhone }" />
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="dlvyAddr" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.dlvyAddr }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���ſ�û����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="dlvyRequest" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.dlvyRequest }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<input type="text" readonly="readonly" name="dlvyDate" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	/>
							onclick="show_calendar('document.updatePurchase.dlvyDate', document.updatePurchase.dlvyDate.value)"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
					<!-- <input type="submit" value="����"/> -->
					����
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<a href="javascript:history.go(-1)">���</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
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