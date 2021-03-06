<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/creative.min.css" rel="stylesheet">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style>
	  body {
            padding-top : 100px;
        }
    </style>
    
	<script type="text/javascript">
	
		function fncGetAllList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		$(function() {
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetAllList(1);
			});
		});
		
		$(function() {
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
			$( "td:nth-child(2)" ).css("color" , "red");
		});	
		
		 $(function() {
			$(  "td:nth-child(5) > i" ).on("click" , function() {
					var userId = $(this).next().val();
				
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

									var displayValue = "<h6>"
																+"아이디 : "+JSONData.user.userId+"<br/>"
																+"이  름 : "+JSONData.user.userName+"<br/>"
																+"이메일 : "+JSONData.user.email+"<br/>"
																+"ROLE : "+JSONData.user.role+"<br/>"
																+"등록일 : "+JSONData.user.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp" /> 
	<div class="container">
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
	    	</div>
		</div>
		
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
		            <th align="center">No</th>
		            <th align="left" >회원 ID</th>
		            <th align="left">회원명</th>
		            <th align="left">이메일</th>
		            <th align="left">간략정보</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="0" />
					<c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
						<tr>
							<td align="center">${ i }</td>
							<td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
							<td align="left">${user.userName}</td>
							<td align="left">${user.email}</td>
							<td align="left">
							<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
							<input type="hidden" value="${user.userId}">
							</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>