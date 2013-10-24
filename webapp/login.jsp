<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당신은 누구신가요?</title>
</head>
<body style="background-color: #f1efeb">
	<center>
		<h1 style="color: white">회원 전용 서비스를 이용하시려면</h1>
		<h2 style="color: yellow">일단 10만원을 입금한 뒤 로그인을 해주세요.</h2>
		<h2 style="color: yellow">신한 110-229-809404</h2>
		<form action="/logincheck" method="post">
			<br />
			<h3 style="color: white">제 이름은</h3>
			<input type="text" name="username"> <br />
			<h3 style="color: white">제 비밀번호는</h3>
			<input type="password" name="password"> <br />
			<br> <input type="submit" value="접속하기">
		</form>
		<hr>
		<div><a href="/"> 첫 화면으로 돌아가기 </a></div><br>
		<div> <a href="/join"> 회원가입하기</a> </div>
	</center>


</body>
</html>