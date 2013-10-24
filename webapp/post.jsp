<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 기존에 있던 내용의 삭제를 통해 HTML5를 사용할 수 있게 되었다. -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기억을 남기는 공간</title>
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/newPost.css" />
</head>
<body style="background-color: #f1efeb">
	<c:choose>
		<c:when test="${not empty sessionScope.username}">
			<div id="wrap">
				<header>
					<h1 style="color: orange">Share your memory</h1>
				</header>
				<div id="postArea">
					<form action="/post" method="post" enctype="multipart/form-data">
						<label for="title" style="color: orange"> Title: </label> <input
							type="text" name="title" id="title" size="61" placeholder="TITLE">
						<br> <label for="contents" style="color: orange">
							Contents </label> <br>
						<textarea name="contents" cols="60" rows="8"
							placeholder="What's on your mind?"></textarea>
						<br> <input type="file" name="photoFile" size="40"> <input
							type="submit" value="submit" alt="Submit"> <input
							type="reset" value="reset">
					</form>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h1 style="color: black">회원만 사용할 수 있는 서비스입니다!</h1>
			<a href="/join"> 회원가입하기 </a>
			<br>
			<a href="/"> 첫 화면으로 돌아가기 </a>
		</c:otherwise>
	</c:choose>
</body>
</html>