<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>Pet Me Come | 유기견 정보 등록</title>
<style>
	h2{text-align: center;} 
 	#petName, #petAge, #gender, #petKind, #neutral, #inoculated, #petStatus, #adoptImg
 	{text-align: center;  height: 30px; border: none; border-radius: 5px;
 	width: 250px !important;     margin: auto;} 
 	#petName:focus, #petAge:focus, #petKind:focus{outline: 1px solid #7ABBF3;}
 	select{width: 450px; height: 30px; border: 1px solid gray; border-radius: 5px; }
 	#adoptTable{margin : auto;}
 	tr{border-bottom: 1px solid #e3e3e3;}
 	#insertAdopt{ width: 100px; height: 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white; 
 			margin-top: 20px; align-content: center; margin: auto;} 
 	#cancelAdopt{ width: 100px; height: 30px; background: lightgray; border:none; border-radius: 5px;} 
 	#idCheck {width: 100px; height: 30px; background: #7ABBF3; border:none; border-radius: 5px; color: white;}
 	.adoptTb{height: 40px; width: 120px; padding : 5px; font-size: 18px; color: #000; background: #7ABBF3;} 
 	.button{margin-top: 20px; text-align: center;} 
 	.loginBtns > input{width: 100px; height: 30px; color: #404040; border-radius: 5px; border:none;}
 	#adtableLine{max-width: 600px; }
</style>
</head>
<%@ include file="../common/menubar.jsp" %>
<body>
     <div class="page-title" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/99C25E385DE0774E32?original)">
        <h1>입양정보 게시판</h1>
    </div>
	<div class="outline">
		<br>
	<h1 style="text-align: center;">유기견 정보 등록</h1>
		<br>
	<form action="<%= request.getContextPath() %>/insert.ad" method="post" id="insertPetForm" name="insertPetForm"  encType="multipart/form-data" onsubmit="return insertValidate();">
    	<table id="adoptTable"> 
		<tr>
			<td class="adoptTb">이름</td>
			<td> <input type="text" id="petName" name="petName" placeholder="이름를 입력하세요" required></td>
			<td class="adoptTb">나이</td>
			<td ><input type="number"  id="petAge" name="petAge" placeholder="나이를 입력하세요" required></td>
			<td class="adoptTb">입양현황</td>
			<td >
				<select style="height:30px; text-align:center;" name="petStatus" id="petStatus">
		        	<option>입양현황 선택</option>
		            <option value="입양대기">입양대기</option>
		            <option value="입양완료">입양완료</option>
		            <option value="임시보호신청">임시보호신청</option>
		            <option value="임시보호중">임시보호중</option>
	            </select>
			</td>
		</tr>
		<tr>
			<td  class="adoptTb">성별</td>
			<td colspan="2" style="text-align: center;"><input type="radio" class="radio" id="gender" name="gender" value="M"><font size="4" color="black">남</font></td>
			<td colspan="2" style="text-align: center;"><input type="radio" class="radio" id="gender" name="gender" value="F"><font size="4" color="black">여</font></td>
		</tr>
		<tr>
			<td class="adoptTb">견종</td>
			<td colspan="3"><input type="text" maxlength="15" id="petKind" name="petKind" placeholder="견종을 입력하세요" required></td>
		</tr>
		<tr>
			<td class="adoptTb" >중성화 여부</td>
			<td colspan="2" style="text-align: center;"><input type="radio" class="radio" id="neutral" name="neutral" value="Y"><font size="4" color="black">완료</font></td>
			<td colspan="2" style="text-align: center;"><input type="radio" class="radio" id="neutral" name="neutral" value="N"><font size="4" color="black">미완료</font></td>
		</tr>
		<tr>
			<td  class="adoptTb">예방접종 여부</td>
			<td colspan="2" style="text-align: center;" ><input type="radio" class="radio" id="inoculated" name="inoculated" value="Y"><font size="4" color="black">완료</font></td>
			<td colspan="2" style="text-align: center;"><input type="radio" class="radio" id="inoculated" name="inoculated" value="N"><font size="4" color="black">미완료</font></td>
		</tr>
		<tr>
			<td class="adoptTb">사진</td>
			<td colspan="2">
				<div  align="center" id="fileArea">
					<input type="file" class="file" id="adoptImg" multiple="multiple" name="adoptImg" onchange="LoadImg(this)">
				</div>
				<div  align="center" id="adoptImgArea">
					<img class="file" id="adoptImg" width="120" height="100" onerror="imgError()"> 
				</div>
			</td>
		</tr>
		</table>
			<div class="button">
				<input type="submit" id="insertAdopt" value="등록">
				<input type="button" id="cancelAdopt" value="취소" onclick="location.href='<%= request.getContextPath()%>/list.ad'">
			</div>
		</form>
			<script>
				$(function(){
					$("#adoptImgArea").hide();
					$("#adoptImgArea").click(function(){
						$("#adoptImg").click();
					});
				});
				function LoadImg(value, num){
					if(value.files && value.files[0]){
						var reader = new FileReader();
							
						reader.onload = function(e){								
							$("#adoptImg").attr("src", e.target.result);
						}
							
						reader.readAsDataURL(value.files[0]);
					}
				}
						
				function imgError(){
					$('#adoptImgArea').css({'display' : 'none'});
				}
				
				var petNameCheck = false;
				var petAgeCheck = false;
				var petKindCheck = false;
				
				$('#petName').on('change paste keyup', function(){
					petNameCheck = false;
				});
				$('#petAge').on('change paste keyup', function(){
					petAgeCheck = false;
				});
				$('#petKind').on('change paste keyup', function(){
					petKindCheck = false;
				});
				
				$('#petNameCheck').blur(function(){
					var petName = $('#petName').val();
					
					if(petName.length < 1 || petName == null){
						$('#petNameCheck').text('이름을 입력해야 합니다.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
						$('#petName').focus();
					} else{
						petNameCheck = true;
					}
				});
				
				$('#petAge').blur(function(){
					var petAge = $('#petAge').val();
					
					if(petName.length < 1 || petName == null){
						$('#petAgeCheck').text('나이를 입력해야 합니다.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
						$('#petAge').focus();
					} else{
						petAgeCheck = true;
					}
				});
				
				$('#petKind').blur(function(){
					var petKind = $('#petKind').val();
					
					if(petName.length < 1 || petName == null){
						$('#petKindCheck').text('견종을 입력해야 합니다.').css({'color':'red', 'float':'left', 'display': 'inline-block'});
						$('#petKind').focus();
					} else{
						petKindCheck = true;
					}
				});
				
				function insertValidate(){
					if(petNameCheck && petAgeCheck && petKindCheck){
						alert("회원가입 성공! 메인 페이지로 이동합니다");
						history.go(-1);
					}
				}
			</script>
		</div>
        <br>
        
 	<%@ include file="../common/bottom_footer.jsp" %>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>