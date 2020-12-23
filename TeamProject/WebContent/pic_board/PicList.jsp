<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>

<style>

.PicBoard_title{
margin-top:25px;
font-family: 'NeoDunggeunmo';
text-align: center;
}

.PicBoard_noItem{
text-align: center;
padding: 20px;
font-family: 'NeoDunggeunmo';
}

.PicDetail_btn:hover{
cursor: pointer;
color: orange;
}

.PicBoard_yesItem{
text-align:  center;
font-family: 'NeoDunggeunmo';
}

.PicBoard_table{
margin-left: auto;
margin-right: auto;
font-family: 'NeoDunggeunmo';
width: 100%;
}

.PicBoard_writeBtn{
	float: right;
	margin-right: 25%;
}

.pic_body{
	margin-left: 25%;
	width: 50%;
}

.pic_preview{
	width: 50px;
}
.pic_preview:hover{
	cursor: pointer;
}
</style>
<script>

</script>

<body>
<br/>
	<hr/>
	<h1 class="PicBoard_title">짤 게시판</h1>
		
	<br/>
	<br/>
	<br/>
	<div>
	<br/>
	<input type="button" value="글 작성" onClick="location.href='pic_board/PicInsert.jsp'" class="PicBoard_writeBtn"><br/>
	<div class="pic_body">
		
	<table border=1 style="margin-left: auto; margin-right: auto; width:100%;" class="Picboard_table">
		<tr >
			<th width="6%">글번호</th>
			<th width="15%">미리보기</th>
			<th>제목</th>
			<th width="15%">작성자</th>
			<th width="10%">작성날짜</th>
			<th width="6%"><img src="./images/good.png" height="30px;" width="30px"></th>
		</tr>
	
		<c:if test="${empty list}">
		 
			<td colspan="6" class="PicBoard_noItem" >작성된 글이 없습니다.</td>
			
		</c:if>
		
		<c:if test="${!empty list}">
			<c:forEach var="ob" items="${list}">
				<tr class="PicBoard_yesItem">
					<td>${ob.board_num}</td>
					<td><img class="pic_preview" src="/TeamProject/storage/${ob.board_content2}" onClick="location.href='/TeamProject/picView?board_num=${ob.board_num}&pg=${pg}'"></td>
					<td class="PicDetail_btn" onClick="location.href='/TeamProject/picView?board_num=${ob.board_num}&pg=${pg}'">${ob.board_title}</td>
					<td>${ob.board_id}</td>
					<td>${ob.board_date}</td>
					<td>${ob.board_rec}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	</div>
	
</body>
