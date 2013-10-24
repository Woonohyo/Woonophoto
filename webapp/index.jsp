<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우노포토</title>
<link href="/images/wp.png">
</head>
<body style="background-color: #f1efeb">
	<center>
		<h1 style="color: orange" align="center">어서오세요.</h1>
		<h2 style="color: orange" align="center">기억하고 싶은 순간을 사진과 글로 남기세요.</h2>
		<h6 style="color: orange" align="center">href는 어떻게 정렬하지...</h6>
		<hr>
		<a href="/post/new" style="color: orange"> 기록 남기기 </a><br> <br>
		<a href="/post/list" style="color: orange"> 모든 기록 살펴보기</a><br> <br>
		<c:choose>
			<c:when test="${not empty sessionScope.username}">
				<h4 style="color: chocolate">안녕하세요, ${sessionScope.username}님.</h4>
				<form action="/logout" method="post">
					<input type="submit" value="로그아웃">
				</form>
			</c:when>
			<c:when test="${empty sessionScope.username}">
				<a style="color: pink"> 회원 전용 서비스 이용하기 </a>
				<form action="/logincheck" method="post">
					<br />
					<h3 style="color: white">제 이름은</h3>
					<input type="text" name="username"> <br />
					<h3 style="color: white">제 비밀번호는</h3>
					<input type="password" name="password"> <br /> <br> <input
						type="submit" value="접속하기">
				</form>
			</c:when>
		</c:choose>


	</center>
</body>
</html>