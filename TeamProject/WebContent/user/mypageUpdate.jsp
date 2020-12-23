<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp"%>
<%@ page import="com.login.dto.LoginDto"%>
<%@ page import="com.login.dao.LoginDao"%>
<!DOCTYPE html>
<html>
<head>
<title>유저정보 출력화면</title>
<style>
*{font-family: 'NeoDunggeunmo';}
@-webkit-keyframes rotate {
  100% {
    -webkit-transform: rotate(1turn);
            transform: rotate(1turn);
  }
}
@keyframes rotate {
  100% {
    -webkit-transform: rotate(1turn);
            transform: rotate(1turn);
  }
}
#wrap {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
	border: 3px solid skyblue;
}

td {
	border: 1px solid skyblue
}

#title {
	background-color: skyblue
}
</style>
<script type="text/javascript">
	function changeForm(val) {
		if (val == "-1") {
			location.href = "../main.jsp";
		} else if (val == "0") {
			location.href = "userupdate.jsp";
		} else if (val == "1") {
			location.href = "userdelete.jsp";
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">내 정보</font></b> <br>
		<br> <br>
		<!-- 가져온 회원정보를 출력한다. -->
		<table>
			<tr>
				<td id="title">아이디</td>
				<td>${logOK.member_id}</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td>${logOK.member_password}</td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td>${logOK.member_name}</td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td>${logOK.member_email}</td>
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td>${logOK.member_phone}</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>${logOK.member_address}</td>
			</tr>
			<tr>
				<td id="title">비밀번호 힌트</td>
				<td>${logOK.member_hint}</td>
			</tr>
			<tr>
				<td id="title">힌트 답</td>
				<td>${logOK.member_answer}</td>
			</tr>
		</table>
		<br> <br> <input type="button" value="뒤로"
			onclick="changeForm(-1)"> <input type="button"
			value="회원정보 변경" onclick="changeForm(0)"> <input type="button"
			value="회원탈퇴" onclick="changeForm(1)">
	</div>
</body>
</html>