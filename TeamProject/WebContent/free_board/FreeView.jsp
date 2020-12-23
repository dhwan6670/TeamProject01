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
	table {
		width:600px;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
		border-collapse:collapse;
	}
	th, td {
		padding:2.5px;
	}
	tr {
		
	}

</style>
<script>
var httpRequest=null;
function writeCmt(){
	var form=document.getElementById("replyform");
	var boardnum=form.comment_boardnum.value;
	var id=form.comment_id.value;
	var content=form.comment_content.value;
	
	if(!content){
		alert("내용을 입력해주세요.");
		return false;
	}else{
		location.href="/TeamProject/comment.do?comment_boardnum="+boardnum+"&comment_id="+id+"&comment_content="+content;
	}
}
function updateOpen(comment_num, comment_boardnum){
	window.name="parentForm"
	window.open("commentUpdate.do?num="+comment_num+"&boardnum="+comment_boardnum,"updateForm","width=570,height=350,resizable=no,scrollbars=no")
}
function replyOpen(comment_num, comment_boardnum){
	window.name="parentForm";
	window.open("commentReply.do?num="+comment_num+"&boardnum="+comment_boardnum,"replyForm","width=570,height=350,resizable=no,scrollbars=no")

}
</script>

<c:set var="dto" value="${requestScope.dto}"/>
<c:set var="pg" value="${requestScope.pg}"/>
<c:set var="num" value="${requestScope.num}"/>
<div id="view">
<br><br><br><br>
<table width="750" align="center">
<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>

<tr>
	<td colspan="3"><font size="5">${dto.board_title}</font></td>
</tr>

<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>
<tr>
	<td width="150">글번호 : ${dto.board_num}</td>
	<td width="200">작성자 : ${dto.board_id}</td>
	<td width="150">조회수 : ${dto.board_hit}</td>
</tr>
<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>

<tr>
	<td colspan="3" height="200" valign="top"><pre>${dto.board_content}</pre></td>
</tr>

<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>
</table>

<table>
<tr>
<td><input type="button" value="목록" onclick="location.href='freelist.do?pg=${pg}'"></td>
<c:set var="log" value="${sessionScope.logOK}"/>
<c:if test="${log.member_id==dto.board_id}">

<td align="center"><input type="button" value="글수정" onclick="location.href='freemodify.do?num=${num}&pg=${pg}'"></td>
<td align="right"><input type="button" value="글삭제" onclick="if(confirm('삭제하시겠습니까?')){location.href='freedelete.do?num=${num}&pg=${pg}'}"></td>

</c:if>
</tr>
</table>
<br><br>

<c:if test="${requestScope.list!=null}">
	<c:forEach var="comment" items="${requestScope.list}">
		<table width="750" align="center" border="1">
			<tr>
				<td width="150">
					<c:if test="${comment.comment_level>1}">
						&nbsp;&nbsp;
						<img src="images/reply.png">
					</c:if>
					${comment.comment_id}<br>
					<span style='font-color:gray'><fmt:formatDate value="${comment.comment_date}" pattern="yy.MM.dd HH:mm"/></span>
				</td>
				<td width="500">
					${comment.comment_content}
				</td>
				<td width="100">
					<c:if test="${!empty log}">
					<input type="button" value="답변" onclick="replyOpen(${comment.comment_num},${comment.comment_boardnum})"><br>
					</c:if>
					<c:if test="${comment.comment_id==log.member_id}">
						<input type="button" value="수정" onclick="updateOpen(${comment.comment_num},${comment.comment_boardnum})"><br>
						<input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?')){location.href='commentDelete.do?comment_num=${comment.comment_num}&comment_boardnum=${comment.comment_boardnum}'}">
					</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
<c:if test="${log.member_id!=null}">
	<table width="750" align="center">
		<tr>
		<form id="replyform">
			<td>
				${log.member_id}
				<input type="hidden" name="comment_boardnum" value="${dto.board_num}">
				<input type="hidden" name="comment_id" value="${log.member_id}">
			</td>
			<td>
				<textarea name= "comment_content" rows="4" cols="70"></textarea>			
			</td>
			<td>
				<input type="button" value="댓글 등록" onclick="writeCmt()">
			</td>
		</form>
		</tr>
	</table>
</c:if>
		
</div>
</body>
</html>




