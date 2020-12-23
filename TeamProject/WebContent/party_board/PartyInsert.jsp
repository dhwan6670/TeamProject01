<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
table{
	box-shadow: 5px 5px 5px 5px gray;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
}
.party_btn{
	width: 100%;
	height: 30px;
	background: linear-gradient( to right, #d9a7c7, #fffcdc );
}
textarea {
  border: 2px solid black;
  padding: 1rem 1rem;
  outline:none;
  min-height: 2em;
  border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
</style>
<form method="post" action="/TeamProject/partyInsert">
	<table>
<caption class="neons"><h1>Party Board Write</h1></caption>
	<%--로그인시 아이디와 이름 받아온후 readonly 설정하기 --%>
		<tr>
			<td>ID<br>
			<input type="text" name="id" class="party_b" value="${logOK.member_id}" readonly/></td>
			<td>NAME<br>
			<input type="text" name="name" class="party_b" value="${logOK.member_name}" readonly/></td>
		</tr>
		<tr>
			<td colspan="2">TITLE<br>
			<input type="text" placeholder="제목을 입력해주세요" name="party_title" class="party_a" /></td>
		</tr>
		<tr>
			<td colspan="2">CONTENT<br>
			<textarea placeholder="내용을 입력해주세요" name="party_content" class="party_c"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="party_btn">등록</button> 
			<button type="button" onclick="location.href='/TeamProject/partyList?pg=1'" class="party_btn">취소</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>