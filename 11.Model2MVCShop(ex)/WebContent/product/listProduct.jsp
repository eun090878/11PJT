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
	
		//������ó��
		function fncGetAllList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
		}
		
		$(function() {
			//�˻����
	 		$( "button.btn.btn-default" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
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
									+ "��ǰ��ȣ : " + JSONData.product.prodNo + "<br/>"
									+ "��ǰ�� : " + JSONData.product.prodName + "<br/>"
									+ "��ǰ������ : " + JSONData.product.prodDetail + "<br/>"
									+ "�������� : " + JSONData.product.manuDate + "<br/>"
									+ "���� : " + JSONData.product.price + "<br/>"
									+ "������� : " + JSONData.product.regDate + "<br/>"
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
				��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
			</p>
		</div>
		    
		 <div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
				<div class="form-group">
					<select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				</div>
				  
				<div class="form-group">
					<label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				<button type="button" class="btn btn-default">�˻�</button>
				  
				<!-- PageNavigation ���� ������ ���� ������ �κ� -->
				<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>				  
			</form>
		</div>
	    	
		<table class="table table-hover table-striped" >
			<thead>
		         <tr>
		            <th align="center">No</th>
		            <th align="left" >��ǰ��</th>
		            <th align="left">����</th>
		            <th align="left">�����</th>
		            <th align="left">���� �� ��ۻ���</th>
		            <th align="left">��������</th>
		         </tr>
			</thead>
		        
			<tbody>		
				<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}">
						<c:set var="i" value="${ i+1 }" />
							<tr>
								<td align="center">${ i }</td>
									<td align="left"  title="Click : ��ǰ���� Ȯ��">
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
										  				�Ǹ���<br/>
									  				</c:when>
													<c:otherwise>
									  					������<br/>
									  				</c:otherwise>
									  			</c:choose>
											</c:if>
									  	
											<c:if test="${param.menu=='manage'}">
												<c:choose>
													<c:when test="${product.proTranCode.trim()=='0' }">
														�Ǹ���<br/>
													</c:when>
												
													<c:when test="${product.proTranCode.trim()=='1' }">
														���ſϷ�
														<span noval="${product.prodNo }" codeval="${product.proTranCode }">
															����ϱ�
														</span>
													</c:when>
												
													<c:when test="${product.proTranCode.trim()=='2' }">
														�����<br/>
													</c:when>
													<c:when test="${product.proTranCode.trim()=='3' }">
														��ۿϷ�<br/>
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
