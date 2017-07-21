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
				alert('구매자 이름을 반드시 입력해주세요!');
				return;
			}
			
			if(receiverPhone == null || receiverPhone.length<1) {
				alert('구매자 연락처를 반드시 입력해주세요!');
				return;
			}
			
			if(dlvyAddr == null || dlvyAddr.length<1) {
				alert('배송지 주소를 반드시 입력해주세요!');
				return;
			}
			
			$('form').attr("method", "POST"	).attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
		}
		
		$(function () {
			//취소 및 수정 처리
			$("#cancle").bind("click", function() {
				history.go(-1);
			});		
			$("#update").bind("click", function() {
				fncUpdatePurchase();
			});				
		});
		
		////// 달력 UI 
		$(function() {
			$( "#dlvyDate" ).datepicker({				
					dateFormat: "yy-mm-dd"
			});
			});	
			//배송희망일자 처리
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
	       <h3 class=" text-info">구매정보수정</h3>	       
	    </div>
	    
 		<form class="form-horizontal">
		    <input type="hidden" name="tranNo" value="${purhcase.tranNo}"/>
			
			<div class="form-group">
				<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label ">구매자아이디</label>
					 <div class="col-sm-4">
					 
						 <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId }">
			 		</div>
			</div>
			
			<div class="form-group">
		   		 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    		<div class="col-sm-4">
		    			<select id="paymentOption" name="paymentOption"  class="form-control">
		     				 	<option selected="selected" value="1">현금구매</option>
		     				 	<option value="2">신용구매</option>
		     			</select>
		   			 </div>
		 	 </div>
		 	 
				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" >
						</div>
				</div>

		 	<div class="form-group">
		   		 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone }">
		   			 </div>
		 	 </div>
		 	 
	 		<div class="form-group">
		   		 <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr }">
		   			 </div>
		 	 </div>
		 	 
		 	 		 	 
	 		<div class="form-group">
		   		 <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${purchase.dlvyRequest }">
		   			 </div>
		 	 </div>
		
			<div class="form-group">
		   		 <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly>
		   			 </div>
		 	 </div>
		
		  <div class="form-group">
		   	 <div class="col-sm-offset-4  col-sm-4 text-center">
		     	 <button type="button" class="btn btn-primary" id="update" >수 &nbsp;정</button>
		     	  <button type="button" class="btn btn-primary"  id="cancle">취 &nbsp;소</button><!-- 
			 		 <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a> -->
		   	 </div>
		  </div>
		</form>		 	 
	</div>
</body>
</html>