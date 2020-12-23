<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp"%>
<title>회원정보 수정화면</title>

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
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            if (document.userInfo.password.value != document.signupfrm.passwordcheck.value) {
    			alert("비밀번호를 동일하게 입력하세요.");
    			return;
    		}
            document.userInfo.submit();
        }
        
    </script>

</head>
<body>
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원정보 수정</font></b>
		<br> <br> <br>

		<form method="post" action="/TeamProject/userUpdate.do"
			name="userInfo" onsubmit="return checkValue()">

			<table>
				<tr>
					<td id="title">아이디</td>
					<td id="title"><input type="text"
						value="<%=entity.getMember_id()%>" name="id" readonly></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"
						value="<%=entity.getMember_password()%>"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="passwordcheck" maxlength="50"
						value=""></td>
				</tr>
			</table>
			<br> <br>
			<table>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" maxlength="50"
						value="<%=entity.getMember_name()%>"></td>
				</tr>

				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="mail" maxlength="50"
						value="<%=entity.getMember_email()%>"></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="phone"
						value="<%=entity.getMember_phone()%>" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" size="50" name="address"
						value="<%=entity.getMember_address()%>" /></td>
				</tr>
				<tr>
					<td id="title">비밀번호 힌트</td>
					<td><input type="text" size="50" name="hint"
						value="<%=entity.getMember_hint()%>" /></td>
				</tr>
				<tr>
					<td id="title">힌트 답</td>
					<td><input type="text" size="50" name="answer"
						value="<%=entity.getMember_answer()%>" /></td>
				</tr>
			</table>
			<br> <br> <input type="button" value="취소"
				onclick="main.jsp'"> <input type="submit" value="수정" />
		</form>
	</div>
</body>
</html>