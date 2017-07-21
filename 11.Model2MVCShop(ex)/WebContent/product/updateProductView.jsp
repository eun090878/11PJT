<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
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
	
	function fncUpdateProduct(){
		
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
	
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
 		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.asdasd");
			return;
		} 
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}
		//��� �� ���� ó��
		$(function () {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});	
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateProduct();
			});
			
		});
		
		////// �޷� UI 
		$(function() {
			$( "#manuDate" ).datepicker(	{				
					dateFormat: "yy-mm-dd"
			});
		});
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<div class="page-header">
	       <h3 class=" text-info">��ǰ��������</h3>	       
	    </div>
	    
		<form class="form-horizontal">
			<input type="hidden" name="prodNo" value="${product.prodNo}"/>
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label ">�� ǰ ��</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
					</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
					</div>
			</div>
		 	 
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly >
					</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="price" name="price" value="${product.price}">
					</div>
			 </div>
			 
			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
					</div>
			</div>
		 	 
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
			</div>
		</div>
	</form>
</div>		 	 
</body>
</html>