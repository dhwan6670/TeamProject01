<%@page import="com.login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<style>
* {
	font-family: 'NeoDunggeunmo';
}
}
* {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

header {
	position: relative;
	width: 100%;
	height: 100px;
	background-color: #fffffff;
}

#logo {
	position: absolute;
	top: 30px;
	left: 30px;
}

#top_menu {
	position: absolute;
	top: 20px;
	right: 10px;
	color: black;
}

#top_menu a {
	color: black;
}

/*헤더 영역 네비 메뉴 배치*/
nav {
	position: absolute;
	bottom: 10px;
	font-size: 18px;
}

nav li {
	display: inline;
	margin-left: 30px;
}

nav li a {
	color: black;
}
</style>
</head>
<body>
	<div id="page">
		<header>
			<div id="logo">
				<img src="images/logo.png" alt="logo"
					onClick="location.href='/TeamProject/home.jsp'" width="100px">
			</div>

			<br /> <br />
			<nav>
				<ul>
					<li><a href="/TeamProject/partyList?pg=1">소모임게시판</a></li>
					<li><a href="/TeamProject/freelist.do?pg=1">자유게시판</a></li>
					<li><a href="/TeamProject/picList?pg=1">짤 게시판</a></li>
					<li><a href="/TeamProject/evaluate_board/EvaluateMain.jsp">한줄평게시판</a></li>
					<li><a href="/TeamProject/noticeList">공지게시판</a></li>
				</ul>
			</nav>
			<div id="top_menu">
				<input type="text" class="form-control" placeholder="검색"> <span
					class="input-group-btn">
					<button class="btn btn-secondary" type="button">찾기</button> 
					<%
 						LoginDto entity = (LoginDto) session.getAttribute("logOK");
 						if (entity == null) {
 					%> 
 					<a href="/TeamProject/login/login.jsp">로그인</a> 
 					<a href="/TeamProject/signup/SignUpForm.jsp">회원가입</a>
				</span>
			</div>
			<%
			} else {
			%>
			<span id="login_info"><b><%=entity.getMember_name()%></b>님
				환영합니다 &nbsp;&nbsp;</span> <a class="a" href="/TeamProject/logout.do">로그아웃</a>
			<a href="/TeamProject/userPage.do?id=<%=entity.getMember_id()%>">내정보</a>
		</header>
			<%
			}
			%>
	</div>