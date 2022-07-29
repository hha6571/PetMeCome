<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<title>후기게시판 | Pat Me Come</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
		<h1 style="text-shadow: 2px 2px 1px #e0e0e0;">후기게시판</h1>
	</div>

	<section id="contact-page">
		<div class="container">
			<div class="large-title text-center">        
                <h2>글쓰기</h2>
				<p>여러분의 이야기를 들려주세요</p>
			</div> 
			<div class="row contact-wrap"> 
				<div class="status alert alert-success" style="display: none"></div>
				<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="<%= request.getContextPath() %>/insert.th" encType="multipart/form-data">
                    <div> <!-- class="col-sm-6" -->
                        <div class="form-group">
                            <label>제목 *</label>
                            <input type="text" name="title" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>내용 *</label>
                            <textarea name="content" id="content" required="required" class="form-control" rows="8"></textarea>
                        </div>
                        <div class="form-group">
                            <label>파일 첨부</label>
                            <div id="fileArea">
								<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="LoadImg(this,1)" style="width: 200px; height: 25px">
								<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="LoadImg(this,2)" style="width: 200px; height: 25px">
								<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="LoadImg(this,3)" style="width: 200px; height: 25px">
								<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="LoadImg(this,4)" style="width: 200px; height: 25px">
							</div>
                        </div>   
                        <div class="form-group" align="center">
                            <input type="submit" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="insertBtn" value="작성완료">
                            <input type="button" class="btn btn-primary btn-lg" required="required" style="width: 100px" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.th'" value="취소하기">
                        </div>
                    </div>
                </form>
                
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
	
	
</body>
</html>