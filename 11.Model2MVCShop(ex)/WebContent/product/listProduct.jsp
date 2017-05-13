<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
		<title>상품 목록조회</title>
		
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<link href="/css/creative.css" rel="stylesheet" >				
		 <link href="/css/animate.min.css" rel="stylesheet">		
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<!-- Bootstrap Dropdown Hover CSS -->
	   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">	   
	    <!-- Bootstrap Dropdown Hover JS -->
	   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<style>
		  body {
	            padding-top : 150px;
	             color : white;
	        }
	    </style>
		
		<script type="text/javascript">
		
		//페이지처리
 		function fncGetAllList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
		 }
 		
 		$(function() {
 			//검색기능
	 		$( "button.btn.btn-default" ).on("click" , function() {
				fncGetAllList(1);
			});	 			 		
 			
			$( "td:nth-child(2) span" ).on("click" , function() {
				var prodNo = $(this).attr('no').trim();
				var menu = $(this).attr('menu').trim();
				 self.location ="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
				 
			});
						
 			
	 		$("td:nth-child(6) > i").on("click", function() {
					
					var prodNo = $(this).attr('no').trim();
					var menu = $(this).attr('menu').trim();
					
					if(menu=="manage") {
						self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu;						
					} else {
						$.ajax(
								{
									url : "/product/getJSONProduct/"+prodNo+"/"+menu,
									method : "GET",
									dataType : "json",
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData, status) {
										
										alert("status : "+ status);
										alert("JSONData : " + JSONData );
										alert("JSON.stringify(JSONData) : " + JSON.stringify(JSONData) );
										
										var displayValue = "<h3>"
																			+ "상품번호 : " + JSONData.product.prodNo + "<br/>"
																			+ "상품명 : " + JSONData.product.prodName + "<br/>"
																			+ "상품상세정보 : " + JSONData.product.prodDetail + "<br/>"
																			+ "제조일자 : " + JSONData.product.manuDate + "<br/>"
																			+ "가격 : " + JSONData.product.price + "<br/>"
																			+ "등록일자 : " + JSONData.product.regDate + "<br/>"
																			+ "</h3>"
										alert("diplayValue");
										$("h3").remove();
										$("#"+prodNo+"").html(displayValue);					
										
								}
		 					});
						}
	 		});
	 		
	 		$("td:nth-child(5) span").on("click", function() {	 			
	 				var prodNo = $(this).attr('noval').trim();
	 				var tranCode = $(this).attr('codeval').trim();
		 			self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode="+tranCode;		
	 		});
	 		
	 		$( " td:nth-child(2)" ).css("color" , "blue");
			$("h7").css("color" , "blue");
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	 		
 		});

	</script>
	
</head>

<body>

 		<jsp:include page="/layout/toolbar.jsp" /> 
	
	<div class="container">
		
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>				  
				</form>
	    	</div>
	    	
	    	 <table class="table table-hover table-striped" >
				<thead>
			          <tr>
				            <th align="center">No</th>
				            <th align="left" >상품명</th>
				            <th align="left">가격</th>
				            <th align="left">등록일</th>
				            <th align="left">구매 및 배송상태</th>
				            <th align="left">간략정보</th>
			          </tr>
		        </thead>
		        
		       <tbody>		
					<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${ i+1 }" />
								<tr>
									  <td align="center">${ i }</td>
									<!--   //// 상품명 //// -->
									 <td align="left"  title="Click : 상품정보 확인">
									 	 <c:if test="${product.proTranCode.trim() == '0' }">
										  	<span no="${product.prodNo}" menu="${param.menu}">
										 		${product.prodName}</td>
										  </span>
									  </c:if>
									  
									  <c:if test="${product.proTranCode.trim() != '0' }">
									  		${product.prodName}</td>									  
									  </c:if>
									  <!-- ///// 상품가격 //// -->
									  <td align="left">${product.price}</td>
									  <!--  //// 상품 등록일자 //// -->
									  <td align="left">${product.regDate}</td>
									  
									<td align="left"> <!-- 5 -->
									  <c:if test="${param.menu =='search' }">
									  		<c:choose>
									  			<c:when test="${product.proTranCode.trim() == '0' }">
									  				판매중
									  			<br/>
									  			</c:when>
									  			<c:otherwise>
									  				재고없음
									  			<br/>
									  			</c:otherwise>
									  		</c:choose>
									  	</c:if>
									  	
										<c:if test="${param.menu=='manage'}">
											<c:choose>
												<c:when test="${product.proTranCode.trim()=='0' }">
													판매중
													<br/>
												</c:when>
												
												<c:when test="${product.proTranCode.trim()=='1' }">
													구매완료
													<span noval="${product.prodNo }" codeval="${product.proTranCode }">
													배송하기
													</span>
												</c:when>
												
												<c:when test="${product.proTranCode.trim()=='2' }">
													배송중
													<br/>
													</c:when>
													<c:when test="${product.proTranCode.trim()=='3' }">
														배송완료
														<br/>
													</c:when>
											</c:choose>
										</c:if>									  	
									  </td>
										<%-- <td align="left">${product.prodTranCode}</td> --%>
										<td align="left"> <!-- 6 -->
											<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"  no="${product.prodNo}" menu="${param.menu}"></i>
							  				<input type="hidden" value="${product.prodNo}">
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

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<c:if test="${ param.menu == 'manage' }" >
					<td width="93%" class="ct_ttl01">상품 관리</td>
				</c:if>
				<c:if test="${ param.menu == 'search' }" >
					<td width="93%" class="ct_ttl01">상품 목록조회</td>
				</c:if>
				
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
<!-- 검색 부분 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
			<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
			class="ct_input_g" style="width:200px; height:19px" />
		</td>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetAllList('${resultPage.currentPage}');">검색</a>
						<!-- 	현재페이지 1부터 시작. -->
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			상품명<br/>
			<h7 >(id click:상세정보)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="center">				
				<c:if test="${product.proTranCode.trim() =='0'}">
					<span noval="${product.prodNo }" mval="${param.menu }">
							<a href=" /product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">	${product.prodName}</a></td>
						${product.prodName} </td>
					</span>
				</c:if>
				
				<c:if test="${product.proTranCode.trim() !='0'}">
					${product.prodName}</td>
				</c:if>

			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>			
			<td></td>
			<td align="left">
				
				<c:if test="${param.menu=='search'}">
					<c:choose>
						<c:when test="${product.proTranCode.trim()=='0'}">
							판매중
							<br/>
							</c:when>
							<c:otherwise>
								재고없음
								<br/>
							</c:otherwise>
						</c:choose>
					</c:if>
				
						<c:if test="${param.menu=='manage'}">
							<c:choose>
								<c:when test="${product.proTranCode.trim()=='0' }">
									판매중
									<br/>
								</c:when>
								<c:when test="${product.proTranCode.trim()=='1' }">
									구매완료
									<span noval="${product.prodNo }" codeval="${product.proTranCode }">
									배송하기
									</span>
								</c:when>
								<c:when test="${product.proTranCode.trim()=='2' }">
									배송중
									<br/>
									</c:when>
									<c:when test="${product.proTranCode.trim()=='3' }">
										배송완료
										<br/>
									</c:when>
							</c:choose>
						</c:if>
				</td>
			
			<td></td>			
			</td>		
		</tr>			
		<tr>
				<!-- //////////////////////////// 추가 , 변경된 부분 /////////////////////////////
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				////////////////////////////////////////////////////////////////////////////////////////////  -->
				<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
	</c:forEach>
</table>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=" ${resultPage.currentPage}"/>
				<jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div> --%>
</body>
</html>
