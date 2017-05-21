<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ///////////// 카카오 계정 연동 ////////////////// -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<!-- ////////////////////////////////////////////////// -->
	
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link href="/css/creative.css" rel="stylesheet" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
        body { 
           /* border: 3px solid #D6CDB7; */
            margin-top: 100px;
        }
         .col-md-6 {
           margin:0 auto;
            float: none;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	// 카카오계정 연동
	Kakao.init('84c5f6e23594b89cadfb9500086ba376');
	
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
        	
         alert("dd :: "+JSON.stringify(authObj));
         //access_token / token_type / refresh_token / expires_in / scope : account_email profile 출력
         
         var accessToken = Kakao.Auth.getAccessToken();
         Kakao.Auth.setAccessToken(accessToken);
	         test();
         
        },
        fail: function(err) {
          alert('error :: '+JSON.stringify(err));s
        }
      });
    };
	
    function test() {
    	Kakao.API.request({
   			url: '/v1/user/me',	
			success: function(res) {
				console.log(res);
				console.log(res.kaccount_email);
				console.log(res.properties.nickname);
				var userId = res.kaccount_email;
				var temp=userId.split(".");
				self.location="/user/addUser/"+temp;
				
			},
			fail: function(error) {
				console.log('err:; '+error);
			}
     });
    }
	///////////////////////////////

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<!-- 	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div> -->
   	 <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
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
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<!-- <div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div> -->
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<!-- <br/><br/> -->
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label"> I  D</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">Password</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary" > Login</button>
					      <a class="btn btn-primary btn" href="#" role="button">Join</a>
					    </div>
					  </div>
					  
				   <div class="form-group">
				    	<div class="col-sm-offset-4 col-sm-6 text-center">
					  		<a id="custom-login-btn" href="javascript:loginWithKakao()">
							<img src="/img/kakao_account_login_btn_medium_narrow_ov.png" width="180"/>							
							</a>
						</div>
					</div>
					
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>