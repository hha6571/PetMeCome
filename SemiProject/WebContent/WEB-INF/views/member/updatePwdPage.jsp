<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
    	Member member = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
 <title>비밀번호 변경하기 | Pet Me Come</title> 
</head>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<br>
	<h2>비밀번호 변경</h2>
	<br>
	<form action="<%= request.getContextPath() %>/updatePwd.pm" method="post" id="updatePwdForm" name="updatePwdForm" onsubmit="return send();">
		<table> 
		<tr>
			<td>현재 비밀번호</td>
		</tr>
		<tr>
			<td><input type="password" id="userPwd" maxlength="100" name="userPwd" ></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100" id="newPwd" name="newPwd" ></td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100" id="newPwdCheck" name="newPwdCheck" ></td>
		</tr>
		</table>
		<div class="button">
				<input type="submit" id="update" value="확인">
				<input type="button" id="back"  value="취소"  onclick="location.href='javascript:history.back();'">
		</div>
		</form>
		<%@ include file="../common/bottom_footer.jsp" %>
		<script>
			function send(){
				var userPwd = $('#userPwd').val();
				var newPwd = $("#newPwd").val();
				var newPwdCheck = $('#newPwdCheck').val();
				
				console.log(userPwd);
				
				if(userPwd.trim() != <%loginUser.getMemberPwd();%>){
					alert('현재 비밀번호가 알맞지 않습니다.');
					$("#userPwd").focus();
					
					return false;

				}else if(newPwd.trim() != newPwdCheck.trim()){
					alert('새 비밀번호를 확인해주세요.')
					$("#userPwdCheck").val("");
					$("#userPwdCheck").focus();
					
					return false;
					
				}else if(newPwd.trim() == "" || newPwdCheck.trim() =="" || userPwd.trim == ""){
					alert('비밀번호를 입력해주세요.')
					return false;
				}
				
				if(true){
					alert("비밀번호 변경이 완료되었습니다.");
				}
				
				return true;
				
			}
			
		</script>
</body>
</html>