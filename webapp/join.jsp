<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날래날래 정보 내놓으라요</title>
</head>
<body style="background-color: MediumSeaGreen">
	<center>
		<h1 style="color: white">헐.. 이 비루한 서비스의 회원이 되겠다니 일단 축하드립니다.</h1>
		<h2 style="color: yellow">사용하실 이름과 비밀번호만 입력해주시면 됩니다. </h2>
		
		<form action="/join/joincheck" method="post">
			<br />
			<h3 style="color: white">사용할 이름은</h3>
			<input type="text" name="username"> <br />
			<h3 style="color: white">사용할 비밀번호는</h3>
			<input type="password" name="password"> <br />
			<br> <input type="submit" value="가입하기">
		</form>
		<br> <a href="/"> 첫 화면으로 돌아가기 </a>
	</center>

</body>
</html>