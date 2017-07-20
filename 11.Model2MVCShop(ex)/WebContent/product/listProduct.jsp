<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
		
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="/css/bootstrap.min.css" rel="stylesheet">	
	<link href="/css/creative.css" rel="stylesheet" >					
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
	<style>
		body {
			padding-top : 150px;
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
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
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
							var displayValue = "<h3>"
									+ "상품번호 : " + JSONData.product.prodNo + "<br/>"
									+ "상품명 : " + JSONData.product.prodName + "<br/>"
									+ "상품상세정보 : " + JSONData.product.prodDetail + "<br/>"
									+ "제조일자 : " + JSONData.product.manuDate + "<br/>"
									+ "가격 : " + JSONData.product.price + "<br/>"
									+ "등록일자 : " + JSONData.product.regDate + "<br/>"
									+ "</h3>"
							/* alert("diplayValue"); */
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
									<td align="left"  title="Click : 상품정보 확인">
										<c:if test="${product.proTranCode.trim() == '0' }">
											<span no="${product.prodNo}" menu="${param.menu}">
												${product.prodName}</td>
											</span>
										</c:if>
									  
										<c:if test="${product.proTranCode.trim() != '0' }">
											${product.prodName}</td>									  
										</c:if>
										<td align="left">${product.price}</td>
										<td align="left">${product.regDate}</td>
										<td align="left"> <!-- 5 -->
											<c:if test="${param.menu =='search' }">
												<c:choose>
										  			<c:when test="${product.proTranCode.trim() == '0' }">
										  				판매중<br/>
									  				</c:when>
													<c:otherwise>
									  					재고없음<br/>
									  				</c:otherwise>
									  			</c:choose>
											</c:if>
									  	
											<c:if test="${param.menu=='manage'}">
												<c:choose>
													<c:when test="${product.proTranCode.trim()=='0' }">
														판매중<br/>
													</c:when>
												
													<c:when test="${product.proTranCode.trim()=='1' }">
														구매완료
														<span noval="${product.prodNo }" codeval="${product.proTranCode }">
															배송하기
														</span>
													</c:when>
												
													<c:when test="${product.proTranCode.trim()=='2' }">
														배송중<br/>
													</c:when>
													<c:when test="${product.proTranCode.trim()=='3' }">
														배송완료<br/>
													</c:when>
												</c:choose>
											</c:if>									  	
										</td>
										<td align="left"> <!-- 6 -->
											<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
											<input type="hidden" value="${product.prodNo}">
										</td>
									</tr>
						</c:forEach>		        
				</tbody>      
			</table>
			<jsp:include page="../common/pageNavigator_new.jsp"/>
	</div>
</div>
</body>
</html>
