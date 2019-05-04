<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="user.UserDAO"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	String user_id = request.getParameter("jap_user_id");
	UserDAO userdao = new UserDAO();
	int result = userdao.id_check(user_id);
	if(result != 0){
		out.println("<div id ='one'>이미 사용중인 아이디 입니다.</div>");
	}else{
		out.println("<div id ='one'></div>");
	}
%>