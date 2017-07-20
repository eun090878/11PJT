<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.navbar-brand {
	color: #F05F40 !important;
}
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="password"] {
	height: 34px;
	border: 1px solid #ddd;
	font-size: 13px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>

 <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
			</button>
				<a class="navbar-brand page-scroll" href="/index.jsp">Model 2 MVC Shop</a>
		</div>

		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
			<ul class="nav navbar-nav">
			<c:if test="${sessionScope.user.role == 'admin'}">
				<li class="dropdown">
					<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<span >ȸ������</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">ȸ��������ȸ</a></li>
						<li class="divider"></li>
						<li><a href="#">etc...</a></li>
					</ul>
				</li>
				</c:if>
				 <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">�ǸŻ�ǰ���</a></li>
		                         <li><a href="#">�ǸŻ�ǰ����</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">etc..</a></li>
		                     </ul>
		                </li>
	                 </c:if>
					<li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��ǰ�˻�</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">�����̷���ȸ</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
				<c:if test="${ empty sessionScope.user.userId }">
					<li>
						<a href="#" data-toggle="modal" data-target="#squarespaceModal">�α���</a>
					</li>
				</c:if>
				<c:if test="${ not empty sessionScope.user.userId }">
					<li>
						<a class="page-scroll" id="getUser">My info</a>
					</li>
					<li>
						<a class="logout">�α׾ƿ�</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
<div class="container">
    	<div class="row">
			<div class="col-md-6">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">�α���</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">ȸ������</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="/user/login" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="userId" id="userId" tabindex="1" class="form-control" placeholder="���̵�" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="��й�ȣ">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="sign In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" style="display: none;">
									<div class="form-group">
										<input type="text" name="userId" id="registerUserId" tabindex="1" class="form-control" placeholder="���̵�" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="registerPassword" tabindex="2" class="form-control" placeholder="��й�ȣ">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="��й�ȣȮ��">
									</div>
									<div class="form-group">
										<input type="text" name="userName" id="userName" tabindex="1" class="form-control" placeholder="�̸�" value="">
									</div>
									<div class="form-group">
										<input type="text" name="ssn" id="ssn" tabindex="1" class="form-control" placeholder="�ֹι�ȣ" value="">
										<span id="helpBlock" class="help-block">
											<strong class="text-danger">" -  " ���� 13�ڸ��Է��ϼ���</strong>
										</span>
									</div>
									<div class="form-group">
										<input type="text" name="addr" id="addr" tabindex="1" class="form-control" placeholder="�ּ�" value="">
									</div>
									<div class="form-group">
											<div class="col-sm-3">
												<select class="form-control" name="phone1" id="phone1">
													<option value="010" >010</option>
													<option value="011" >011</option>
													<option value="016" >016</option>
													<option value="018" >018</option>
													<option value="019" >019</option>
												</select>
											</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="phone2" name="phone2" placeholder="��ȣ">
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="phone3" name="phone3" placeholder="��ȣ">
										</div>
										<input type="hidden" name="phone"  /><br><br>
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="�̸���" value="">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-login" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

   	<script type="text/javascript">
	
		 $(function() {
			 
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
			 
			$("a:contains('�ǸŻ�ǰ���')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/product/addProductView.jsp"
			}); 
		 	
			$("a:contains('�ǸŻ�ǰ����')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/product/listProduct?menu=manage"
			}); 
		 	
			$("a:contains('��ǰ�˻�')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/product/listProduct?menu=search"
			}); 

			$("a:contains('�����̷���ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/purchase/listPurchase"
			}); 
		 	
		 	$( "#getUser" ).on("click" , function() {
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		 	});
			 
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
			
		 	
		 });
		//�α���
		$( function() {
			
			$("#userId").focus();
			
			$("#login-submit").on("click" , function() {
				var id=$("#userId").val();
				var pw=$("#password").val();
				
				if(id == null || id.length <1) {
					alert('ID�� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				} 
				
				$("#login-form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});							
		});
		
		//ȸ������	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#register-submit" ).on("click" , function() {
				fncAddUser();
			});
		});	

		function fncAddUser() {
			
			var id=$("input[id='registerUserId']").val();
			var pw=$("input[id='registerPassword']").val();
			var pw_confirm=$("input[id='confirm-password']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if(!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}		
		///ȸ������
		
		
		 	$(function() {

		 	    $('#login-form-link').click(function(e) {
		 			$("#login-form").delay(100).fadeIn(100);
		 	 		$("#register-form").fadeOut(100);
		 			$('#register-form-link').removeClass('active');
		 			$(this).addClass('active');
		 			e.preventDefault();
		 		});
		 		$('#register-form-link').click(function(e) {
		 			$("#register-form").delay(100).fadeIn(100);
		 	 		$("#login-form").fadeOut(100);
		 			$('#login-form-link').removeClass('active');
		 			$(this).addClass('active');
		 			e.preventDefault();
		 		});
		 	});
		
	</script>  