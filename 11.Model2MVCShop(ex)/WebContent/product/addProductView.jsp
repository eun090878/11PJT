<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
		<title>��ǰ���</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<link href="/css/creative.css" rel="stylesheet" >
					
		 <link rel="stylesheet" href="/css/admin.css" type="text/css">		

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="http://malsup.github.com/jquery.form.js"></script>		
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
  		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
		<style>
	       body > div.container{
	        	/* border: 3px solid #D6CDB7; */
	            margin-top: 100px;
	        }
  		</style>
  		
	<script type="text/javascript">
		
		function fncAddProduct(){
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
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}		
		}
		
			function fileUpload() {
				$('detailForm').ajaxForm({			
					url : "/product/addProduct",
					enctype : "multipart/form-data",
					success : function(result) {
						alert(result);
					}			
				});
				$("#detailForm").submit();
			}
							
			$(function() {
				 $( "button.btn.btn-info" ).on("click" , function() {
			
						$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
				});
							
					$("a[href='#']").on("click", function() {
						$("form")[0].reset();
					});
			});	
			
			////// �޷� UI 
			$(function() {
				$( "#manuDate" ).datepicker({
						dateFormat: "yy-mm-dd"
				});
			});

		</script>
</head>

<body>
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
		
		
		<div class="container">		
			<h2 class="bg-primary text-center">��ǰ ���</h2>			
			<form class="form-horizontal">
				<div class="form-group">
					<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ�� �Է�" >
		       					<span id="helpBlock" class="help-block">	</span>
						</div>
				</div>
				
				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodDetail" name="prodDetail" >
						</div>
				</div>
				
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������" readonly>
						</div>
				</div>
				
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="price" name="price" placeholder="��ǰ����">
						</div>
				</div>

				<!-- /////////////  ��ǰ�̹������  ////////////////////// -->
				<div class="form-group">
					<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="fileName" name="fileName" placeholder="�̹������" >
						</div>
				</div>				
				
				<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-info"  >���</button>
						 <a class="btn btn-info btn" href="#" role="button">���</a> 
				</div>
			</div>
		</form>	
	</div>
   	
</body>
</html>