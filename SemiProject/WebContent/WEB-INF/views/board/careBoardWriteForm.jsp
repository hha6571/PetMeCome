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
     #lastName2{width:500px; height: 200px; align:center; border-radius:5px;}
     #insertBtn{background:#4895ef;}
     #cancelBtn{background:#4895ef;}
          .img-responsive:hover{cursor: pointer;}
    .media-heading{ font-size: 18px; font-weight: bold;}
    label{font-size: 20px;}
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
                <h2 style = "font-size: 28px;">게시판 작성</h2>
				
			</div> 
			<div class="row contact-wrap"> 
				<div class="status alert alert-success" style="display: none"></div>
				<form id="main-contact-form" class="contact-form" name="contact-form"  action="<%= request.getContextPath() %>/careInsert.bo" method="post">
                    <div> <!-- class="col-sm-6" -->
                        <div class="form-group">
                            <label>제목 *</label>
                            <input type="text" name="title" class="form-control" required="required" placeholder="제목을 입력해주세요.(ex : 소형견 임시보호 신청합니다.)">
                        </div>
                        <div class="form-group">
                            <label>내용 *</label>
                            <textarea name="content" id="content" required="required" class="form-control" rows="8" placeholder="내용을 입력해주세요(나이, 양육경험, 보호가능 기간 등.)"></textarea>
                        </div>
                          
                        <div class="form-group" align="center">
                            <input type="submit" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="insertBtn" value="작성완료">
                            <input type="button" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/boardAdopt.bo'" value="취소하기">
                        </div>
                    </div>
                </form>
                
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
    
    <%@ include file="../common/bottom_footer.jsp" %>
</body>
</html>