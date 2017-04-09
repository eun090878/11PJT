<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
		<title>상품등록</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<link href="/css/creative.css" rel="stylesheet" >
					
		 <link rel="stylesheet" href="/css/admin.css" type="text/css">		
		
<!-- 		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		  <link rel="stylesheet" href="/resources/demos/style.css">
		 -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<sctipt src="http://malsup.github.com/jquery.form.js"></sctipt>		
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/overcast/jquery-ui.css">
  	<!-- 	<link rel="stylesheet" href="/resources/demos/style.css"> -->
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
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
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
			/////////////////////////////////////////////////////////////////////////////////////////
		
/* 				$(function() {
					$("img[src='../images/ct_icon_date.gif']").on("click",function(){
					    show_calendar('document.detailForm.manuDate', $("img[src='../images/ct_icon_date.gif']").val());
					 });
				}); */
		/* 	
			$("img[src='../images/ct_icon_date.gif']").on("click",function(){
		// ->img태그중 src속성값이 ../image어쩌구 인놈을 select 
			
		// ->click이벤트를 받아들임 
			
					show_calendar('document.detailForm.manuDate', $("img[src='../images/ct_icon_date.gif']").val());
			 }); */
		//->show_calendar라고 정의된 javascript를 불러서 그게 요구하는 대상과 대상의 값을 전달 */
			//////////////////////////////////////////////////////////////////////////////////////////
						
			$(function() {
				 $( "button.btn.btn-info" ).on("click" , function() {
			
						$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
				});
							
					$("a[href='#']").on("click", function() {
						$("form")[0].reset();
					});
			});	
			
			////// 달력 UI 
			$(function() {
				$( "#manuDate" ).datepicker({
						dateFormat: "yy-mm-dd",
					   /*  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					    dayNamesMin: ['일','월','화','수','목','금','토']  */
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
			<h2 class="bg-primary text-center">상품 등록</h2>			
			<form class="form-horizontal">
				<div class="form-group">
					<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명 입력" >
		       					<span id="helpBlock" class="help-block">	</span>
						</div>
				</div>
				
				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="prodDetail" name="prodDetail" >
						</div>
				</div>
				
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">상품제조일자</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자" readonly>
						</div>
				</div>
				
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="price" name="price" placeholder="상품가격">
						</div>
				</div>

				<!-- /////////////  상품이미지등록  ////////////////////// -->
				<div class="form-group">
					<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    			<div class="col-sm-4">
		     				 <input type="text" class="form-control" id="fileName" name="fileName" placeholder="이미지등록" >
						</div>
				</div>				
				
				<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-info"  >등록</button>
						 <a class="btn btn-info btn" href="#" role="button">취소</a> 
				</div>
			</div>
		</form>	
	</div>
   	
<!-- 
 <form name="detailForm" >
<form name="detailForm" enctype="multipart/form-data" > 

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품등록</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="prodName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="manuDate" readonly="readonly" class="ct_input_g"  
						style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
				&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" />
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10">&nbsp;원
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
 			<input		type="text" name="fileName" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
					<input		type="file" name="fileName" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13" onClick="javasc"/>  
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<a href="javascript:fncAddProduct();">등록</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					<a href="javascript:resetData();">취소</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</form> -->
</body>
</html>