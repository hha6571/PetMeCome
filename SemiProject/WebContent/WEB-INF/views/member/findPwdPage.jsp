<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
 <title> 비밀번호 찾기 | Pet Me Come</title> 
</head>
<style>
 	h2{text-align: center;} 
 	input{width: 400px; height: 40px; border: 1px solid lightgray; border-radius: 5px; margin-bottom: 10px;} 
 	#findPwd{ width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
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
	<h2>비밀번호 찾기</h2>
	<br>
	<form action="<%= request.getContextPath() %>/findPwd.do" method="post" id="findPwdForm" name="findPwdForm"  onsubmit="return insertValidate();">
	<table> 
		<tr>
			<td class="bold" >아이디<label class="must">*</label></td>
		</tr>
		<tr>
			<td ><input type="text" maxlength="30" id="searchId" name="searchId" placeholder="아이디를 입력하세요"  required></td>
		</tr>
		<tr>
			<td class="bold" >이름<label class="must">*</label></td>
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
				<input type="submit" id="findPwd" value="비밀번호 찾기">
				<input type="button" id="back"  value="취소"  onclick="location.href='javascript:history.go(-1)'">
			</div>
			<br>
		</form>
		</div>
		<%@ include file="../common/bottom_footer.jsp" %>
	<script>
		var isIdChecked = false;
		var isNameChecked = false;
		var isEmailChecked = false;
		
		$('#findPwd').click(function(){
			var searchId = $('#searchId').val();
			var searchName = $('#searchName').val();
			var searchEmail = $('#searchEmail').val();
			
			$.ajax({
				url : '<%=request.getContextPath() %>/findPwd.do',
				type : 'post',
				data : {searchId:searchId, searchName:searchName, searchEmail:searchEmail},
				success : function(data){
					console.log(data);
					if(data == "1"){
						var isIdChecked = true;
						var isNameChecked = true;
						var isEmailChecked = true;

						$.ajax({
							url:'<%=request.getContextPath() %>/sendEmailPwd.do',
							type : 'post',
							data : {searchId:searchId, searchEmail:searchEmail},
							success : function(data){
							console.log(data);
							}
						})
						alert("이메일로 임시 비밀번호가 발송되었습니다.");
						history.go(-1);
					}else if(data == "0"){
						alert("일치하는 회원이 존재하지 않습니다.");
						history.go(0);
						
						isIdChecked = false;
						isNameChecked = false;
						isEmailChecked = false;
			
					}
				},
				error : function(data){
					console.log(data);
				}
			});
		});
	</script>
</body>
</html>