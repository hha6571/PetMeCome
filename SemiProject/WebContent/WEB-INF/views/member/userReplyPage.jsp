<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*"%>
    <%
      	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list"); 
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
 	table tr:first-child{border-bottom: 2px solid lightgray; border-top: 2px solid lightgray;}
 	table td{border-bottom: 1px solid lightgray; height: 60px; font-size: 16px; text-align: center;}
 	#delete{border: none; background-color: #7ABBF3; border-radius: 5px; color: #fff;}
</style>
<%@ include file ="../common/menubar.jsp"%>
<body>
<hr>
	<br>
	<h2>내 정보 보기</h2>
	<br>
	<div class="select">
	<input type="checkbox" id="userInfoPage" name="userInfo" onclick="location.href='<%=request.getContextPath() %>/myPage.pm'"><label for="userInfo">내 정보</label>
	<input type="checkbox" id="userBoard" name="userBoard" onclick="location.href='<%= request.getContextPath() %>/userPostForm.pm'"><label for="userBoard">작성글</label>
	<input type="checkbox" id="userReply" name="userReply" checked="checked"><label for="userReply">작성댓글</label>
	</div>
	<br>
	<br>
	<div>
	<table>
		<tr>
			<th style="width:250px; height: 70px; font-size: 16px; text-align: center;">댓글 번호</th>
			<th style="width:300px; height: 70px; font-size: 16px; text-align: center;">댓글 내용</th>
			<th style="width:250px; height: 70px; font-size: 16px; text-align: center;">작성일</th>
		</tr>
		<% if(list.isEmpty()){  %>
			<tr>
				<td colspan="3">작성한 댓글이 존재하지 않습니다.</td>
			</tr>
			<% }else{ %>
			<% for(Reply r : list){%> 
				<tr>
		 			<td><%=r.getReplyId()%></td> 
		 			<td><%=r.getReplyContent() %></td>
		 			<td><%=r.getCreateDate() %></td>
		 			<td><button id="delete">삭제</button></td>
				</tr>
		<%	} %> 
		<%	} %> 
	</table>
	</div>
	</body>
	</html>
	