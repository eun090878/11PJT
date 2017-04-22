<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 목록조회</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link href="/css/creative.css" rel="stylesheet" >					
		<link rel="stylesheet" href="/css/admin.css" type="text/css">		
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<!-- Bootstrap Dropdown Hover CSS -->
	   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">	 
	    <link href="/css/animate.min.css" rel="stylesheet">
	     
	    <!-- Bootstrap Dropdown Hover JS -->
	   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<style>
		  body {
	            padding-top : 150px;
	        }
	    </style>
		
	<script type="text/javascript">	
	
			function fncGetAllList(currentPage){
			   	$('#currentPage').val(currentPage);
			  $('form').attr("method", "POST").attr("action", "/purchase/listPurchase?userId=${purchase.buyer.userId}").submit();
			   /* 	self.location="/purchase/listPurchase?userId=${purchase.buyer.userId}"; */
			}
			
			$(function() {
				
				//구매정보 확인
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
																	+"구매번호  : " +JSONData.purchase.tranNo+"<br/>"
																	+"구매자 : "+JSONData.purchase.receiverName+"<br/>"
																	+"구매자연락처 : "+JSONData.purchase.receiverPhone+"<br/>"
																	+"구매자주소 : "+JSONData.purchase.dlvyAddr+"<br/>"
																	+"주문일 : "+JSONData.purchase.orderDate+"<br/>"
																	+"</h6>";
										//Debug...									
										//alert(displayValue);
										$("h6").remove();
										$( "#"+tranNo+"" ).html(displayValue);
									}
							});
				});
				
			/* 	//고객정보 확인
				$("td:nth-child(2) > span").on("click", function() {	
											
					var userId = $(this).attr('userId').trim();
					alert("userId 무엇이냐 " + userId);		
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
																+"아이디 : "+JSONData.user.userId+"<br/>"
																+"이  름 : "+JSONData.user.userName+"<br/>"
																+"이메일 : "+JSONData.user.email+"<br/>"
																+"ROLE : "+JSONData.user.role+"<br/>"
																+"등록일 : "+JSONData.user.regDate+"<br/>"
																+"</h6>";
									//Debug...									
									alert(displayValue);
									 
									$( "#"+i+"" ).html(displayValue);
								}
						});
				});  */
				
				$("td:nth-child(6) span").on("click", function() {
					alert($(this).attr('tranNo') + " :: userId" + $(this).attr('tranCode'));
					self.location="/purchase/updateTranCode?tranNo="+$(this).attr('tranNo') + "&tranCode=" + $(this).attr('tranCode');					
				});
				
			})

	</script>
</head>

<body >
	<jsp:include page="/layout/toolbar.jsp" /> 	

<div class="container">
		
		<div class="row">	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <form class="form-inline" name="detailForm">		  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>				  
			</form>
	    	</div>

	    	 <table class="table table-hover table-striped" >
				<thead>
			          <tr>
				            <th align="center">No</th>
				            <th align="left" >회원ID</th>
				            <th align="left">회원명</th>
				            <th align="left">전화번호</th>
				            <th align="left">배송현황</th>
				           <th align="left">정보수정</th>
				            <th align="left">간략정보</th>
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
											<c:when test="${purchase.tranCode.trim()=='1'}">현재 구매완료 상태입니다.</c:when>
											<c:when test="${purchase.tranCode.trim()=='2'}">현재 배송중 상태입니다.</c:when>
											<c:when test="${purchase.tranCode.trim()=='3'}">현재 배송완료 상태입니다.</c:when>
										</c:choose>
									</td>
									<td align="left"> <!-- 6 -->
										<span tranNo="${purchase.tranNo}" tranCode="${purchase.tranCode}">
											<c:if test="${purchase.tranCode.trim()=='2' }">
												<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">물건도착</a><br/> --%>
												물건도착<br/>
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
			
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
		
	</div>



<%-- 




<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase?userId=${purchase.buyer.userId}" method="post"> 
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">
							<span tranNo="${purchase.tranNo}">
								<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"></a>
							${ i }
							</span>						
						</td>						
						<td></td>							
							<td align="left">
								<span userId="${purchase.buyer.userId }">
									<a href="/user/getUser?userId=${purchase.buyer.userId }"></a>
										${purchase.buyer.userId }
								</span>
							</td>
						<td></td>
						<td align="left">${purchase.receiverName}</td>
						<td></td>
						<td align="left">${purchase.receiverPhone}</td>
						<td></td>
						<td align="left">
							<c:choose>
								<c:when test="${purchase.tranCode.trim()=='1'}">현재 구매완료 상태입니다.</c:when>
								<c:when test="${purchase.tranCode.trim()=='2'}">현재 배송중 상태입니다.</c:when>
								<c:when test="${purchase.tranCode.trim()=='3'}">현재 배송완료 상태입니다.</c:when>
							</c:choose>
						</td>
						<td></td>
						<td align="left">
							<span tranNo="${purchase.tranNo}" tranCode="${purchase.tranCode}">
								<c:if test="${purchase.tranCode.trim()=='2' }"	>
									<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">물건도착</a><br/>
									물건도착<br/>
								</c:if>
							</span>
						</td>
					</tr>
					
					<tr>
							<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
							<td id="${user.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					</c:forEach>
			</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
				   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>	
					<jsp:include page="../common/pageNavigator.jsp"/>	
		</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>

</div> --%>

</body>
</html>