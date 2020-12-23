<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../menu.jsp"%>
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
	border: 3px solid black;
}
</style>
<script type="text/javascript">
	function pwdsearch() {
		searchpwd = eval("document.searchpwd");
		if (document.searchpwd.id.value == "") {
			alert("아이디를 입력하세요");
			document.searchpwd.id.focus();
			return;
		}
		if (document.searchpwd.name.value == "") {
			alert("이름을 입력하세요");
			document.searchpwd.name.focus();
			return;
		}
		if (document.searchpwd.phone.value == "") {
			alert("전화번호를 입력하세요");
			document.searchpwd.phone.focus();
			return;
		}
		document.searchid.submit();
	}
</script>

<form name="searpwd" action="/TeamProject/searchpwd.do" method="post">
	<div id="wrap">
	<br><br><b><font size="8" color="gray">비밀번호 찾기</font></b><br><br>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type = "text" name = "id"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="찾&nbsp;&nbsp;기" onclick="pwdsearch()"> <input type="button"
					value="취&nbsp;&nbsp;소"
					onclick="location.href='/TeamProject/home.jsp'">
		</table>
	</div>
</form>
</body>
</html>