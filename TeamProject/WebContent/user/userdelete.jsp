<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp"%>
<head>
<title>탈퇴 화면</title>

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
	margin-left: auto;
	margin-right: auto;
	border: 3px solid gray;
}

td {
	border: 1px solid gray
}

#title {
	background-color: gray
}
</style>

<script type="text/javascript">
	function checkValue() {
		if (!document.deleteform.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		document.deleteform.submit();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원 탈퇴</font></b> <br>
		<br> <br>

		<form name="deleteform" method="get"
			action="/TeamProject/userDelete.do" onsubmit="return checkValue()">

			<table>
				<tr>
					<td id="title">아이디</td>
					<td id="title"><input type="text"
						value="<%=entity.getMember_id()%>" name="id" readonly></td>
				</tr>
				<tr>
				<tr>
					<td bgcolor="gray">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>

			<br> <input type="button" value="취소"
				onclick="TeamProject/home.jsp"> <input type="submit"
				value="탈퇴" onclick="return confirm('탈퇴하겠습니까?')" />
		</form>
	</div>
</body>
</html>