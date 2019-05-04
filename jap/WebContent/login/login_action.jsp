


<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="regist_date" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userDate" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPhone" />

	<%
		UserDAO user_data = new UserDAO();
		int result = user_data.login_check(user.getUserId(), user.getUserPassword());
		PrintWriter script2 = response.getWriter();
		String returnUrl = request.getParameter("returnUrl")==null ? "" : request.getParameter("returnUrl");
		if(returnUrl == null  || returnUrl.equals("null")){
			returnUrl = "../board/list.jsp";
		}
		script2.println("<!DOCTYPE html>");
		script2.println("<title>로그인페이지</title>");
		if(result == 1){
			session.setAttribute("userID", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='" + returnUrl +"'" );
			script.println("</script>");
			
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 접속 오류가 발생했습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			
		}
	%>