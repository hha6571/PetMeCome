<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, board.model.vo.*"%>
<%
	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET ME COME</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	 
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>pet me come</title>

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/icomoon.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    
    

  <style>
     .img-responsive{width:100px; height:100px; border-radius: 50%;}
     .img-responsive:hover{cursor: pointer;}
    .media-heading{ font-size: 18px; font-weight: bold;}
     table th{background-color : #e5dcd6;}
     table ,th, tr, td{
     border : 1px solid black;
     border-collapse : separate;}
     
 .loginBtns > input{width: 100px; height : 30px; color: #404040; border-radius: 5px; border:none;}
     
     


     
 </style>

</head>
<body class="homepage">
	<%@ include file="../common/menubar.jsp" %>
   
   
	
    <div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1>신청 게시판</h1>
    </div>
    
    <section id="services" class="service-item">
        <div class="container">
            <div class="center fadeInDown">
                <h2>관련 사항</h2>
                <p class="lead">유기 동물들과 관련된 활동을 신청할 수 있습니다.</p>
            </div>

            <div class="row">

                <div class="col-sm-6 col-md-4" >
               
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                       <a onclick ="location.href='<%= request.getContextPath() %>/boardAdopt.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829809.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">입양 신청</h3>
                            <p>유기 동물들의 소중한 가족이 되어 주세요.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                            <a id = "care" onclick ="location.href='<%= request.getContextPath() %>/boardCare.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829708.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">임시보호 신청</h3>
                            <p>유기 동물들이 소중한 가족을 만나기 전에 사랑으로 보살펴 주세요.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                            <a id = "vol" onclick ="location.href='<%= request.getContextPath() %>/boardVol.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829673.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">봉사활동 신청</h3>
                            <p>유기 동물들이 보호소에서 행복하게 지낼수 있도록 도와주세요.</p>
                        </div>
                    </div>
                </div>

                    

            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#services-->


    <section id="testimonial1">
        <div class="container">
            <div class="center fadeInDown">
                <h2>입양 신청</h2>
                <p class="lead">유기 동물들의 소중한 가족이 되어 주세요.</p>
            </div>
            </div>
           
     <div class="container mt-3">
    	  <div align="right">
       	Y(접수대기중) ->접수완료 -> 신청완료 / 신청거절
       </div>  
  <div class = table-round>   
  <table class="table" style="text-align: center">
      <tr>
        <th style="text-align: center; width: 100px">번호</th>
        <th style="text-align: center; width: 500px">제목</th>
        <th style="text-align: center; width: 80px">조회수</th>
        <th style="text-align: center; width: 150px">작성일</th>
        <th style="text-align: center; width: 150px">수정일</th>
        <th style="text-align: center">상태</th>
        <th style="text-align: center">작성자</th>
     </tr>
   	<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="7">조회된 리스트가 없습니다.</td>
				</tr>
				<% } else{ %>
					<% for(Board b : list){ %>
					<tr>
						<td><%= b.getBoardNo() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><%= b.getViews() %></td>
						<td><%= b.getCreateDate() %></td>
						<td><%= b.getModifyDate() %></td>
						<td><%= b.getStatus() %></td>
						<td><%= b.getWriter() %></td>
				 </tr>
					<%} %>
				<%} %>
    </table>
  </div>
  			<a onclick="location.href='<%= request.getContextPath() %>/adoptWriteBoardForm.bo'" class="btn btn-primary pull-right" 
  						style="background:#4895ef">입양신청</a>
               <div class="buttonArea" align="right"></div>
 </div>



        <!-- 페이징 -->
		<div class="pageingArea" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardAdopt.bo?currentPage=1'">&lt;&lt;</button>
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardAdopt.bo?currentPage=<%=pi.getCurrentPage()-1%>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= pi.getCurrentPage() %> <= 1){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>
			<!-- 숫자 페이지로 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			 	<% if(p == pi.getCurrentPage()){ %>
			 		<button id = "choosen" disabled><%= p %></button>
			 		<%}else{ %>
				<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/boardAdopt.bo?currentPage=<%=p %>'"><%=p %></button>
				<% } %>
			<% } %>
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardAdopt.bo?currentPage=<%=pi.getCurrentPage()+1%>'" id="aftereBtn">&gt;</button>
			<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
			
			
			<!-- 맨 마지막으로 -->
		    <button onclick="location.href='<%= request.getContextPath()%>/boardAdopt.bo?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
		</div>
		
    
        
    </section>
    
    <script>
		$(function(){
			$('.table td').mouseenter(function(){
				$(this).parent().css({'cursor' : 'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var bId = $(this).parent().children().eq(0).text();
				
				if('<%= loginUser %>' != 'null'){
				location.href = '<%= request.getContextPath() %>/detail.bo?bId=' + bId;
				} else{
					alert('회원만 이용할 수 있는 서비스입니다.')
				}
			});
		});
	</script>
    
    
    <!--/#bottom-->

   



    <%@ include file="../common/bottom_footer.jsp" %>
    
    
</body>
</html>