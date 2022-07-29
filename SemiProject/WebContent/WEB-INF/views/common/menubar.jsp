<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    
    <%
    Member loginUser = (Member)session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title></title>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/icomoon.css" rel="stylesheet">
    <link href="css/signupForm.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <link rel="shortcut icon" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/p로고.png">
    <style>
    h2{text-align: center;}
	h3{text-align: center;}
	a{font-size: 15px;}
	input{width: 450px; height: 40px; border: 1px solid lightgray; border-radius: 5px; margin-bottom: 10px;}
	table{margin : auto; border: 0;}
	#login, #update{ width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white;
			margin-top: 20px; align-content: center; margin: auto;}
	.button, .button1{margin-top: 20px; text-align: center; }
	#back{ width: 100px; height : 30px; background: lightgray; border:none; border-radius: 5px; }
	#idCheck {width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white;}
	.must{color: red;}
	.loginBtns > input{width: 100px; height : 30px; color: #404040; border-radius: 5px; border:none;}
	.bold{font-size: 16px; font-style: bold;}
    .mainhome{cursor: pointer; font-size: 18px;}
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
                           
                             <% if(loginUser == null){ %> 
                            <form>
                            <div class="login" style="display:inline-block; margin-top:10px; cursor: pointer;">
                            	<ul>
                            		<li><a onclick="location.href='<%=request.getContextPath() %>/loginForm.pm'">로그인</a></li>
                            		<li><a onclick="location.href='<%=request.getContextPath() %>/signUpForm.pm'">회원가입</a></li>
                            	</ul>
                            </div>
                            </form>
 		<%} else{ %> 
		<div id="userInfo" align="right">
 		<label style="font-size:16px;"><%= loginUser.getMemberName() %>님의 방문을 환영합니다.</label>
		<br clear="all">
		<div class ="loginBtns">
			<input type ="button"  value="내 정보 보기" onclick="location.href='<%=request.getContextPath() %>/myPage.pm'">
			<input type ="button" value="로그아웃" onclick="location.href='<%=request.getContextPath() %>/logout.pm'">
		</div>
		</div>
 		<%} %> 
	</div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href=""><img src="images/ico/200.png" alt="logo" onclick="location.href='<%= request.getContextPath()%>'"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="mainhome"><a onclick="location.href='<%= request.getContextPath()%>'">Home</a></li>
                        <li class="dropdown">
                            <a class="mainhome" data-toggle="dropdown" onclick="location.href='<%= request.getContextPath()%>/list.ad'">입양정보</a>
                        </li>
                        <li class="dropdown">
                            <a class="mainhome" data-toggle="dropdown" onclick ="location.href='<%= request.getContextPath() %>/boardAdopt.bo'">신청게시판</a>
                        </li>
                        <li class="dropdown">
                            <a class="mainhome" data-toggle="dropdown" onclick="location.href='<%= request.getContextPath()%>/list.th'">후기게시판</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>