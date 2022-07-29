<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, review.model.vo.*"%>
<%
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
		
		
      .gall_img:hover, .bo_tit:hover {opacity:0.8; cursor:pointer; color: #75B5F1; text-decoration: none; outline: none;}
      .gall_con{margin: 5px;}
      .bo_tit{color: black;}
  
		
		
	</style>
</head>
<body class="homepage">
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="page-title" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1 style="color: #fff;">후기게시판</h1>
    </div>
    
    <section id="portfolio">
        <div class="container">
            <div class="center">
                <h2>입양/봉사 후 이야기</h2>
                <p class="lead">여러분의 이야기를 들려주세요</p>
            </div>

			<div id="bo_btn_top">
	        	<div id="bo_list_total">
	           		<span>Total <%= pi.getListCount() %> 건</span>
	         	 	<span><%= pi.getCurrentPage() %> 페이지</span>
	       		</div>
	  		</div>
			
			<div class="row">
				<% if(bList.isEmpty()){ %>
				등록된 사진이 없습니다.
				<% } else { %>
					<% for(int i = 0; i < bList.size(); i++){ %>
						<% Board b = bList.get(i); %>
						<div class="gall_box col-sm-8 col-md-6 col-lg-4">	
							<div class="gall_con" align="center">
								<div class="gall_img">
									<input type="hidden" value="<%= b.getBoardId() %>">
									<% for(int j = 0; j < fList.size(); j++){ %>
										<% Attachment a = fList.get(j); %>
										<% if(b.getBoardId() == a.getBoardId() && a.getFileLevel() == 0){ %>
											<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName() %>" width="400px" height="250px">
										<% } %>
									<% } %>
								</div>
								<p class="gall_text_href">
									<input type="hidden" name="bId" value="<%= b.getBoardId() %>">
									<a class="bo_tit"> <%= b.getBoardTitle() %> </a><br>
									<span class="sv_member"><%= b.getWriter() %> </span>
									<span class="gall_date"><i class="fa fa-clock-o" aria-hidden="true"></i><%= b.getCreateDate() %> </span>
									<span class="gall_view"><i class="fa fa-eye" aria-hidden="true"></i><%= b.getViews() %> </span><br><br>
								</p>
							</div>
						</div>
					<% } %>
				<% } %>
			</div>

			<br>
				<div class="row" align="right">
				<%-- <% if(loginUser != null){ %> --%>
					<a class="btn btn-primary" href="<%= request.getContextPath() %>/writeThumbForm.th">글쓰기</a>	
				<%-- <% } %> --%>
				</div>
			<br>
		</div>
		
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="pagination pagination-lg">
					<li>
						<a href="<%= request.getContextPath() %>/list.th?currentPage=<%= pi.getCurrentPage()-1 %>" id="beforeBtn"><i class="fa fa-long-arrow-left"></i></a>
						<script>
							if(<%= pi.getCurrentPage() %> <= 1){
								$('#beforeBtn').prop('disabled', true);
							}
						</script>
					</li>
					<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
						<li>
							<% if(p == pi.getCurrentPage()){ %>
								<a disabled><%= p %></a>
							<% } else{ %>
								<a href="<%= request.getContextPath() %>/list.th?currentPage=<%= p %>"><%= p %></a>
							<% } %>
						</li>
					<% } %>
					<li>
						<a href="<%= request.getContextPath() %>/list.th?currentPage=<%= pi.getCurrentPage()+1 %>" id="afterBtn"><i class="fa fa-long-arrow-right"></i></a>
						<script>
							if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
								$('#afterBtn').prop('disabled', true);
							}
						</script>
					</li>
				</ul>
				<!--/.pagination-->
			</div>
		</div>   
    </section>
    
    <script>
	    $(function() {
			$('.gall_con').click(function() {
				var bId = $(this).children().children().eq(0).val();
				location.href = "<%= request.getContextPath() %>/detail.th?bId="+bId;
			});
			
			
		});
	</script>
    
    <%@ include file="../common/bottom_footer.jsp" %>
</body>
</html>