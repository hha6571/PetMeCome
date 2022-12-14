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
     
   	 
 	</style>
</head>
<body class="homepage">
	<%@ include file="../common/menubar.jsp" %>

    
	

     <div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1>?????? ?????????</h1>
    </div>
    
    <section id="services" class="service-item">
        <div class="container">
            <div class="center fadeInDown">
                <h2>?????? ??????</h2>
                <p class="lead">?????? ???????????? ????????? ????????? ????????? ??? ????????????.</p>
            </div>

            <div class="row">

                <div class="col-sm-6 col-md-4" >
               
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                       <a onclick ="location.href='<%= request.getContextPath() %>/boardAdopt.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829809.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">?????? ??????</h3>
                            <p>?????? ???????????? ????????? ????????? ?????? ?????????.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                            <a id = "care" onclick ="location.href='<%= request.getContextPath() %>/boardCare.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829708.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">???????????? ??????</h3>
                            <p>?????? ???????????? ????????? ????????? ????????? ?????? ???????????? ????????? ?????????.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap fadeInDown">
                        <div class="pull-left">
                            <a id = "vol" onclick ="location.href='<%= request.getContextPath() %>/boardVol.bo'"><img class="img-responsive" src="https://cdn-icons-png.flaticon.com/512/2829/2829673.png"></a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">???????????? ??????</h3>
                            <p>?????? ???????????? ??????????????? ???????????? ????????? ????????? ???????????????.</p>
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
                <h2>???????????? ??????</h2>
                <p class="lead">?????? ???????????? ??????????????? ???????????? ????????? ????????? ???????????????..</p>
            </div>
            </div>
           
     <div class="container mt-3">
    	  
    	  <div align="right">
       		Y(???????????????) ->???????????? -> ???????????? / ????????????
       	 </div>  
           
  <table class="table" style="text-align: center">
   
      <tr>
        <th style="text-align: center; width: 100px">??????</th>
        <th style="text-align: center; width: 500px">??????</th>
        <th style="text-align: center; width: 80px">?????????</th>
        <th style="text-align: center; width: 150px">?????????</th>
        <th style="text-align: center; width: 150px">?????????</th>
        <th style="text-align: center">??????</th>
        <th style="text-align: center">?????????</th>
      
      </tr>
   
   		<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="7">????????? ???????????? ????????????.</td>
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
  
  			<a onclick="location.href='<%= request.getContextPath() %>/volWriteBoardForm.bo'" class="btn btn-primary pull-right" style="background:#4895ef">???????????? ??????</a>
               <div class="buttonArea" align="right"></div>
</div>
 
         


        <!-- ????????? -->
		<div class="pageingArea" align="center">
			<!-- ??? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardVol.bo?currentPage=1'">&lt;&lt;</button>
			<!-- ?????? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardVol.bo?currentPage=<%=pi.getCurrentPage()-1%>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= pi.getCurrentPage() %> <= 1){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>
			<!-- ?????? ???????????? -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			 	<% if(p == pi.getCurrentPage()){ %>
			 		<button id = "choosen" disabled><%= p %></button>
			 		<%}else{ %>
				<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/boardVol.bo?currentPage=<%=p %>'"><%=p %></button>
				<% } %>
			<% } %>
			<!-- ?????? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath()%>/boardVol.bo?currentPage=<%=pi.getCurrentPage()+1%>'" id="aftereBtn">&gt;</button>
			<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
					$('#afterBtn').prop('disabled', true);
				}
			</script>
			
			
			<!-- ??? ??????????????? -->
		    <button onclick="location.href='<%= request.getContextPath()%>/boardVol.bo?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
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
					alert('????????? ????????? ??? ?????? ??????????????????.')
				}
			});
		});
	</script>
    
    
     <%@ include file="../common/bottom_footer.jsp" %>
</body>
</html>