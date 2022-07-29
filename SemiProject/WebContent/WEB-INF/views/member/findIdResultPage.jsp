<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%
    	String findId = (String)request.getAttribute("findId");
    %>
<!DOCTYPE html>
<html>
<head>
 <title> 아이디 찾기 | Pet Me Come</title> 
</head>
<style>
 	h4{text-align: center;} 
 	#login{ width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
 			margin-top: 20px; align-content: center; margin: auto;} 
 	#back{ width: 100px; height : 30px; background: lightgray; border:none; border-radius: 5px;} 
 	.button{margin-top: 20px; text-align: center;} 
 	.userId{font-size: 18px;}
 	.findId {border: 3px solid #7ABBF3; width:300px; margin: auto;}
</style>
<%@ include file ="../common/menubar.jsp"%>
<hr>
	<div class="outline">
	<br>
	<br>
	<br>
	<h2>아이디 찾기</h2>
	<br>
	<div id=findId style="border:3px solid #DBE1F3; width:300px; margin: auto; padding: 80px;">
	<%if (findId != null){ %>

		<h4 class="userId">회원님의 아이디는 </h4>

		<h4 class="userId" ><label style="font-style:bold;"> &nbsp;<%=findId%>&nbsp;</label>입니다. </h4>
		<%}else{ %>
 		<h4>  등록된 정보가 없습니다 </h4>  
		<%} %>
		</div>
			<div class="button">
				<input type="submit" id="login" value="로그인" onclick="location.href='<%=request.getContextPath() %>/loginForm.pm'">
				<input type="button" id="back"  value="메인으로"  onclick="location.href='<%= request.getContextPath()%>'">
			</div>
			<br>
	</div>
</body>
</html>