<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
.notice_table{
border: 1px solid black;
margin-left: auto;
margin-right: auto;
width: 600px;
}
</style>
<table class="notice_table">
<caption class="neons"><h1>Notice List</h1></caption>
	<tr>
		<c:if test="${logOK.member_admin==0}">
			<c:if test="${count<11}">
		<td><button type="button" onclick="location.href='notice_board/NoticeInsert.jsp'">WRITE</button></td>
			</c:if>
		</c:if>
		<td align="right"><button type="button" onclick="location.href='home.jsp'">HOME</button></td>
	</tr>
</table>    
<table class="notice_table">
	<tr align="center">
		<td>NUM</td>
		<td>TITLE</td>
		<td>ID</td>
		<td>SYSDATE</td>
		<td>HIT</td>
	</tr>
	<c:if test="${!empty list}">
	<c:forEach var="ob" items="${list}">
	<tr align="center">
		<td>${ob.board_num}</td>
		<td><a href="/TeamProject/nView?num=${ob.board_num}">${ob.board_title}</a></td>
		<td>${ob.board_id}[관리자]</td>
		<td>${ob.board_date}</td>
		<td>${ob.board_hit}</td>
	</tr>
	</c:forEach>
	</c:if>
</table>