<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% session.setAttribute("test", "SessionTest"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/default.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/header.js"></script>
		<title>웹개발자 전길환2</title>
	</head>
	<body ondragstart="return false" oncontextmenu="return false" onselectstart="return false">
		<jsp:include page="header.jsp"></jsp:include>
	    
	    <jsp:include page="footer.jsp"></jsp:include>
	   
		<c:set var="number" value="1" />
		<c:set var="errmsg" value="오류발생" />
		
		
		<c:forEach begin="1" end="5" step="1" var="i">
			수량 : ${i}, 퍼센트 : <fmt:formatNumber value="${number/i}" type="percent" groupingUsed="false" /><br/>
			<c:catch var="errmsg" />
		</c:forEach>
		
		<c:set var="Date" value="<%=new java.util.Date() %>"/>
		
		<fmt:formatDate value="${Date}" type="date" dateStyle="full" /><br/>
		<fmt:formatDate value="${Date}" type="date" dateStyle="short" /><br/>
		<fmt:formatDate value="${Date}" type="time" /><br/>
		<fmt:formatDate value="${Date}" type="both" dateStyle="full" timeStyle="full"/><br/>
		<fmt:formatDate value="${Date}" pattern="z a h:mm" /><br/>
		
	</body>
</html>