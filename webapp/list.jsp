<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모든 기록을 확인할 수 있습니다.</title>
</head>
<body>
	<center>
		<c:choose>
			<c:when test="${not empty sessionScope.username}">
				<c:forEach items="${posts}" var="post">
게시물번호: ${post.id}<br>
제목: ${post.title}<br>
내용: ${post.contents}<br>
					<c:if test="${not empty post.fileName}">
						<img src="/images/${post.fileName}">
					</c:if>
					<c:if test="${empty post.fileName}">
						<img src="/images/noImageUploaded.png">
					</c:if>
					<br>
					<a href="/post/${post.id}"> 자세히 보기 </a>
					<form action="/post/${post.id}/delete" method="post"
						enctype="multipart/form-data">
						<input type="submit" value="삭제하기">
					</form>
					<hr>
				</c:forEach>
				<a href="/"> 메인 페이지로 돌아가기</a>
				<a href="/post/new"> 새 포스트 작성하러 가기</a>
			</c:when>
			<c:otherwise>
				<h1 style="color: red">회원만 사용할 수 있는 서비스입니다!</h1>
				<a href="/join"> 회원가입하기 </a><br>
				<a href="/"> 첫 화면으로 돌아가기 </a>
			</c:otherwise>
		</c:choose>
	</center>

</body>
</html>