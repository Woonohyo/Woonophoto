<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Woonophoto</title>
<style>
/* System Name, CSS Version_Creater_Date */
/* Common */
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textare a,button,select
	{
	margin: 0;
	padding: 0
}

body,input,textarea,select,button,table {
	font-family: '돋움', Dotum, AppleGothic, sans- serif;
	font-size: 1em
}

img,fieldset {
	border: 0
}

ul,ol {
	list-style: none
}

em,address {
	font-style: normal
}

a {
	text-decoration: none
}

a:hover,a:active,a:focus {
	text-decoration: none
}

div#post_info {
	background-color: #989898;
	margin-right: auto;
	text-align: left;
	margin-left: auto;
	color: white;
	margin-bottom: 5px;
}

div#post_screen {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

div#post_cover {
	background-color: #DEDEDE;
	margin-top: 62px;
	padding: 50px;
	width: 40%;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	height: auto;
	margin-bottom: 62px;
}

div#page_end {
	position: fixed;
	text-align: center;
	bottom: 0px;
	left: 0px;
	width: 99%;
	height: 42px;;
	background-color: #006699;
	color: white;
	padding: 5px;
}

div#top_cover {
	border: 2px solid white;
	position: fixed;
	width: 99%;
	height: 42px;
	background-color: #006699;
	padding: 10px;
	margin-bottom: 42px;
	top: 0px;
	left: 0px;
}

#title {
	position: fixed;
	width: 42px;
	height: 42px;
	height: auto;
	align-text: center;
	font-size: 2 em;
}

#login {
	text-align: right;
	color: white;
}

#login input[type=submit] {
	margin-right: 5px;
	width: 70px;
	height: 25px;
	text-align: center;
	font-family: verdana;
	background-color: #006699;
	border: 2px solid white;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	color: white;
	font-size: 15px;
	line-height: 10px;
}

#title_text {
	position: fixed;
	font-size: 2em;
	left: 62px;
	color: white;
	top: auto;
}

#delete input[type=submit] {
	width: 70px;
	height: 25px;
	text-align: center;
	font-family: verdana;
	background-color: #006699;
	border: 2px solid white;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	color: white;
	font-size: 15px;
	line-height: 10px;
	margin-right: 5px;
	margin-top: 5px;
	align: right;
}

#newComment {
	align: center;
}

#newComment input[type=submit] {
	width: 80px;
	height: 25px;
	text-align: center;
	font-family: verdana;
	background-color: #006699;
	border: 2px solid white;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	color: white;
	font-size: 15px;
	line-height: 10px;
	margin-right: 5px;
}

#comment {
	text-align: left;
	background-color: #989898;
	color: white;
	height: auto;
	padding: 10px;
}
</style>


</head>
<body style="background-color: #F2F2F2">
	<div id="top_cover">
		<div id="title">
			<a href="/"><img src="/images/wp.png" width="42" height="42"></a>
		</div>
		<div id="title_text">
			<a href="/"><font color="white">Woonophoto</font></a>
		</div>
		<div id="login">
			<c:if test="${not empty sessionScope.username}">
			Welcome, ${sessionScope.username}. <br>
				<form action="/logout" method="post">
					<input type="submit" value="Logout">
				</form>
			</c:if>
			<c:if test="${empty sessionScope.username}">
				<form action="/logincheck" method="post">
					<input type="text" name="username" placeholder="ID"> <input
						type="password" name="password" placeholder="Password"> <br>
					<input type="submit" value="Login">
				</form>
			</c:if>
		</div>
	</div>

	<c:forEach items="${posts}" var="post">
		<div id="post_cover">
			<div id="post_info">
				게시물번호: ${post.id}<br> 제목: ${post.title}<br> 내용:
				${post.contents}<br>
			</div>
			<div id="post_screen">
				<c:if test="${not empty post.fileName}">
					<img src="/images/${post.fileName}" width="465" height="444">
				</c:if>
				<c:if test="${empty post.fileName}">
					<img src="/images/noImageUploaded.png" width="465" height="444">
				</c:if>
			</div>
			<br>
			<div id="comment">
				<!-- 댓글 보여주는 부분 -->
				<c:forEach items="${post.comments}" var="comment">
					[${comment.user.username}] ${comment.contents}<br>
				</c:forEach>
			</div>
			<hr>
			<div id="newComment">
				<form action="/post/${post.id}/comments" method="post">
					<textarea name="contents" rows="1" cols="54"
						placeholder="share your opinion"></textarea>
					<br> <input type="submit" value="Comment">
				</form>
				<div id="delete">
					<form action="/post/${post.id}/delete" method="post"
						enctype="multipart/form-data">
						<input type="submit" value="Delete">
					</form>
				</div>
			</div>
		</div>

		<hr>
	</c:forEach>
	<div id="page_end">
		<a href="/"> <font color="white">[메인 페이지로 돌아가기]</font></a> <a
			href="/post/new"> <font color="white">[새 포스트 작성하러 가기]</font>
		</a>
	</div>
</body>
</html>