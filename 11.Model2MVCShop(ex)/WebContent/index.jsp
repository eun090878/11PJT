<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MVC Shop</title>

    <!-- Bootstrap Core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/css/creative.min.css" rel="stylesheet">
     <link href="/css/animate.min.css" rel="stylesheet">
    
    		<!-- Bootstrap Dropdown Hover CSS -->
	   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">	   
	    <!-- Bootstrap Dropdown Hover JS -->
	   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]> -->
<!--         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->
  <!--   <![endif]--> 

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">
		
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$(".login").on("click" , function() {
			self.location = "/user/login"
		});
		$("#user").on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}"
		});
		
		$(".Indivisual").on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}"
		});
		
		$(".join").on("click" , function() {
			self.location = "/user/addUser"
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
	
<!--     <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            Brand and toggle get grouped for better mobile display
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Model 2 MVC Shop</a>
            </div>

            Collect the nav links, forms, and other content for toggling
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
					<li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#product">Product</a>
                    </li>
                      <li>
                        <a class="page-scroll" href="#purchase">Purchase</a>
                    </li>
                      <li>
                        <a class="page-scroll" href="#user" id="user">My info </a>
                    </li>
                    <li>
                    	<a class="login"> Login </a>
                    </li>
                    <li>
                    	<a class="join">Join </a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            /.navbar-collapse
        </div>
        /.container-fluid
    </nav> -->

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

<!--     <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-faded">Start Bootstrap has everything you need to get your new website up and running in no time! 
                    All of the templates and themes on Start Bootstrap are open source, free to download, and easy to use. No strings attached!</p>
                    <a href="#services" class="page-scroll btn btn-default btn-xl sr-button">Get Started!</a>
                </div>
            </div>
        </div>
    </section> -->

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
                       <!--  <p class="text-muted">개인정보조회 및 수정</p> -->
                       <!--  <p class="text-muted">Our templates are updated regularly so they don't break.</p> -->
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
                        <h3>Product</h3>
                        <!-- <p class="text-muted">상품검색, 등록 및 수정</p> -->
                        <!-- <p class="text-muted">You can use this theme as is, or you can make changes!</p> -->
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
                        <h3>Purchase</h3>
                        <!-- <p class="text-muted">We update dependencies to keep things fresh.</p> -->
                    </div>
                </div>
<!--                 <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
                        <h3>����援щℓ</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div> -->
            </div>
        </div>
    </section>
<!-- 
    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
                <div class="col-lg-4 col-sm-6">
                    <a href="/img/portfolio/fullsize/1.jpg" class="portfolio-box">
                    <a class="portfolio-box">
                        <img src="/img/portfolio/thumbnails/1.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                               		User
                                </div>
                                <div class="Indivisual">
                                    Indivisual
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box">
                        <img src="/img/portfolio/thumbnails/2.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                   User
                                </div>
                                <div class="listuser">
                                    Userlist
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                  <a href="/img/portfolio/fullsize/3.jpg" class="portfolio-box"> 
                        <img src="/img/portfolio/thumbnails/3.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Product
                                </div>
                                <div class="prodentroll">
                                    Product entroll
                                </div>
                            </div>
                        </div>
                     </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box">
                        <img src="/img/portfolio/thumbnails/4.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                  Product
                                </div>
                                <div class="productlist">
                                    ProductList
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="/img/portfolio/fullsize/5.jpg" class="portfolio-box">
                        <img src="/img/portfolio/thumbnails/5.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Purchase
                                </div>
                                <div class="purchase">
                                    Purchase
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box">
                        <img src="/img/portfolio/thumbnails/6.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                   Purchase
                                </div>
                                <div class="purchaselist">
                                    PurchaseList
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
 -->
<!--     <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="http://startbootstrap.com/template-overviews/creative/" class="btn btn-default btn-xl sr-button">Download Now!</a>
            </div>
        </div>
    </aside> -->

<!--     <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a></p>
                </div>
            </div>
        </div>
    </section> -->

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
