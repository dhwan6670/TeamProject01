<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp"%>
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
#wrap{
	padding: 3px;
	width: 800px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
	border: 3px solid gray;
}

</style>
<script type="text/javascript">
	function logincheck() {
		loginInfo = eval("document.loginInfo");
		if (document.loginInfo.id.value == "") {
			alert("아이디를 입력하세요");
			document.loginInfo.id.focus();
			return;
		}
		if (document.loginInfo.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.loginInfo.pwd.focus();
			return;
		}
		document.loginInfo.submit();
	}
</script>
<style>
	*{font-family: 'NeoDunggeunmo';}
</style>
<form name="loginInfo" action="/TeamProject/login.do" method="post">
	<div id="wrap">
		<br> <br> <b><font size="8" color="gray">로그인</font></b> <br>
		<br> <br>
		<table border="0" id="tb">
			<tr>
				<td><font size = "5">아이디</font></td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td><font size = "5">비밀번호</font></td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="로그인"
					onclick="logincheck()"> <input type="button"
					value="취&nbsp;&nbsp;소" onclick="location.href='/TeamProject/home.jsp'"></td>
			</tr>
			<tr>
				<td colspan = "2" align="center">
					<input type = "button" value = "아이디 찾기" onclick="location.href='/TeamProject/user/searchId.jsp'">
					<input type="button" value = "비밀번호 찾기"  onclick="location.href='/TeamProject/user/searchpwd.jsp'">
					</td>
					</tr>
		</table>
	</div>
</form>
</body>
</html>