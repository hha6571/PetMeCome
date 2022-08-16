<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList,
     board.model.vo.*"%>
<%
	
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Board b = (Board)request.getAttribute("board"); 
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   	 #testimonial1{background: #edf2fb;}
   	 #testimonial3{background: #edf2fb;}
   	 
   	 #lastName{width:500px; align:center; border-radius:5px;}
   	 #writer{width:80px; align:right; border-radius:5px; text-align: center;}
   	 #views{width:80px; align:right; border-radius:5px; text-align: center;}
   	 #createDate{width:100px; align:right; border-radius:5px; text-align: center;}
     #lastName2{width:500px; height: 200px; align:center; border-radius:5px;}
     #insertBtn{background:#4895ef;}
     #cancelBtn{background:#4895ef;}
     #puppy1{cursor: pointer;}
     #addReply{background: #B2CCFF;}
          .img-responsive:hover{cursor: pointer;}
    .media-heading{ font-size: 18px; font-weight: bold;}
    input{border: none !important;}
    textarea{border: none !important;}
    label{font-size: 22px !important; color: #000;}
    #content{font-size: 20px; padding: 15px; height: 500px; resize: none;}
    #title{font-size: 20px;}
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
    
    
    
    
	
	<section id="contact-page">
		<div class="container">
			<div class="large-title text-center">        
                <h2 style = "font-size: 28px;">게시판 상세보기</h2>
				
			</div> 
			<div class="row contact-wrap"> 
				<div class="status alert alert-success" style="display: none"></div>
				<form action="<%= request.getContextPath() %>/boardUpdateForm.bo" id="detailForm" method="post">
	                 <div> <!-- class="col-sm-6" -->
                        <div class="form-group">
                            <label style="display: inline;">제목 : </label>
                            <input type="text" name="title" id="title"class="form-control" required="required" value="<%= b.getBoardTitle() %>">
                        </div>
                        <div class="form-group">
                            <label>내용  :</label>
                            <textarea name="content" id="content" required="required" class="form-control" rows="8"><%= b.getBoardContent() %></textarea>
                       		<input type="hidden" name="bId" value="<%= b.getBoardNo() %>">
                        </div>
                        <div>
							작성자 : <input type="text" id ="writer" value = "<%= b.getWriter() %>">&emsp;
							조회수 : <input type="text" id ="views" value = "<%= b.getViews() %>">&emsp;
							작성일 : <input type="text" id ="createDate" value = "<%= b.getCreateDate() %>">
					   </div> 
                          
                        <div class="form-group" align="center">
                        	<% if(b.getWriter().equals(loginUser.getMemberId()) && loginUser != null){ %>
                            <input type="submit" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="insertBtn" value="수정">
                            <input type="button" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="cancelBtn" onclick="deleteBoard();" id="deleteBtn" value="삭제">  
                            <%} %>
                        </div>
                    </div>
                </form>
                
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
	
    
       
	
	
			
	
	
	
	<script>
		function deleteBoard(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<%= request.getContextPath() %>/delete.bo?bId=" + <%= b.getBoardNo() %>;
			}
		}
	</script>
	

   
      
    
    
    <%@ include file="../common/bottom_footer.jsp" %>
</body>
</html>