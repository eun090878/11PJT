<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MVC Shop</title>

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="/css/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/css/creative.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<script type="text/javascript">
		
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결

		$(".Indivisual").on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}"
		});
		
		$(".listuser").on("click" , function() {
			self.location = "/user/listUser"
		});
		
		$(".prodentroll").on("click" , function() {
			self.location = "/product/addProduct"
		});
		
		$(".productlist").on("click" , function() {
			self.location = "/product/listProduct?menu=manage"
		});
		
		$(".purchase").on("click" , function() {
			self.location = "/purchase/addPurchase"
		});
		
		$(".purchaselist").on("click" , function() {
			self.location = "/purchase/listPurchase"
		});
		
		
	});
	
	</script>
	
	<style >
	.bs-example-navbar-collapse-1 {		
           margin:0 auto;
            float: none;
	}
	</style>

</head>
<body >
<jsp:include page="/layout/toolbar.jsp" /> 
    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading">Model 2 MVC Shop</h1>
                <hr>
                <p>Welcome to My Shop!  Available after login</p>
                	<br/><br/>
<!--                 <p>Start Bootstrap can help you build better websites using the Bootstrap CSS framework! 
                Just download your template and start going, no strings attached!</p> -->
                <a href="#services" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
                
            </div>
        </div>
    </header>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Your Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
                        
                        <h3>User</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
                        <h3>Product</h3>
                        <p class="text-muted">You can use this theme as is, or you can make changes!</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
                        <h3>Purchase</h3>
                        <p class="text-muted">We update dependencies to keep things fresh.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!-- jQuery -->
    <script src="/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="/js/creative.min.js"></script>

</body>

</html>
