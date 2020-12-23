<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{font-family: 'NeoDunggeunmo';}
@-webkit-keyframes rotate {
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
	border: 3px solid gray;
}

td {
	border: 1px solid gray
}

#title {
	background-color: gray
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "wrap">
	<br>
	<br>
	<b><font size="6" color="gray">탈퇴 완료</font></b>
	<br>
	<br>
	<br>
	<form method="post" action="/TeamProject/logout.do">

		<table>
			<tr>
				<td id="title">아이디</td>
				<td id="title"><input type="text"
					value="<%=entity.getMember_id()%>" name="id" readonly></td>
				<td>님 탈퇴가 완료되었습니다</td>
			</tr>
		</table>
		<br> <input type="submit" value="탈퇴 확인" onclick="home.jsp" />
	</form>
	</div>
</body>
</html>