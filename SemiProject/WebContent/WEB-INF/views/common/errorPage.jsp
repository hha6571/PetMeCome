<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String error = (String)request.getAttribute("error");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage | Pet Me Come</title>

	<link rel="shortcut icon" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/ico/p로고.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/p로고.png">
</head>
<style>
	.error{display: inline-block; margin-top: 200px; margin-left: 38%;}
	#logo{text-align: center;}
	button{width: 200px; height : 40px; color: #404040; border-radius: 5px; border:none;}
	h1{color: #7ABBF3;}
</style>
<body>
	<div class="error">
		<div id="logo"><img alt="404" src="images/404pagelogo.png"></div>
		<h1 align="center"><%=error %></h1>
			<div align ="center">
			<button onclick = "history.back();">이전 페이지</button>
			<button onclick = "location.href='<%=request.getContextPath()%>'">홈으로 돌아가기</button>
			</div>
	</div>
</body>
</html>

