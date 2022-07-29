<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
 <title> 아이디 찾기 | Pet Me Come</title> 
</head>
<style>
 	h2{text-align: center;} 
 	input{width: 400px; height: 40px; border: 1px solid lightgray; border-radius: 5px; margin-bottom: 10px;} 
 	#findId{ width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
 			margin-top: 20px; align-content: center; margin: auto;} 
 	#back{ width: 100px; height : 30px; background: lightgray; border:none; border-radius: 5px;} 
 	.button{margin-top: 20px; text-align: center;} 
</style>
<%@ include file ="../common/menubar.jsp"%>
<hr>
	<div class="outline">
	<br>
	<br>
	<br>
	<h2>아이디 찾기</h2>
	<br>
	<form action="<%= request.getContextPath() %>/findId.pm" method="post" id="findIdForm" name="findIdForm" onsubmit="return searchId();">
	<table> 
		<tr>
			<td class="bold">이름<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="15" id="searchName" name="searchName" placeholder="이름을 입력하세요"  required></td>
		</tr>
		<tr>
			<td class="bold">이메일<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="100" id="searchEmail" name="searchEmail" placeholder="이메일을 입력하세요" required></td>
		</tr>
		</table>
			<div class="button">
				<input type="submit" id="findId" value="아이디 찾기">
				<input type="button" id="back"  value="취소"  onclick="location.href='javascript:history.go(-1)'">
			</div>
			<br>
		</form>
		</div>
	<script>
		function searchId(){
			var name = $('#searchName');
			var email = $('#searchEmail');
			
			if(name.val().trim().length == 0){
				alert('이름을 입력하세요');
				name.focus();
				return false;
			}
			if(email.val().trim().length == 0){
				alert('이메일을 입력하세요');
				email.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>