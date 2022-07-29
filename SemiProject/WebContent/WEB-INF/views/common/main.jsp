<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home | Pet Me Come</title> 
</head>
<!--/head-->
<style>
.map{
	text-align : center;
	width: 1100px;}

table, tr,td{border: none;}

#td1{background-color: #E7F5FF;}

#table{float : center;
	background-color : white;
	color:black;
	font-size : 20px;
	margin: 20px;}

#bus{width:20px; height:20px;}

</style>
<%@ include file ="menubar.jsp"%>
    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbf38bB%2Fbtq9dvDDuSV%2FtSl21FLOpc9FaLYemzvxu1%2Fimg.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">아이들의 따뜻한<br>안식처 되어주기</h1>
                                    <a class="btn-slide animation animated-item-3" href="">입양신청</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--/.item-->

                <div class="item" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">아이들의<br>가정환경 적응돕기</h1>
                                    <div class="animation animated-item-2">
                                    </div>
                                    <a class="btn-slide white animation animated-item-3" href="#">임시보호신청</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.item-->
                
                <div class="item" style="background-image: url(images/slider/dog4.jpg)">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Pet me Come에서<br>아이들과 함께하기</h1>
                                    <div class="animation animated-item-2">
                                    </div>
                                    <a class="btn-slide white animation animated-item-3" href="#">봉사활동신청</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--/.carousel-inner-->
        </div>
        <!--/.carousel-->
        <a class="prev hidden-xs hidden-sm" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs hidden-sm" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section>
    <!--/#main-slider-->

    <section id="feature">
        <div class="container">
            <div class="center fadeInDown">
            	<img src="images/ico/title.png">
                <p class="lead">Pet Me Come은 개인이 운영하는 유기견 보호시설로써<br> 유기된 아이들에게 잠시나마 따뜻한 보금자리가 되어주고 있습니다.</p>
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                        <div class="introduce1">
                        	<img src="images/ico/행복환경.png">
                        </div>
                            <h2>행복한 환경 제공</h2>
                            <p>저희 Pet Me Come은 유기동물들을 크기·종류에 따라 분리하여 행복하게 자랄 수 있는 환경을 보장합니다.</p>
                        </div>
                    </div>
                    <!--/.col-md-3-->
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                        <div class="introduce">
                        	<img src="images/ico/입양심사.png">
                        </div>
                            <h2>철저한 입양심사</h2>
                            <p>아이들이 다시금 버러지지 않도록 철저한 입양심사를 통해 선별하여 입양을 보내고 있습니다.</p>
                        </div>
                    </div>
                    <!--/.col-md-3-->
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                       <div class="introduce">
                        	<img src="images/ico/의료지원.png">
                        </div>
                            <h2>신속한 의료지원</h2>
                            <p> 숙련된 의료진이 상시 대기하고 있는 동물병원과 협업하여 아이들의 건강 상태를 체계적으로 진단 및 체크하고 있습니다. </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                        <div class="introduce1">
                        	<img src="images/ico/교육환경.png">
                        </div>
                            <h2>믿음직한 교육환경</h2>
                            <p> 전문교육을 통해 반려동물관리 자격을 부여받은 반려동물관리사들이 아이들의 품종별 특성을 이해하고 예비 보호자분들과 건강한 유대관계가 형성될 수 있도록 돕고 있습니다.</p>
                        </div>
                    </div>
            </div>
            <!--/.row-->
            </div>
        <!--/.container-->
        </div>
    </section>
    <!--/#feature-->

    <section id="recent-works">
        <div class="container">
            <div class="center fadeInDown">
                <h2>입양을 기다리고 있는 아이들</h2>
                <p class="lead">가족을 기다리는 사랑스러운 아이들을 소개합니다</p>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/happy.jpg" alt="해피">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/happy.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/mingky.jpg" alt="밍키">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/mingky.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/ggoma.jpg" alt="꼬마">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/ggoma.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/toy.jpg" alt="토이">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/toy.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/happy1.jpg" alt="해피1">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/happy1.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="images/dogs/흰둥이.jpg" alt="흰둥이">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <a class="preview" href="images/dogs/흰둥이.jpg" rel="prettyPhoto"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
            <div class="clearfix text-center">
                <br>
                <br>
                <a href="adopt.html" class="btn btn-primary" style="font-size: 20px;">아이들 더 보러가기</a>
            </div>
        </div>
        <!--/.container-->
    </section>
    <!--/#recent-works-->

    <section id="services" class="service-item">
        <div class="container">
            <div class="center fadeInDown">
                <h2>Pet Me Come이 전해요</h2>
                <br>
                <br>
                <img class="dogimage" src="images/dogs/dog1.jpg">
                <p class="lead">한 해 발생하는 유기동물은 약 13만 마리입니다. 유기가 된 아이들은 새로운 보호자를 찾아가지 못하고 약  1/2의 아이들이 안락사에 처해지거나 질병으로 인하여 사망합니다. 저희 Pet Me Come은 유기동물의 발생을 줄이고 인식을 개선하여 더 행복하고 건강한 반려동물과의 사회를 위해 노력하고 있습니다. 버림받은 동물들에게 새로운 삶을 선물해주세요. 사지말고 입양하세요. <br> 저희 Pet Me Come은 발전된 반려동물 문화를 위해 노력하겠습니다. </p>
            </div>
        </div>
        <!--/.container-->
    </section>
    <!--/#services-->

    <section id="testimonial">
        <div class="container">
            <div class="center fadeInDown">
                <h2>찾아오시는 길</h2>
                <br><br>
                        <img class="map" src="images/map/map.png">
                        <table id="table">
                        	<tr>
                        		<td id="td1"width =300px;>주소</td>
                        		<td width= 800px;>서울특별시 강남구 테헤란로 14길 6</td>
                        	</tr>
                        	<tr>
                        		<td id="td1">버스</td>
                        		<td>역삼역.포스코P&S타워 정류장<br>
                        			<img id="bus" src="images/ico/bus.png"> 146, 740, 341, 360 <img id="bus"src="images/ico/bus1.png"> 1100, 1700, 2000, 7007, 8001
                        		</td>
                        	</tr>
                        	<tr>
                        		<td id="td1">지하철</td>
                        		<td>지하철 2호선 역삼역 3번 출구 100m</td>
                        	</tr>
                        </table>
                    </div>
                </div>
    </section>
    <%@ include file ="bottom_footer.jsp"%>
 
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>