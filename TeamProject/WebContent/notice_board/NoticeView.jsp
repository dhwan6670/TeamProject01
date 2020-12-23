<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../style.css" rel="stylesheet">
<c:import url="../menu.jsp"/>
<style>
*{font-family: 'NeoDunggeunmo';}
a{
	text-decoration: none;
}
#view_textarea{
	border: 0;
	background-color:#e9ecef;
	border-radius: 30px 30px 30px 30px;
	resize: none;
	outline-style: none;
	padding: 13px;
	font-size: 12px;
	width: 600px;
	height: 150px;
	overflow: auto;
}	
#view_table{
	border: 0;
	width: 600px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
	border-left: 1px solid #ced4ea;
	border-right: 1px solid #ced4ea;
	}
#ref_table{
	border: 0;
	width: 600px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
}
#after_login{
	width: 600px;
	height: 80px;
	margin-left: auto;
	margin-right: auto;
}
.view_right_left{margin-bottom: 12px;}
#view_right_content{
font-size: 20px;
font-weight: bold;
border-radius: 30px 30px 30px 30px;
padding: 13px;

}
#view_left_content{
font-size: 20px;
font-weight: bold;
border-radius: 30px 30px 30px 30px;
padding: 13px;
}
h1{
	font-family: 'NeoDunggeunmo',cursive;
	margin: 0 0 0.5em 0;
	text-align: center;
}
.view_a {
	width: 600px;
	font-size: 20px;
}

.view_b {
	width: 290px;
	font-size: 20px;	
}
.party_content{
	height: 300px;
	width: 600px;
	font-size: 18px;
}
.view_textarea{
	height: 150px;
	width: 600px;
	font-size: 18px;
}
.ref_bottom{
	font-size: 14px;
}
.insert_ref{
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}
.party_btn{
	width: 100%;
	height: 30px;
}
textarea {
  border: 2px solid black;
  padding: 1rem 1rem;
  overflow:auto;
  resize:none;
  outline:none;
  min-height: 2em;
  border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
.all{
border: 2px solid black;
border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
}
</style>
<table id="view_table">
<caption class="neons"><h1>Notice View</h1></caption>
	<tr>
		<td align="left">${ob.board_num}번 글</td>
		<td align="right">[NOTICE]</td>
	</tr>
	<tr>
		<td>ID<br> <input type="text" name="id" class="view_b"
			value="${ob.board_id}[관리자]" readonly /></td>
		<td>NAME<br> <input type="text" name="name" class="view_b"
			value="${ob.board_name}" readonly /></td>
	</tr>
	<tr>
		<td colspan="2">TITLE<br> <input type="text"
			placeholder="제목을 입력해주세요" name="party_title" class="view_a"
			value="${ob.board_title}" readonly /></td>
	</tr>
	<tr>
		<td colspan="2">CONTENT<br> <textarea
				placeholder="내용을 입력해주세요" name="party_content" class="party_content" readonly>${ob.board_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button"
			onclick="location.href='/TeamProject/noticeList'" class="party_btn" >LIST</button></td>
	</tr>
	<c:if test="${ob.board_id==logOK.member_id}">
	<tr>
		<c:if test="${logOK.member_admin==0}">
			<td>
		<form action="notice_board/NoticeUpdate.jsp" method="post">
				<input type="submit" value="UPDATE" class="party_btn">
				<input type="hidden" name="notice_num" value="${ob.board_num}" readonly/>
				<input type="hidden" name="notice_code" value="${ob.board_code}" readonly/>
				<input type="hidden" name="notice_id" value="${ob.board_id}" readonly/>
				<input type="hidden" name="notice_name" value="${ob.board_name}" readonly/>
				<input type="hidden" name="notice_title" value="${ob.board_title}"/>
				<input type="hidden" name="notice_content" value="${ob.board_content}"/>
		</form>
			</td>
			<td>
		<form action="/TeamProject/noticeDelete" method="get">
				<button type="submit" onclick="return confirm('삭제할까요?')" class="party_btn">DELETE</button>
				<input type="hidden" name="notice_num" value="${ob.board_num}"/>
		</form>	
			</td>
		</c:if>
	</tr>
	</c:if>
</table>
</body>
</html>