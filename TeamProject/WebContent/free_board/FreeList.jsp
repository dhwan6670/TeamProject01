<%@page import="board.dto.FreePaging"%>
<%@page import="board.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../menu.jsp"/>
<style>
	*{font-family: 'NeoDunggeunmo';}
	h1 {
		padding-top:100px;
	}
	table {
		width:600px;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
		border-collapse:collapse;
	}
	caption {
		margin-top:50px;
		margin-bottom:25px;
	}
	th, td {
		padding:5px;
	}
	tr {
		
	}
	.wrap {
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.write {
		width: 140px;
		height: 45px;
		font-size: 11px;
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

	.write:hover {
		background-color: #00008b;
		box-shadow: 0px 15px 20px rgba(26, 109, 255, 0.4);
		color: #ffd700;
		transform: translateY(-7px);
	}
	
</style>
<script>
function checkLogin(id,num,pg){
	if(id=='null'){
		alert("먼저 로그인해주세요");
	}else{
		location.href="/TeamProject/freeview.do?num="+num+"&pg="+pg;
	}
	
}
</script>
<c:set var="list" value="${requestScope.list}"/>
<c:set var="pg" value="${requestScope.pg}"/>
<c:set var="paging" value="${requestScope.paging}"/>

<table>
<caption>
<img src="./free_image/free.jpg">
</caption>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">조회수</th>
		<th width="100">작성일</th>
	</tr>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
	<c:if test="${!empty list}">
	<c:forEach items="${list}" var="ob">

	<tr>
		<td align="center">${ob.board_num}</td>
		<td align="center">
		<a href="#" onclick="checkLogin('${ob.board_id}','${ob.board_num}','${pg}')" class="subjectA">${ob.board_title}</a>
		</td>
		<td align="center">${ob.board_id}</td>
		<td align="center">${ob.board_hit}</td>
		<td align="center"><fmt:formatDate value="${ob.board_date}" pattern="yyyy.MM.dd"/></td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="cccccc"></td>
	</tr>

	</c:forEach>
	</c:if>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
	<c:set var="entity" value="${sessionScope.logOK}"/>
	<c:if test="${!empty entity}">
	<tr>
		<td colspan="5" align="right"><br><div class="wrap"><input type="button" class="write" onclick="location.href='/TeamProject/free_board/FreeWrite.jsp'" value="글쓰기"></div></td>
	</tr>
	</c:if>
	<tr>	
		<td colspan="5" align="center">${paging.pagingHTML}</td>
	</tr>
	<tr>
		<td colspan="5" align="center"><img src="./free_image/chasing.gif" width=300px height=100px;></td>
	</tr>
</table>
</body>
</html>
