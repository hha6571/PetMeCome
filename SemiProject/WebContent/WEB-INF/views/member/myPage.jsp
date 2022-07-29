<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
    	Member member = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
 <title>마이페이지 | Pet Me Come</title> 
</head>
<style>
 	.myPageBtns > input{width: 150px; height : 30px; color: #404040; border-radius: 5px; border:none; margin-bottom: 10px;}
 	#goMain{width: 150px; height : 30px; background-color: #7ABBF3; color: #fff; border-radius: 5px; border:none;
 			display: block;} 
 	.select{padding: 15px 10px; text-align: center;}
 	.select input[type=checkbox]{display:none;}
 	.select input[type=checkbox]+label{display : inline-block; cursor : pointer; height: 50px; width:200px;
 									line-height: 20px; text-align: center; font-weight: bold; font-size: 18px;}
 	.select input[type=checkbox]:checked+label { border-bottom: 3px solid #7ABBF3;}
</style>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<br>
	<h2>내 정보 보기</h2>
	<br>
	<div class="select">
	<input type="checkbox" id="userInfoPage" name="userInfo" checked="checked"><label for="userInfo">내 정보</label>
	<input type="checkbox" id="userBoard" name="userBoard" onclick="location.href='<%= request.getContextPath() %>/userPostForm.pm'"><label for="userBoard">작성글</label>
	<input type="checkbox" id="userReply" name="userReply"  onclick="location.href='<%= request.getContextPath() %>/userReplyForm.pm'"><label for="userReply">작성댓글</label>
	</div>
	<form action="<%= request.getContextPath() %>/updateUserForm.pm" method="post" id="myForm" name="myForm">
		<table> 
		<tr>
			<td><label>아이디</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black" type="text" maxlength="30" name="myId" value="<%=member.getMemberId() %>" readonly></td>
		</tr>
		<tr>
			<td><label>이름</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black" type="text" maxlength="15" name="myName" value="<%= member.getMemberName()%>" readonly></td>
		</tr>
		<tr>
			<td><label>이메일</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black" type="email" maxlength="15" name="myEmail" value="<%= member.getEmail()%>" readonly></td>
		</tr>
		<tr>
		<tr>
			<td><label>전화번호</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black" type="text" maxlength="13" name="myPhone" value="<%=member.getPhone() == null ? " " :member.getPhone()%>" readonly></td>
		</tr>
		<tr>
			<td><label>주소</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black" type="text" maxlength="100" name="myAddress" value="<%=member.getAddress() == null ? " " : member.getAddress()%>" readonly ></td>
		</tr>
		</table>
		<div class="myPageBtns" align="center">
				<input id="updateBtn" type="submit" value="수정하기" >
				<input id="updatePwdBtn" type="button" value="비밀번호 변경 하기" onclick="location.href='updatePwdForm.pm'">
				<input id="deleteBtn" type="button" value="탈퇴하기" onclick="deleteMember();">
				<input type="button" id="goMain" onclick="location.href='<%= request.getContextPath()%>'" value="메인으로">
			</div>
		</form>
	<script>
		function deleteMember(){
			var bool = confirm('정말 탈퇴하시겠습니까?');
			
			if(bool){
				location.href = '<%= request.getContextPath() %>/delete.me';

			}
		}
		
	</script>
</body>
</html>