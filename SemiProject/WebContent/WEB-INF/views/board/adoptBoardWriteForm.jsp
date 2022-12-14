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
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
   
    <style>
     .img-responsive{width:100px; height:100px; border-radius: 50%;}
   	 #testimonial1{background: #edf2fb;}
   	 #testimonial3{background: #edf2fb;}
   	.img-responsive:hover{cursor: pointer;}
    .media-heading{ font-size: 18px; font-weight: bold;}
    label{font-size: 20px !important; color: #000;}
    </style>
</head>
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
	
	
	<section id="contact-page">
		<div class="container">
			<div class="large-title text-center">        
                <h2 style = "font-size: 28px;">????????? ??????</h2>
				
			</div> 
			<div class="row contact-wrap"> 
				<div class="status alert alert-success" style="display: none"></div>
				<form id="main-contact-form" class="contact-form" name="contact-form" method="post"  action="<%= request.getContextPath() %>/insert.bo">
                    <div> <!-- class="col-sm-6" -->
                        <div class="form-group">
                            <label>?????? *</label>
                            <input type="text" name="title" class="form-control" required="required" placeholder="????????? ??????????????????.(ex : ?????? ?????? ????????????.)">
                        </div>
                        <div class="form-group">
                            <label>?????? *</label>
                            <textarea name="content" id="content" required="required" class="form-control" rows="8" placeholder="????????? ??????????????????(??????, ????????????, ???????????? ???.)"></textarea>
                        </div>
                          
                        <div class="form-group" align="center">
                            <input type="submit" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="insertBtn" value="????????????">
                            <input type="button" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/boardAdopt.bo'" value="????????????">
                        </div>
                    </div>
                </form>
                
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
</body>
</html>