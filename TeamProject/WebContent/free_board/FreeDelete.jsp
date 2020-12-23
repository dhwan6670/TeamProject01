<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>
<c:set var="pg" value="${requestScope.pg}"/>
<body onload="alert('삭제되었습니다'); location.href='/TeamProject/freelist.do?pg=${pg}'">

</body>
</html>