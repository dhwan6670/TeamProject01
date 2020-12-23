<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 화면</title>
<style>
* {
	font-family: 'NeoDunggeunmo';
}

@
-webkit-keyframes rotate { 100% {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn);
}

}
@
keyframes rotate { 100% {
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
	width: 500px;
	height: 700px;
	margin-left: auto;
	margin-right: auto;
	border: 3px solid black
}

td {
	border: 1px solid black
}

#title {
	background-color: gray;
}
</style>

<script type="text/javascript">
	function signcheck() {
		if (!document.signupfrm.id.value) {
			alert("아이디를 입력하세요.");
			return;
		}

		if (!document.signupfrm.password.value) {
			alert("비밀번호를 입력하세요.");
			return;
		}

		if (document.signupfrm.password.value != document.signupfrm.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return;
		}
		if (!document.signupfrm.name.value) {
			alert("이름을 입력하세요")
			return;
		}
		
		document.signupfrm.submit();
	}
	function idCheck(){
		window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
	}
</script>
</head>
<body>
	<form name="signupfrm" action="/TeamProject/signup.do" method="post"
		onsubmit="return signcheck()">


		<div id="wrap">
			<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
			<br> <br>
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" maxlength="50">
					 <input type="button" value="중복확인" onclick="idCheck()">
					</td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" maxlength="50">
					</td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" maxlength="50"></td>
				</tr>

				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="mail" maxlength="50"> <!-- @ <select
						name="mail">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
					</select> --></td>
				</tr>

				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td id="title">비밀번호 힌트</td>
					<td><input type="text" name="hint" /></td>
				</tr>
				<tr>
					<td id="title">비밀번호 힌트 답</td>
					<td><input type="text" name="answer" /></td>
				</tr>
			</table>
			<br> <input type="button" value="회원가입" onclick="signcheck()">
			&nbsp;&nbsp; <input type="reset" value="취&nbsp;&nbsp;소">
		</div>
	</form>
</body>
</html>