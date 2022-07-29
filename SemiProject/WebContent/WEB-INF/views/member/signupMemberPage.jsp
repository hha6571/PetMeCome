<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>회원가입 | Pet Me Come</title> 
</head>
<style>
 	h2{text-align: center;} 
 	input{width: 450px; height: 40px; border: 1px solid lightgray; border-radius: 5px; margin-bottom: 10px;} 
 	table{ margin : auto;}
 	#signup{ width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
 			margin-top: 20px; align-content: center; margin: auto;} 
 	#back{ width: 100px; height : 30px; background: lightgray; border:none; border-radius: 5px;} 
 	#idCheck {width: 100px; height : 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white;}
 	.must{color: red;} 
 	.button{margin-top: 20px; text-align: center;} 
 	.loginBtns > input{width: 100px; height : 30px; color: #404040; border-radius: 5px; border:none;} 
</style>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<div class="outline">
	<br>
	<br>
	<br>
	<h2>회원가입</h2>
	<h3>Pet Me Come에 오신 걸 환영합니다.</h3>
	<br>
	<form action="<%= request.getContextPath() %>/insert.pm" method="post" id="signupForm" name="signupForm"  onsubmit="return insertValidate();">
	<table> 
		<tr>
			<td class="bold" >아이디<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="text" id="inputId" maxlength="30" name="inputId" placeholder="아이디를 입력하세요"  required></td>
			<td><input type="button" id="idCheck" value="중복확인"></td>
		</tr>
		<tr>
			<td><span id="idCheckResult"></span></td>
		</tr>
		<tr>
			<td class="bold">비밀번호<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요" required></td>
		</tr>
		<tr>
			<td><span id="pwdCheckResult"></span></td>
		</tr>
		<tr>
			<td class="bold">비밀번호 확인<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100" id="userPwdCheck" name="userPwdCheck" placeholder="비밀번호 확인" required></td>
		</tr>
		<tr>
			<td><span id="pwdCheckResult2"></span></td>
		</tr>
		<tr>
			<td class="bold" >이름<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="text"  maxlength="15" id="userName" name="userName" placeholder="이름을 입력하세요" required></td>
		</tr>
		<tr>
			<td class="bold" >이메일<label class="must">*</label></td>
		</tr>
		<tr>
			<td><input type="email"  maxlength="100" id="email" name="email" placeholder="이메일을 입력하세요" required></td>
		</tr>
		<tr>
		<tr>
			<td class="bold">전화번호</td>
		</tr>
		<tr>
			<td><input type="text" maxlength="13" name="phone"></td>
		</tr>
		<tr>
			<td class="bold">주소</td>
		</tr>
		<tr>
			<td><input type="text" maxlength="100" name="address"></td>
		</tr>
		</table>
			<div class="button">
				<input type="submit" id="signup" value="회원가입">
				<input type="button" id="back"  value="가입취소"  onclick="location.href='<%= request.getContextPath()%>'">
			</div>
		</form>
		</div>
		<script>
		var isUsable = false;
		var isIdChecked = false;
		var isPwdChecked = false;
		var isPwdSame = false;
		
		var checkSpe = /[~!@#$%^&*()_+|<>?:{}]/;
		var checkCap = /[A-Z]/;
		var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		$('#inputId').on('change paste keyup', function(){
			isIdChecked = false;
		});
		$('#userPwd').on('change paste keyup', function(){
			isPwdChecked = false;
		});
		
		$('#idCheck').click(function(){
			var inputId = $('#inputId').val();
			
			if(inputId.length < 6 || checkSpe.test(inputId) || checkCap.test(inputId) || checkKor.test(inputId)){

				$('#idCheckResult').text('5자 이상의 영문 소문자, 숫자만 사용가능합니다.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
				$('#inputId').focus();
			}else{
				$.ajax({
				url : '<%=request.getContextPath() %>/idcheck.do',
				type : 'post',
				data : {inputId:inputId},
				success : function(data){
						console.log(data);
					if(data == "0"){
						$("#idCheckResult").text("사용 가능한 아이디입니다").css({'color':'green', 'float':'left', 'display': 'inline-block'});
						isUsable = true;
						isIdChecked = true;
					}else if(data == "1"){
						$("#idCheckResult").text("이미 사용중인 아이디입니다").css({'color':'red', 'float':'left', 'display': 'inline-block'});
						inputId.focus();
						isUsable = false;
						isIdChecked = false;
					}
				},
				error : function(data){
					console.log(data);
				}
			});
		}
		});
		
		$('#userPwd').keyup(function(){
			var userPwd = $('#userPwd').val();
			
			if(userPwd.length < 8 || !checkSpe.test(userPwd) || checkKor.test(userPwd)){
				$('#pwdCheckResult').text('8자 이상의 영문 대 소문자, 숫자, 특수문자를 사용하세요.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
				isPwdChecked = false;
			}else{
				$('#pwdCheckResult').text('');
				isPwdChecked = true;
			}
		});
		
		$('#userPwdCheck').keyup(function(){
			var userPwd = $('#userPwd').val();
			var userPwdCheck = $('#userPwdCheck').val();

			if(userPwd != userPwdCheck){
				$('#pwdCheckResult2').text('비밀번호가 일치하지 않습니다.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
				isPwdSame = false;
			}else{
				$('#pwdCheckResult2').text('');
				isPwdSame = true;
			}
		});
		
		function insertValidate(){
			if(isUsable && isIdChecked && isPwdChecked && isPwdSame){
				alert("회원가입 성공! 메인 페이지로 이동합니다");
				history.go(-1);
				
			}else if(!isIdChecked){
				alert('아이디 중복을 확인해주세요.');
				return false;
			}else if(!isPwdSame){
				alert('비밀번호를 확인해주세요.');
				return false;
			}
				alert("회원가입 성공! 메인 페이지로 이동합니다");
		}
		</script>
</body>
</html>