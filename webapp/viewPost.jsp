<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기억을 찾는 공간</title>
</head>
<body style="background-color: violet">
<center>
	<div style="font-family: Verdana; font-color: pink; align: center">
		당신이 남긴 기억의 이름은 <strong>${post.title}</strong> 입니다. <br>
	</div>

	<div style="font-color: green">
		<strong>${post.contents}</strong> 와 같은 기억을 가지고 있군요. <br>
	</div>
	<c:if test="${not empty post.fileName}">

		<div>그 당시를 나타내는 사진은 다음과 같습니다.</div>
		<br>
		<img src="/images/${post.fileName}">
		<br>
	</c:if>
	<c:if test="${empty post.fileName}">
		<img src="/images/noImageUploaded.png">
		<br></br>
	</c:if>
	<div>
	
	<!-- 댓글 보여주는 부분 -->
	<c:forEach items="${comments}" var="comment">
댓글번호: ${comment.id}<br>
내용: ${comment.contents}<br>
<br>
	</c:forEach>
	<hr>
	</div>
	

	<div><h2>당신의 의견을 남겨주세요.</h2>
		<form action="/post/${post.id}/comments" method="post">
			<textarea name="contents" rows="5" cols="60"></textarea>
			<br> <input type="submit" value="댓글남기기">
		</form>
	</div>
<hr>
<h2>아래에서 수정하실 수 있습니다.</h2>
	<div>
		<form action="/post/${post.id}/modify" method="post"
			enctype="multipart/form-data">
			제목:
			<textarea name="title" id="title" cols="50" rows="1"> ${post.title} </textarea>
			<br> <br> <label for="contents"> 내용 </label> <br>
			<textarea name="contents" cols="60" rows="8"> ${post.contents} </textarea>
			<br> <h4>기존에 업로드한 파일은 ${post.fileName} 입니다.</h4>
			<input type="file" name="photoFile" size="40"><br>
			<br>
			<input type="submit" value="수정하기">
		</form>
		
		<form action="/post/${post.id}/delete" method="post"
			enctype="multipart/form-data">
			<input type="submit" value="삭제하기">
		</form>
	</div>
	<hr>
	</center>
	<div style = "clear: center; float:center; text-align:center">
		<a href="/post/list"> 모든 목록 확인하기</a><br>
		<a href="/"> <em>첫화면으로 돌아가기</em></a>
	</div>
	<div style = "clear: left; float:left; text-align:left"> 
	<a href="/post/${post.id-1}/"> 이전글 </a></div>
	<div style = "clear: right; float:right; text-align:right">
	 <a href="/post/${post.id+1}/"> 다음글 </a></div>
</body>
</html>