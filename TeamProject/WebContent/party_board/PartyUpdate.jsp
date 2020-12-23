<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
table {
	width: 600px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	border-top: 1px solid #ced4ea;
	border-left: 1px solid #ced4ea;
	border-right: 1px solid #ced4ea;
}
.party_btn {
	width: 100%;
	height: 30px;
	background: linear-gradient( to right, #d9a7c7, #fffcdc );
}

textarea {
  font-size: 24px;
  border: 2px solid black;
  padding: 1rem 1rem;
  min-height: 2em;
  border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
</style>
<%
request.setCharacterEncoding("UTF-8");
%>

<form action="/TeamProject/partyUpdate" method="post">
<table>
<caption class="neons"><h1>Party Board Update</h1></caption>
	<tr>
		<td align="left">NUM 
		<span><%=request.getParameter("party_num")%></span>
		</td>
		<td align="right">[PARTY]</td>
	</tr>
	<tr>
		<td>ID<br> <input type="text" name="party_id" class="party_b"
			value="<%=request.getParameter("party_id")%>" readonly /></td>
		<td>NAME<br> <input type="text" name="party_name" class="party_b"
			value="<%=request.getParameter("party_name")%>" readonly /></td>
	</tr>
	<tr>
		<td colspan="2">TITLE<br> <input type="text"
			placeholder="제목을 입력해주세요" name="party_title" class="party_a"
			value="<%=request.getParameter("party_title")%>"/></td>
	</tr>
	<tr>
		<td colspan="2">CONTENT<br><textarea
				placeholder="내용을 입력해주세요" name="party_content" class="party_c"><%=request.getParameter("party_content") %></textarea></td>
	</tr>
	<tr>
	
		<td colspan="2">
			<input type="submit" value="UPDATE" class="party_btn" />
			<input type="hidden" name="pg" value="<%=request.getParameter("pg")%>">
			<input type="hidden" name="party_num" value="<%=request.getParameter("party_num")%>">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="LIST"
			onclick="location.href='/TeamProject/partyList?pg=<%=request.getParameter("pg")%>'" class="party_btn" /></td>
	</tr>
</table>
	</form>
</body>
</html>