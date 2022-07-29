<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="adopt.model.vo.*, board.model.vo.*, java.util.ArrayList, member.model.vo.*"%>
<%
	Adopt a = (Adopt)request.getAttribute("adopt");
	Attachment p = (Attachment)request.getAttribute("p");
	
	String gender = a.getPetGender();
	if(gender.equals("M")) {
		gender = "남자";
	} else {
		gender = "여자";
	}
	
	String neutral = a.getNeutral();
	if(neutral.equals("Y")) {
		neutral = "완료";
	} else {
		neutral = "미완료";
	}
	
	String inoculated = a.getInoculated();
	if(inoculated.equals("Y")) {
		inoculated = "완료";
	} else {
		inoculated = "미완료";
	}
	
	String status = a.getPetStatus();
	switch(status){
	case "A": status = "입양대기"; break;
	case "B": status = "입양완료"; break;
	case "C": status = "임시보호대기"; break;
	case "D": status = "임시보호중"; break;
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pet Me Come | 입양 현황 - 상세보기</title>
<style>
	.adoptDetail{ width: 500px;  margin: auto;}
	#petImg {
		width: 500px;
		height: 500px;
		margin-right: auto;
		margin-left: auto;
		margin-bottom: 20px;
		display:block; 
	}
	
	.table_category {
		background-color: #7ABBF3;
		color: black;
		font-size: 18px;
		font-weight: 1000;
		width: 160px;
		padding: 15px;
		height : 60px;
	}
	
	.dog_info {
		font-size: 16px;
		width: 500px;
		padding: 5px;
		text-align: center;
	}
	
	#petTable{
		border-radius: 5px;
		margin-bottom: 50px;
	}
	.listBtn{
	background:#7ABBF3;
	margin: auto;
	display: block;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	text-align: center;
	color : #FFF;
	margin-bottom: 30px;
	padding-top: 5px;
	}
	
	.updatePet{ 
	background:#7ABBF3; color : #FFF; width: 80px;
	height: 30px; border-radius: 5px; }
	.deletePet{
	background:#7ABBF3; color : #FFF; width: 80px; text-align : center;
	height: 30px; border-radius: 5px;}
	.deletePet:hover
	{cursor: pointer;}
	.adoptInfoBtn{
		margin-right: 380px;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
     <div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1>입양정보 게시판</h1>
    </div>
		<form action="<%= request.getContextPath() %>/updateForm.ad"  method="post">
               		<div class="adoptInfoBtn" align="right">
               					<% if(loginUser.getManage().equals("Y")) { %>
               					<input class="updatePet" type="submit" id="updateBtn" value="수정">
           						<input type="hidden" name="petId" id="petId" value="<%= a.getPetId() %>">
               					<input class="deletePet" onclick="deleteBoard();" value="삭제">
               					<% } %>
               		</div>
            <div class="adoptDetail">
               	<img id="petImg" src="<%= request.getContextPath() %>/adopt_images/<%= p.getChangeName() %>" alt="">
            </div>
               		<table id="petTable" border="1" boder-collapse="collapse" align="center">
               			<tr>
               				<td name="status" hidden><%= p.getStatus() %></td>
               				<td class="table_category">이름</td>
               				<td class="dog_info" ><%= a.getPetName() %>
               				<input type="hidden" class="petInput" name="petName" value="<%= a.getPetName() %>"></td>
               			</tr>
               			<tr>
               				<td class="table_category">나이</td>
               				<td class="dog_info" ><%= a.getPetAge() %>
               				<input type="hidden" class="petInput" name="petAge" value="<%= a.getPetAge() %>">살</td>
               			</tr>
               			<tr>
               				<td class="table_category">성별</td>
               				<td class="dog_info"><%= gender %>
               				<input type="hidden" class="petInput" name="petGender" value="<%= a.getPetGender() %>"></td>
               			</tr>
               			<tr>
               				<td class="table_category">견종</td>
               				<td class="dog_info"><%= a.getPetKind() %>
               				<input type="hidden" class="petInput" name="petKind" value="<%= a.getPetKind() %>"></td>
               			</tr>
               			<tr>
               				<td class="table_category">중성화</td>
               				<td class="dog_info"><%= neutral %>
               				<input type="hidden" class="petInput" name="neutral" value="<%= a.getNeutral() %>"></td>
               			</tr>
               			<tr>
               				<td class="table_category">예방접종</td>
               				<td class="dog_info"><%= inoculated %>
               				<input type="hidden" class="petInput" name="inoculated" value="<%= a.getInoculated() %>"></td>
               			</tr>
               			<tr>
               				<td class="table_category">입양상태</td>
               				<td class="dog_info"><%= status %>
               				<input type="hidden" class="petInput" name="petStatus" value="<%= a.getPetStatus() %>"></td>
               			</tr>
               		</table>
               		</form>
               		<a href="<%= request.getContextPath() %>/list.ad" class="listBtn">목록으로</a>
               			<script>
               			function deleteBoard(){
               				if(confirm('해당 게시글을 삭제하시겠습니까?')){
               					location.href="<%= request.getContextPath() %>/delete.ad?petId=" + <%= a.getPetId() %>;
               				}
               			}
               			</script>
        
	<%@ include file="../common/bottom_footer.jsp" %>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>