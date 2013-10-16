<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우노포토</title>
</head>
<body style="background-color: black">
	<center>
		<h1 style="color: white" align="center">어서오세요.</h1>
		<h2 style="color: white" align="center">기억하고 싶은 순간을 사진과 글로 남기세요.</h2>
		<h6 style="color: white" align="center">href는 어떻게 정렬하지...</h6>
		<hr>
		<a href="/post/new" style="color: yellow"> 기록 남기기 </a><br> <br>
		<a href="/post/list" style="color: yellow"> 모든 기록 살펴보기</a><br> <br>
		<c:choose>
			<c:when test="${not empty sessionScope.username}">
				<h4 style="color: yellow">안녕하세요, ${sessionScope.username}님.</h4>
				<form action="/logout" method="post">
					<input type="submit" value="로그아웃">
				</form>
			</c:when>
			<c:when test="${empty sessionScope.username}">
				<a href="/login" style="color: pink"> 회원 전용 서비스 이용하기 </a>
			</c:when>
		</c:choose>


	</center>
</body>
</html>