<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
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
     #adopt{cursor : pointer;}
     #care{cursor : pointer;}
     #vol{cursor : pointer;}
     
     
    </style>
    
</head>
<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="top-number">
                            <p><i class="fa fa-phone-square"></i>1544-9970</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/petmecome"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/icon/200.png" alt="logo"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="findIdPage.jsp">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">????????????<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="">????????????</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">???????????????<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="">????????????</a></li>
                                <li><a href="">??????????????????</a></li>
                                <li><a href="">??????????????????</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">???????????????<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="">????????????</a></li>
                                <li><a href="">????????????</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->

    </header>
    
    <div class="loginArea">
	<% if(loginUser == null){ %>
		<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post" onsubmit = "return validate()">
			<table id="loginTable">
				<tr>
					<td><label>ID</label></td>
					<td><input type="text" name="memberId" id="memberId"></td>
				</tr>
				<tr>
					<td><label>PWD</label></td>
					<td><input type="password" name="memberPwd" id="memberPwd"></td>
				</tr>
			</table>
			<div class="loginBtns">
				<input type="submit" value="?????????">
				<input type="button" value="????????????" onclick="location.href='<%= request.getContextPath() %>/signUpForm.me'">
			</div>
		</form>
		<%} else{ %>
		<div id = "userInfo" align = "right">
			<label><%= loginUser.getMemberName() %>?????? ????????? ???????????????.</label>
			<br clear = "all">
			<div class = "loginBtns">
				<input type ="button" value="??? ?????? ??????" onclick ="location.href='<%= request.getContextPath() %>/myPage.me'">
				<input type ="button" value="????????????" onclick="location.href='<%=request.getContextPath() %>/logout.me'">
			</div>
		</div>
		<%} %>
	</div>
	<br clear="all">
		
		
		
	

    <div class="page-title" style="background-image: url(images/mainpuppy.png)">
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
                       <a id = "adopt" onclick ="location.href='<%= request.getContextPath() %>/boardAdopt.bo'"><img class="img-responsive" src="images/services/puppy.png"></a>
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
                            <a id = "care" onclick ="location.href='<%= request.getContextPath() %>/boardCare.bo'"><img class="img-responsive" src="images/services/puppy2.png"></a>
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
                            <a id = "vol" onclick ="location.href='<%= request.getContextPath() %>/boardVol.bo'"><img class="img-responsive" src="images/services/puppy3.png"></a>
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

    
    
    


    
    <!--/#bottom-->

    <section id="bottom">
        <div class="container fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>PET ME COME</h3>
                        <ul>
                            <li><a href="#">????????????????????????</a></li>
                            <li><a href="#">????????????</a></li>
                            <li><a href="#">???????????? : ???????????? 11:00 ~ 20:00</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Address</h3>
                        <ul>
                            <li><a href="#">?????? ?????????</a></li>
                            <li><a href="#">?????? ?????????</a></li>
                            <li><a href="#">?????? ?????????</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Developers</h3>
                        <ul>
                            <li><a href="#">?????????</a></li>
                            <li><a href="#">?????????</a></li>
                            <li><a href="#">?????????</a></li>
                            <li><a href="#">?????????</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Our Partners</h3>
                        <ul>
                            <li><a href="#">??????????????????</a></li>
                            <li><a href="#">???????????????????????????</a></li>
                            <li><a href="#">??????24?????????????????????</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.col-md-3-->
            </div>
        </div>
    </section>
    <!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2022 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">PET ME COME</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->


    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>