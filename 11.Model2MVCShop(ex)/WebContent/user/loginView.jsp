<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/creative.css" rel="stylesheet" >
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<style>
		body { 
		    margin-top: 100px;
		    background-color:#f5f5f5;
		}
		 .col-md-6 {
		   margin:0 auto;
		    float: none;
		}
		        
		.form-signin
		{
		    max-width: 330px;
		    padding: 15px;
		    margin: 0 auto;
		}
		.form-signin .form-control
		{
		    position: relative;
		    font-size: 16px;
		    height: auto;
		    padding: 10px;
		    -webkit-box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    box-sizing: border-box;
		}
		.form-signin .form-control:focus
		{
		    z-index: 2;
		}
		.form-signin input[type="text"]
		{
		    margin-bottom: 7px;
		    border-bottom-left-radius: 0;
		    border-bottom-right-radius: 0;
		}
		.form-signin input[type="password"]
		{
		    margin-bottom: 10px;
		    border-top-left-radius: 0;
		    border-top-right-radius: 0;
		}
		.account-wall
		{
		    margin-top: 80px;
		    padding: 40px 0px 20px 0px;
		 /*      background-color: #ffffff;
			box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.16); */
		}
		.login-title
		{
		    color: #555;
		    font-size: 22px;
		    font-weight: 400;
		    display: block;
		}
		.profile-img
		{
		    width: 96px;
		    height: 96px;
		    margin: 0 auto 10px;
		    display: block;
		    -moz-border-radius: 50%;
		    -webkit-border-radius: 50%;
		    border-radius: 50%;
		}
		.select-img
		{
			border-radius: 50%;
		    display: block;
		    height: 75px;
		    margin: 0 30px 10px;
		    width: 75px;
		    -moz-border-radius: 50%;
		    -webkit-border-radius: 50%;
		    border-radius: 50%;
		}
		.select-name
		{
		    display: block;
		    margin: 30px 10px 10px;
		}
		
		.logo-img
		{
		    width: 96px;
		    height: 96px;
		    margin: 0 auto 10px;
		    display: block;
		    -moz-border-radius: 50%;
		    -webkit-border-radius: 50%;
		    border-radius: 50%;
		}
    </style>
    
	<script type="text/javascript">
	
		$( function() {
			$("#loginId").focus();
			
			$(".btn-primary.btn-block").on("click" , function() {
				var id=$("#loginId").val();
				var pw=$("#loginPassword").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#loginId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#loginPassword").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
	</script>		
	
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <div id="my-tab-content" class="tab-content">
					<div class="tab-pane active" id="login">
               			<form class="form-signin" >
               				<input type="text" class="form-control" name="userId" id="loginId"  placeholder="ID" value="">
               				<input type="password" class="form-control" name="password" id="loginPassword" placeholder="password" value="">
               				<button type="submit" class="btn btn-lg btn-primary btn-block" >sign in</button>
               			</form>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>