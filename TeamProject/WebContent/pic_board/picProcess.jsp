<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="/TeamProject/picInsert">

<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table style="text-align:center;">
			<tr>
				<td width="10%">이름</td>
				<td width="90%">
				<input name="board_name"  size="10" maxlength="8" value="${logOK.member_name}" readonly="true"/></td>
			</tr>
			<tr>
				<td width="10%">아이디</td>
				<td width="90%">
				<input name="board_id" size="10" maxlength="8" value="${logOK.member_id}" readonly="true"/></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="board_title"  size="50" maxlength="30"/></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="board_content" rows="10" cols="50"></textarea></td>
			</tr>
			 <tr>
     			<td>파일 업로드</td> 
     			<td><input type="file" name="board_content2" size="50" maxlength="50"/></td>
    		</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="글 등록" id="insertSubmit">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='/TeamProject/picList?pg=1'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>


</body>
</html>