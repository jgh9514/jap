<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="user.UserDAO"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	String user_mobile = request.getParameter("mobile");
	UserDAO userdao = new UserDAO();
	int result = userdao.mobile_check(user_mobile);
	if(result != 0){
		out.println("<div id ='one'>�ش� �ڵ�����ȣ�� ������ ���̵� �����մϴ�.</div>");
	}else{
		out.println("<div id ='one'></div>");
	}
%>