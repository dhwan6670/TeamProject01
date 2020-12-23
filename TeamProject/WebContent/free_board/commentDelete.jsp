<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>
<c:set var="boardnum" value="${requestScope.comment_boardnum}"/>
<body onload="alert('삭제되었습니다.'); location.href='freeview.do?num=${boardnum}&pg=1'">

</body>
</html>