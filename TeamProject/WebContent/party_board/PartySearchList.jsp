<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
a{
	text-decoration: none;
	color: black;
}
a:hover{
	color: gray;
}
	table{
		position:static;
		margin-bottom: 5px;
 		width: 900px; 
		border: 2px solid black;
		margin-left: 5%;
		font-size: 20px;
		border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
	}
	
	td{
		padding: 5px;
	}
	
	h1{
	font-family: 'NeoDunggeunmo',cursive;
	font-size: 3em;
	margin: 0 0 0.5em 0;
	text-align: center;
}
.list_table{
border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
.fix_btn{
	border: 1px solid black;
	position: static;
	margin-top:188px;
	margin-left:20%;
	width:100px;
	height:150px;
	text-align: center;
	float: left;
	border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
.fix_btn button{
	width:50px;
	height: 35px;
	margin-top: 25%;
	margin-bottom: auto;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
<div class="fix_btn">
	<span>[PARTY]</span>
	<c:if test="${!empty logOK}">
	<a href="party_board/PartyInsert.jsp"><button class="party_btn">WRITE</button></a>
	</c:if>
	<a href="/TeamProject/bestBoard"><button class="party_btn">HOME</button></a>
</div>
<table class="list_table">
<caption class="neons"><h1>Party Board List</h1></caption>
	<tr>
		<td align="right" width="150px" colspan="7" style="border-bottom: 1px solid gray;">
		<form action="/TeamProject/partySearchList" method="post">
		<select name="combo">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="titlecontent">제목+내용</option>
			<option value="id">아이디</option>
		</select>
		<input type="text" placeholder="검색" name="search">
		<button type="submit" name="search_btn" class="party_btn">검색</button>
		<input type="hidden" name="pg" value="${pg}">
		</form>
		</td>
	</tr>
	<tr align="center" style="border-bottom: 1px solid gray;">
		<td width="10%">NUM</td>
		<td width="40%">TITLE</td>
		<td width="10%">ID</td>
		<td width="15%">SYSDATE</td>
		<td width="9%">HIT</td>
		<td width="9%">REFLE</td>
		<td width="9%" style="color: red;">♥</td>
	</tr>
<c:if test="${!empty list}">
	<c:forEach var="ob" items="${list}">
	<tr align="center" class="tr1">
		<td>${ob.board_num}</td>
		<c:if test="${!empty logOK}">
		<td><a href="/TeamProject/partyView?num=${ob.board_num}&pg=${pg}">${ob.board_title}</a></td>
		</c:if>
		<c:if test="${empty logOK}">
		<td><a href="login/login.jsp" onclick="return confirm('로그인 해주세요')">${ob.board_title}</a></td>
		</c:if>
		<td>${ob.board_id}</td>
		<td>${ob.board_date}</td>
		<td>${ob.board_hit}</td>
		<td>${ob.board_reply}</td>
		<td>${ob.board_rec}</td>
	</tr>
	</c:forEach>
</c:if>	
</table>

</body>
</html>