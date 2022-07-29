<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%
    	Member myInfo = (Member)request.getAttribute("myInfo");
    %>
<!DOCTYPE html>
<html>
<head>
 <title>내 정보 수정 | Pet Me Come</title> 
</head>
<style>
 	.myPageBtns > input{width: 150px; height : 30px; color: #404040; border-radius: 5px; border:none; margin-bottom: 10px;}
 	#goMain{width: 150px; height : 30px; background-color: #7ABBF3; color: #fff; border-radius: 5px; border:none;
 			display: block;} 
 	.select{padding: 15px 10px; text-align: center;}
 	.select input[type=checkbox]+label{display : inline-block; cursor : pointer; height: 50px; width:200px;
 									line-height: 20px; text-align: center; font-weight: bold; font-size: 18px;}
 	.select input[type=checkbox]:checked+label { border-bottom: 3px solid #7ABBF3;}
</style>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<br>
	<h2>내 정보 수정하기</h2>
	<br>
	<form action="<%= request.getContextPath() %>/updateUserInfo.pm" method="post" id="myUpdateForm" name="myUpdateForm" >
		<table> 
		<tr>
			<td><label>아이디</label></td>
		</tr>
		<tr>
			<td><input style="border:0 solid black; background: lightgray;" type="text" id="myId" maxlength="30" name="myId" value="<%=myInfo.getMemberId() %>" readonly></td>
		</tr>
		<tr>
			<td><label>이름</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="15" name="myName" value="<%= myInfo.getMemberName()%>" required></td>
		</tr>
		<tr>
		<tr>
			<td><label>이메일</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="13" name="myEmail" value="<%=myInfo.getEmail()%>" ></td>
		</tr>
		<tr>
			<td><label>전화번호</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="13" name="myPhone" value="<%=myInfo.getPhone() == null ? "" :myInfo.getPhone() %>" ></td>
		</tr>
		<tr>
			<td><label>주소</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="100" name="myAddress" value="<%=myInfo.getAddress() == null ? "" : myInfo.getAddress()%>"  ></td>
		</tr>
		</table>
		<div class="myPageBtns" align="center">
				<input id="updateBtn" type="submit" value="수정하기" onclick = UpdateSuccess();>
				<input type="button" id="cancelBtn" onclick="location.href='javascript:history.go(-1)'" value="취소하기">
			</div>
		</form>
		<script>
			function UpdateSuccess(){
				alert('회원 정보가 수정되었습니다.');
				history.go(-1);
			}
		</script>
</body>
</html>