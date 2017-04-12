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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
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
			$( "#manuDate" ).datepicker(	 {
				
					dateFormat: "yy-mm-dd",
				   /*  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				    dayNamesMin: ['일','월','화','수','목','금','토']  */
			});
		});

	</script>
</head>

<body>

	 <jsp:include page="/layout/toolbar.jsp" />

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