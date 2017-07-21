<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/creative.min.css" rel="stylesheet">
		
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
	<script type="text/javascript">	
	
		function fncGetAllList(currentPage){
		//	document.getElementById("currentPage").value = currentPage;
		//   	document.detailForm.submit();	
		   	$('#currentPage').val(currentPage);
		   	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase?userId=${purchase.buyer.userId}").submit();
		}
			
		$(function() {
			
			//�������� Ȯ��
			/* $(".ct_list_pop td:nth-child(1) span").on("click", function() { */
				$("td:nth-child(7) > i").on("click", function() {
					var tranNo = $(this).attr('tranNo').trim();					
					alert($(this).attr('tranNo') + " :: tranNo");
					/* 	self.location="/purchase/getPurchase?tranNo=10185";			 */
					
					$.ajax( 
							{
								url : "/purchase/getJsonPurchase/"+tranNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {/* 
									alert("JSONData : \n"+JSONData);
									alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) ); */
									
									var displayValue = "<br/><h6>"
																+"���Ź�ȣ  : " +JSONData.purchase.tranNo+"<br/>"
																+"������ : "+JSONData.purchase.receiverName+"<br/>"
																+"�����ڿ���ó : "+JSONData.purchase.receiverPhone+"<br/>"
																+"�������ּ� : "+JSONData.purchase.dlvyAddr+"<br/>"
																+"�ֹ��� : "+JSONData.purchase.orderDate+"<br/>"
																+"</h6>";
									//Debug...									
									//alert(displayValue);
									$("h6").remove();
									$( "#"+tranNo+"" ).html(displayValue);
								}
					});
		$(function() {
			//�������� Ȯ��
			$(".ct_list_pop td:nth-child(1) span").on("click", function() {
				/* alert($(this).attr('tranNo') + " :: tranNo"); */
				self.location="/purchase/getPurchase?tranNo="+$(this).attr('tranNo');					
				});
			/* 	//������ Ȯ��
				$("td:nth-child(2) > span").on("click", function() {	
											
					var userId = $(this).attr('userId').trim();
					alert("userId �����̳� " + userId);		
					$.ajax( 
							{
								url : "/user/getJsonUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									alert("JSONData : \n"+JSONData);
									alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
									
									var displayValue = "<h6>"
																+"���̵� : "+JSONData.user.userId+"<br/>"
																+"��  �� : "+JSONData.user.userName+"<br/>"
																+"�̸��� : "+JSONData.user.email+"<br/>"
																+"ROLE : "+JSONData.user.role+"<br/>"
																+"����� : "+JSONData.user.regDate+"<br/>"
																+"</h6>";
									//Debug...									
									alert(displayValue);
									 
									$( "#"+i+"" ).html(displayValue);
								}
						});
				});  */
			//������ Ȯ��
			$(".ct_list_pop td:nth-child(3) span").on("click", function() {
//				alert($(this).attr('userId') + " :: userId");
//				self.location="/user/getUser?userId="+$(this).attr('userId');		
										
			var userId = $(this).attr('userId').trim();
			$.ajax( 
			{
				url : "/user/getJsonUser/"+userId ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					//Debug...
					//alert(status);
					//Debug...
					alert("JSONData : \n"+JSONData);
					alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
					
					var displayValue = "<h3>"
												+"���̵� : "+JSONData.user.userId+"<br/>"
												+"��  �� : "+JSONData.user.userName+"<br/>"
												+"�̸��� : "+JSONData.user.email+"<br/>"
												+"ROLE : "+JSONData.user.role+"<br/>"
												+"����� : "+JSONData.user.regDate+"<br/>"
												+"</h3>";
					//Debug...									
					//alert(displayValue);
					$("h3").remove();
					$( "#"+userId+"" ).html(displayValue);
				}
			});
		});
				
		$("td:nth-child(6) span").on("click", function() {
			alert($(this).attr('tranNo') + " :: userId" + $(this).attr('tranCode'));
			self.location="/purchase/updateTranCode?tranNo="+$(this).attr('tranNo') + "&tranCode=" + $(this).attr('tranCode');					
		});
				
	});
		$(".ct_list_pop td:nth-child(11) span").on("click", function() {
			alert($(this).attr('tranNo') + " :: userId" + $(this).attr('tranCode'));
			self.location="/purchase/updateTranCode?tranNo="+$(this).attr('tranNo') + "&tranCode=" + $(this).attr('tranCode');					
		});
	});
	</script>
</head>
<body >
<jsp:include page="/layout/toolbar.jsp" /> 	
<div class="container">
		
		<div class="row">	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <form class="form-inline" name="detailForm">		  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>				  
			</form>
	    	</div>

	    	 <table class="table table-hover table-striped" >
				<thead>
			          <tr>
				            <th align="center">No</th>
				            <th align="left" >ȸ��ID</th>
				            <th align="left">ȸ����</th>
				            <th align="left">��ȭ��ȣ</th>
				            <th align="left">�����Ȳ</th>
				           <th align="left">��������</th>
				            <th align="left">��������</th>
			          </tr>
		        </thead>
			 		        
		       <tbody>		
					<c:set var="i" value="0" />
						<c:forEach var="purchase" items="${list}">
							<c:set var="i" value="${ i+1 }" />
								<tr>
									 <td align="center">${ i }</td>									
									 <td align="left"> 
									 	<span userId=" ${purchase.buyer.userId}">
											 ${purchase.buyer.userId }
										</span>
									</td>
									 <td align="left">${purchase.receiverName}</td> 
									 <td align="left">${purchase.receiverPhone}</td> 
									 <td align="left"> 5
										<c:choose>
											<c:when test="${purchase.tranCode.trim()=='1'}">���� ���ſϷ� �����Դϴ�.</c:when>
											<c:when test="${purchase.tranCode.trim()=='2'}">���� ����� �����Դϴ�.</c:when>
											<c:when test="${purchase.tranCode.trim()=='3'}">���� ��ۿϷ� �����Դϴ�.</c:when>
										</c:choose>
									</td>
									<td align="left"> <!-- 6 -->
										<span tranNo="${purchase.tranNo}" tranCode="${purchase.tranCode}">
											<c:if test="${purchase.tranCode.trim()=='2' }">
												<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">���ǵ���</a><br/> --%>
												���ǵ���<br/>
											</c:if>
										</span>
									</td>									
					  				<td align="left"> <!--7 -->
					  					<i class="glyphicon glyphicon-ok" id= "${purchase.tranNo}" tranNo="${purchase.tranNo}"></i>
					  					<input type="hidden" value="${purchase.tranNo}">
					  				</td>
								</tr>
		          		</c:forEach>		        
		        </tbody>      
      		</table>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</div>
</body>
</html>