<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.*" %>
<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<title>후기게시판 | Pat Me Come</title>
	<style>
		.detail{text-align:center; width: 800px;}
		.detail th{width: 50px; padding: 10px; border: 1px solid white;}
		.detail td{width: 100px; padding: 10px; border: 1px solid white;}
		#titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
		/* #contentArea{height:30px;} */
		.detailImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
		#titleImg{width:500px; height:300px;}
		.detailImg{width:500px; height:300px;}
		.downBtn{background: #D1B2FF;}
		#thumbTable{margin: auto;}
	</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="page-title" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
		<h1>후기게시판</h1>
	</div>

	<section id="contact-page">
		<div class="container"> 
			<form action="<%= request.getContextPath() %>/ThumbnailUpdateForm.th" id="detailForm" method="post">
			<div class="row contact-wrap"> 
				<div class="status alert alert-success" style="display: none"></div>
				<input type="hidden" name="bId" value="<%= b.getBoardId() %>">
				<table class="detail" id="thumbTable">
					<tr>
						<th width="50px">제목</th>
						<td colspan="5">
							<%= b.getBoardTitle() %>
							<input type="hidden" name="title" value="<%= b.getBoardTitle() %>">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= b.getWriter() %></td>
						<th>조회수</th>
						<td><%= b.getViews() %></td>
						<th>작성일</th>
						<td><%= b.getModifyDate() %></td>
					</tr>
					<tr>
						<td colspan="6">
							<div id="titldImgArea" align="center">
								<a href="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getChangeName()%>"
									download="<%= fileList.get(0).getChangeName() %>">
									<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getChangeName()%>">
								</a>
								<input type="hidden" name="titleImg" value="<%= fileList.get(0).getChangeName() %>">
							</div><br>
							<% for(int i = 1; i < fileList.size(); i++){ %>
								<div class="detailImgArea">
									<a href="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName()%>"
										download="<%= fileList.get(i).getChangeName() %>">
										<img id="detailImg" class="detailImg"
											src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>">
									</a>
								</div><br>
							<% } %>
							<p id="contentArea">
								<%= b.getBoardContent() %>
								<input type="hidden" name="content" value="<%= b.getBoardContent() %>">
							</p>
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="right">
					<% if(b.getWriter().equals(loginUser.getMemberId()) && loginUser != null){  %>
				
						<input class="btn btn-primary" style="width: 100px" type="button" onclick="deleteThumbnail();" id="deleteBtn" value="삭제">
					<% } %>
						<input class="btn btn-primary" style="width: 100px" type="button" onclick="location.href='<%= request.getContextPath() %>/list.th'" id="menuBtn" value="메뉴로">
				</div>
            </div>
            </form>
        </div>
    </section>
    <script>
		function deleteThumbnail(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<%= request.getContextPath() %>/delete.th?bId=" + <%= b.getBoardId() %>;
			}
		}
	</script>
	
	<%@ include file="../common/bottom_footer.jsp" %>
</body>
</html>