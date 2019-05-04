<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
%>
<c:set var="userID" value="<%=userID%>"/>

<link rel="stylesheet" href="/jap/css/header.css">
<nav>
	<span class="logo"><img src="/jap/image/logo.png" width="70px"/></span>
    <div id="navigation">
    	<p>보유기술 > 일반</p>
        <h1>개발자 전길환.<span>▼</span></h1>
    </div>
    
    <div class="float_right top_right_menu">
	    <div id="dropdown"></div>
	    <ul class="menu_list">
	    <c:choose>
		    <c:when test="${userID != null}">
	    		<li><a href="/jap/login/logout.jsp">Logout</a></li>
	    		<!--<li>My Page</li>  -->
		    </c:when>
		    <c:otherwise>
	    		<li><a href="/jap/login/login.jsp">Login</a></li>
		    </c:otherwise>
	    </c:choose>
	    
	    </ul>
    </div>
</nav>

<div id="top_banner">
	<p class="text_01">보유기술 > 일반</p>
	<p class="text_02">Google Analytics</p>
</div>

