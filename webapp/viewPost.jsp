<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기억을 찾는 공간</title>
</head>
<body style="background-color: violet">
	<div style="font-family: Verdana; font-color: pink; align: center">
		당신이 남긴 기억의 이름은 <strong>${post.title}</strong> 입니다. <br>
	</div>
	<div style="font-color: green">
		<strong>${post.contents}</strong> 와 같은 기억을 가지고 있군요. <br>
	</div>
	<div>그 당시를 나타내는 사진은 다음과 같습니다.</div>
	<br>
	<img src="/images/${post.fileName}">
	<br>
	<a href="/"> <em>첫화면으로 돌아가기</em></a>

	<br>
	<br>
	<br>
	<br>
	<div>
		<h1>수정하기</h1>
	</div>
	<form action="/post/${post.id}/modify" method="post" enctype="multipart/form-data">
		제목:
		<textarea name="title" id="title" cols="50" rows="1"> ${post.title} </textarea>
		<br> <br> <label for="contents"> 내용 </label> <br>
		<textarea name="contents" cols="60" rows="8"> ${post.contents} </textarea>
		<br> <input type="file" name="photoFile" size="40"> <input
			type="submit" value="Modify">
	</form>

	<div>
		<h2>삭제하기</h2>
	</div>
	<form action="/post/${post.id}/delete" method="post" enctype="multipart/form-data">
		<input type="submit" value="Delete">
	</form>
</body>
</html>