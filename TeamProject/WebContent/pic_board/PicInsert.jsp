<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp" />
<style>
.submit_btn{
	margin-left: 17%;
    width: 100%;
    margin-right: 17%;
    margin-top: 3%;
    margin-bottom: 3%;
    
}
.pic_insert{
	margin-right: 20%;
    margin-left: 20%;
    width: 100%;
    margin-bottom: 3%;
    
}
.insert_form{
padding: 30px;
	background: #f3f3f3;
    border-radius: 15px;
}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>PicBoardInsert</title>
</head>
<body>
	<div align="center">
		<br />
		<br />
		<table>
			<tr>
				<td height="25" align="center">[사진 선택 페이지]</td>
			</tr>
		</table>
		<br />
		<form method="post" action="picUpload.jsp"
			enctype="multipart/form-data">

			
			<table class="insert_form">
				<tr>
					<td ><input type="file" name="board_content2" class="pic_insert" size="50" maxlength="50"></td>
				</tr>

				<tr>
					<td colspan="2"><hr /></td>
				</tr>
				<tr>
					<td><input type="submit" class="submit_btn" value="사진 업로드 후 게시물 작성으로 이동" width="100%"></td>
				</tr>
				<tr>
					<td><input type="reset" value="다른 사진 선택"></td> 
					<td><input type="button" value="리스트로 이동" onClick="javascript:location.href='/TeamProject/picList?pg=1'"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>