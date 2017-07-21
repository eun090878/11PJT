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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
			//���������� ó��
			$("img[src='../images/ct_icon_date.gif']").on("click",function(){
			    show_calendar('document.updatePurchase.dlvyDate', $("img[src='../images/ct_icon_date.gif']").val());
			 });
		});

	</script>
</head>
<body >
<jsp:include page="/layout/toolbar.jsp" />
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
</body>
</html>