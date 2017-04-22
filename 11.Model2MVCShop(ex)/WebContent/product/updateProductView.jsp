<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>상품정보수정</title>

	<meta charset="EUC-KR">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="/css/creative.css" rel="stylesheet" >		

 	 <link href="/css/animate.min.css" rel="stylesheet"> 	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
   <!--  Bootstrap Dropdown Hover JS -->
	 <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
<!--  	<script src="http://malsup.github.com/jquery.form.js"></script> -->
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
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
 		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.asdasd");
			return;
		} 
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}
		//취소 및 수정 처리
		$(function () {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});	
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateProduct();
			});
			
		});
		
		////// 달력 UI 
		$(function() {
			$( "#manuDate" ).datepicker(	{				
					dateFormat: "yy-mm-dd"
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
		</nav>
 -->
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header">
	       <h3 class=" text-info">상품정보수정</h3>	       
	    </div>
	    
		    <form class="form-horizontal">
		    <input type="hidden" name="prodNo" value="${product.prodNo}"/>
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label ">상 품 명</label>
					 <div class="col-sm-4">
					 
						 <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
			 		</div>
			</div>
			
			<div class="form-group">
		   		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		   			 </div>
		 	 </div>
		 	 
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">상품제조일자</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly >
						</div>
				</div>

		 	<div class="form-group">
		   		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="price" name="price" value="${product.price}">
		   			 </div>
		 	 </div>
		 	 
	 		<div class="form-group">
		   		 <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    		<div class="col-sm-4">
		    		  <input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
		   			 </div>
		 	 </div>
		 	 
		  <div class="form-group">
		   	 <div class="col-sm-offset-4  col-sm-4 text-center">
		     	 <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			 		 <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		   	 </div>
		   	 
		  </div>
		</form>		 	 
	
	</div>

</body>
</html>