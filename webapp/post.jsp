<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기억을 남기는 공간</title>
</head>
<body style="background-color: green">
	<h1 style="color: white">기억을 남기는 공간</h1>
	<form action="/post" method="post" enctype = "multipart/form-data">
		<label for="title" style="color: white"> 제목: </label> <input
			type="text" name="title" id="title" size="50"> <br> <label
			for="contents" style="color: white"> 내용 </label> <br>
		<textarea name="contents" cols="60" rows="8"> 내용을 입력해주세요. </textarea>
		<br> <input type="file" name="photofile" size="40"> <input
			type="submit" value="submit">
	</form>
</body>
</html>