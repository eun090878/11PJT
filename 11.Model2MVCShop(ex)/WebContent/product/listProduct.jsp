<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
		<title>��ǰ �����ȸ</title>
		
		<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
		//������ó��
 		function fncGetAllList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
		 }
 		
 		$(function() {
 			//�˻����
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
																			+ "��ǰ��ȣ : " + JSONData.product.prodNo + "<br/>"
																			+ "��ǰ�� : " + JSONData.product.prodName + "<br/>"
																			+ "��ǰ������ : " + JSONData.product.prodDetail + "<br/>"
																			+ "�������� : " + JSONData.product.manuDate + "<br/>"
																			+ "���� : " + JSONData.product.price + "<br/>"
																			+ "������� : " + JSONData.product.regDate + "<br/>"
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
									<!--   //// ��ǰ�� //// -->
									 <td align="left"  title="Click : ��ǰ���� Ȯ��">
									 	 <c:if test="${product.proTranCode.trim() == '0' }">
										  	<span no="${product.prodNo}" menu="${param.menu}">
										 		${product.prodName}</td>
										  </span>
									  </c:if>
									  
									  <c:if test="${product.proTranCode.trim() != '0' }">
									  		${product.prodName}</td>									  
									  </c:if>
									  <!-- ///// ��ǰ���� //// -->
									  <td align="left">${product.price}</td>
									  <!--  //// ��ǰ ������� //// -->
									  <td align="left">${product.regDate}</td>
									  
									<td align="left"> <!-- 5 -->
									  <c:if test="${param.menu =='search' }">
									  		<c:choose>
									  			<c:when test="${product.proTranCode.trim() == '0' }">
									  				�Ǹ���
									  			<br/>
									  			</c:when>
									  			<c:otherwise>
									  				������
									  			<br/>
									  			</c:otherwise>
									  		</c:choose>
									  	</c:if>
									  	
										<c:if test="${param.menu=='manage'}">
											<c:choose>
												<c:when test="${product.proTranCode.trim()=='0' }">
													�Ǹ���
													<br/>
												</c:when>
												
												<c:when test="${product.proTranCode.trim()=='1' }">
													���ſϷ�
													<span noval="${product.prodNo }" codeval="${product.proTranCode }">
													����ϱ�
													</span>
												</c:when>
												
												<c:when test="${product.proTranCode.trim()=='2' }">
													�����
													<br/>
													</c:when>
													<c:when test="${product.proTranCode.trim()=='3' }">
														��ۿϷ�
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
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				</c:if>
				<c:if test="${ param.menu == 'search' }" >
					<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
				</c:if>
				
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
<!-- �˻� �κ� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
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
						<a href="javascript:fncGetAllList('${resultPage.currentPage}');">�˻�</a>
						<!-- 	���������� 1���� ����. -->
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
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			��ǰ��<br/>
			<h7 >(id click:������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
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
							�Ǹ���
							<br/>
							</c:when>
							<c:otherwise>
								������
								<br/>
							</c:otherwise>
						</c:choose>
					</c:if>
				
						<c:if test="${param.menu=='manage'}">
							<c:choose>
								<c:when test="${product.proTranCode.trim()=='0' }">
									�Ǹ���
									<br/>
								</c:when>
								<c:when test="${product.proTranCode.trim()=='1' }">
									���ſϷ�
									<span noval="${product.prodNo }" codeval="${product.proTranCode }">
									����ϱ�
									</span>
								</c:when>
								<c:when test="${product.proTranCode.trim()=='2' }">
									�����
									<br/>
									</c:when>
									<c:when test="${product.proTranCode.trim()=='3' }">
										��ۿϷ�
										<br/>
									</c:when>
							</c:choose>
						</c:if>
				</td>
			
			<td></td>			
			</td>		
		</tr>			
		<tr>
				<!-- //////////////////////////// �߰� , ����� �κ� /////////////////////////////
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
<!--  ������ Navigator �� -->
</form>
</div> --%>
</body>
</html>
