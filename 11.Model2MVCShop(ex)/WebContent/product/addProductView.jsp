<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">	
	<link href="/css/creative.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/javascript/bootstrap-imageupload.js"></script>
	<link href="/css/bootstrap-imageupload.css" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
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
			
			 var $imageupload = $('.imageupload');
			    $imageupload.imageupload();
			
			    $('#imageupload-disable').on('click', function() {
			        $imageupload.imageupload('disable');
			        $(this).blur();
			    })
			
			    $('#imageupload-enable').on('click', function() {
			        $imageupload.imageupload('enable');
			        $(this).blur();
			    })
			
			    $('#imageupload-reset').on('click', function() {
			        $imageupload.imageupload('reset');
			        $(this).blur();
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
<jsp:include page="/layout/toolbar.jsp" /> 
		<div class="container">		
			<h2 class="text-center">��ǰ���</h2><br>			
			<form class="form-horizontal" enctype="multipart/form-data">
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
		    				<div class="imageupload panel panel-default">  
		    					<div class="file-tab panel-body" align="center">         
		    						<label class="btn btn-primary btn-file pull-right">       
		    							<span>Browse</span>       
		     				 			<input type="file" class="form-control" id="fileName" name="file" placeholder="�̹������" >
		     				 		</label>
		     				 		<button type="button" class="btn btn-primary pull-right">Remove</button><br/>                   
		     				 	</div>
		     				 </div>
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