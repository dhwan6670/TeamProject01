<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
form{
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

</style>
</head>
<body>
	<form name="idsearchend" method="post">
		<table align="center">
			<tr>
				<td>
					<%
						LoginDto dto = (LoginDto) request.getAttribute("ob");
						if (dto.getMember_id() != null) {
					%>
					<table style="font-size: 30px;">
						<tr align=center>
							<td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
						</tr>
						<tr align=center>
							<td style="font-size: 20px"><%=dto.getMember_id()%></td>
						</tr>
					</table> 
					<%
 						} else {
 					%>
					<table style="font-size: 30px;">
						<tr align=center>
							<td style="height: 170px">* 아이디 찾기를 실패하셨습니다. *</td>
						</tr>
						<tr align=center>
							<td><input type="button" value="돌아가기"
								onClick="history.back()"></td>
						</tr>
					</table> 
					<%
 						}
 					%>
		</table>
	</form>
</body>
</html>