<%@ page import="board.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>
<style>
	*{font-family: 'NeoDunggeunmo';}
	.form {
		width:550px;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
		
		border:2px solid #00008b;
		padding:0.5em;
		line-height:1em;
		border-radius:0.5em;
		-moz-border-radius:0.5em;
		-webkit-border-radius:0.5em;
	}
	th, td {
		padding:5px;
	}
	caption {
		margin-top:50px;
		margin-bottom:25px;
	}
	th, td {
		padding:5px;
	}
	.concept {
		width: 100px;
		height: 36px;
		font-size: 18px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #000;
		background-color: #fff;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
  	}

	.concept:hover {
		background-color: #00008b;
		box-shadow: 0px 15px 20px rgba(26, 109, 255, 0.4);
		color: #ffd700;
		transform: translateY(-7px);
	}
</style>
<script>
function checkBoardModify(){
	if(document.boardModifyForm.subject.value=="")
		alert("제목을 입력하세요");
	else if(document.boardModifyForm.content.value=="")
		alert("내용을 입력하세요");
	else
		document.boardModifyForm.submit();
}
</script>

<c:set var="dto" value="${requestScope.dto}"/>
<c:set var="pg" value="${requestScope.pg}"/>
<c:set var="seq" value="${requestScope.seq}"/>
<c:set var="log" value="${sessionScope.logOK}"/>
<br><br><br><br>
<form name="boardModifyForm" method="post" action="/TeamProject/freeupdate.do?seq=${seq}&pg=${pg}">

<table class="form">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" size="50"  value="${log.member_id}" readonly></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" size="50" value="${log.member_name}" readonly></td>
	</tr>	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" value="${dto.board_title}" size="50"></td>
	</tr>
	
	<tr>
		<td>내 용</td>
		<td><textarea name="content" cols="50" rows="15">${dto.board_content}</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" class="concept" value="글수정" onclick="checkBoardModify()">
		<input type="reset" class="concept" value="다시작성">
		</td>
		
	</tr>
</table>
</form>
</body>
</html>