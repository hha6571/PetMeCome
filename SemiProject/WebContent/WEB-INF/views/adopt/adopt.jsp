<%@page import="board.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, adopt.model.vo.*, member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Adopt> aList = (ArrayList<Adopt>)request.getAttribute("aList");
	ArrayList<Attachment> pList = (ArrayList<Attachment>)request.getAttribute("pList");
	AdoptPageInfo api = (AdoptPageInfo)request.getAttribute("api");

	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Pet Me Come | 입양 현황</title>

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/icomoon.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
<style>
	.borderTitle{font-size: 20px;}
	.tHead{background-color: #7ABBF3; text-align: center;}
	.tBody{height: 200px;}
	.insertAdopt{width: 130px; height: 100px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
 			margin-top: 20px; align-content: center; margin: auto; font-size: 20px;}
</style>
</head>
<!--/head-->
<%@ include file="../common/menubar.jsp" %>
<body class="homepage">
     <div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1>입양정보 게시판</h1>
    </div>
    
    <section id ="portfolio">
        <div class="container">
            <div class="center fadeInDown">
                <h2>아이들이 새로운 가족을 기다리고 있습니다!</h2>
            </div>
			<div class="row">
			<% if(aList.isEmpty() || pList.isEmpty()){ %>
        		<div class="nonedata" style="text-align: center;"> 
        			등록된 유기견 정보가 없습니다.
        		</div>
        	<% } else{ %>
        		<% for(int i=0; i<aList.size(); i++){ %>
        			<% Adopt a = aList.get(i); %>
            	<div class="gall_box col-sm-6 col-md-4 col-lg-3">
					<div class="gall_con">
						<div class="gall_img">
							<% Attachment p = pList.get(i); %>
							<% if(p.getFileLevel() == 1) { %>

							<a><img src="<%= request.getContextPath() %>/adopt_images/<%= p.getChangeName() %>"></a>
							<span hidden name="petId" id="petId"><%= a.getPetId() %></span>
						</div>
						<div class="gall_text_href">
							<a class="borderTitle"><%= a.getPetName() %></a>
						</div>
						<div class="petInfo">
			                     <span name="petStatus" id="petStatus" style="background-color: #7ABBF3; color: black; border-radius: 3px;">
								<%=a.getPetStatus() %>
			                     </span>
			                     <span>/</span>
			                     <span name="petKind" id="petKind"><%= a.getPetKind() %></span>
			                     <span>/</span>
			                     <span name="petAge" id="petAge"><%= a.getPetAge() %>살</span>
						</div>
					</div>
				</div>
											<% } %>
						<% } %>
				<% } %>
			</div>
			
					<br>
			    <% if( loginUser !=null) { %>
			    <input hidden id="showBtn" value="<%= loginUser.getManage() %>">
                <div class="addBtn" align="right">
               			<a href="<%= request.getContextPath() %>/insertForm.ad" class="insertAdopt">등록하기</a>
               	</div>
               			<% } %>
               		<br>
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.ad?currentPage=1'">&lt;&lt;</button>
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.ad?currentPage=<%= api.getCurrentPage()-1 %>'"id="beforeBtn">&lt;</button>
			<script>
				if(<%= api.getCurrentPage() %> <= 1){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>
			<!-- 숫자 페이지로 -->
			<% for(int p = api.getStartPage(); p<= api.getEndPage(); p++){ %>
				<%if(p== api.getCurrentPage()){ %>
					<button id="choosen" disabled><%=p %></button>
				<% }else { %>
				<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/list.ad?currentPage=<%=p %>'"><%=p %></button> 
			<%} %>
			<%} %>
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.ad?currentPage=<%=api.getCurrentPage() + 1 %>'"id="afterBtn">&gt;</button>
			<script>
				if(<%= api.getCurrentPage()%> >= <%= api.getMaxPage()%>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
			<!-- 맨 뒤로 -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.ad?currentPage=<%=api.getMaxPage()%>'">&gt;&gt;</button>
		</div>
        </div>
     </section>   
        <br>
		<%@ include file="../common/bottom_footer.jsp" %>
		<script>
							$(function(){ 
 								$('.gall_img').mouseenter(function(){
									$(this).css({'cursor' : 'pointer'});
 								}).mouseout(function(){
									$(this).parent().css('background','none');
								}).click(function(){
									var petId = $(this).children().eq(1).text();
									location.href = "<%= request.getContextPath() %>/adoptInfo.ad?petId=" + petId;
								});
 								
 								
 								var userManage = $('#showBtn').val();
 								 if(userManage == 'Y'){
 									$('.addBtn').show();
 								 }else {
 									$('.addBtn').hide();
 								 }
							});
							</script>
</body>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>