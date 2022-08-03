<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
</head>
 <title> 로그인 | Pet Me Come</title> 
 <style>
 	.button{font-size: 16px;}
 </style>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<div class="outline">
	<br>
	<br>
	<br>
	<h2>로그인</h2>
	<h3>Pet Me Come에 오신 걸 환영합니다.</h3>
	<br>
	<form action="<%= request.getContextPath() %>/login.pm" method="post" id="signupForm" name="signupForm" onsubmit="return validate();">
	<table> 
		<tr>
			<td class="bold" >아이디<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="30" id="userId" name="userId" placeholder="아이디를 입력하세요"  required></td>
		</tr>
		<tr>
			<td class="bold" >비밀번호<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100" name="userPwd" placeholder="비밀번호를 입력하세요" required></td>
		</tr>
		</table>
			<div class="button1">
				<input type="submit" id="login" value="로그인">
			</div>
			<br>
			<div class="found" style="text-align:center;">
			<a class="button" onclick="location.href='<%=request.getContextPath() %>/findPwdForm.pm'">비밀번호찾기</a> |
			<a class="button" onclick="location.href='<%=request.getContextPath() %>/findIdForm.pm'">아이디찾기</a> |
			<a class="button" onclick="location.href='<%=request.getContextPath() %>/signUpForm.pm'">회원가입</a>
			</div>
		</form>
		</div>
		<%@ include file="../common/bottom_footer.jsp" %>
		<script>
		function validate(){
			var id = $('#userId');
			var pwd = $('#userPwd');
			
			if(id.val().trim().length == 0){
				alert('아이디를 입력하세요');
				id.focus();
				return false;
			}
			if(pwd.val().trim().length == 0){
				alert('비밀번호를 입력하세요');
				pwd.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>