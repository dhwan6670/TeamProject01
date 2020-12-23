<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../menu.jsp"/>
<c:set var="n" value="${requestScope.n}"/>
<c:url var="url1" value="freelist.do?pg=1"/>
<c:if test="${n>0}">
	<c:redirect url="${url1}"/>
</c:if>
<%@include file="../footer.jsp"%>
</body>
</html>