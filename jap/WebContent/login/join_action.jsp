<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<% String users = request.getParameter("jap_User_id"); %>
<% String pwc = request.getParameter("jap_User_pw_check"); %>
<% String name = request.getParameter("jap_User_name"); %>
<% String gender = request.getParameter("is_sex"); %>
<% String mobile = request.getParameter("mobile"); %>
<% String birth = request.getParameter("birth"); %>

<% 
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.KOREA);
	String tes = sdf.format(today);

%>

<jsp:useBean id="user" class="user.UserDTO" scope="page"/>
<jsp:setProperty name="user" property="regist_date" value="<%=tes%>"/>
<jsp:setProperty name="user" property="userId" value="<%=users%>"/>
<jsp:setProperty name="user" property="userPassword" value="<%=pwc%>" />
<jsp:setProperty name="user" property="userName" value="<%=name%>"/>
<jsp:setProperty name="user" property="userDate" value="<%=birth%>" />
<jsp:setProperty name="user" property="userGender" value="<%=gender%>" />
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPhone" value="<%=mobile%>"/>

	<%
		out.println(user.getUserDate());
		UserDAO userdao = new UserDAO();
		int result = userdao.join(user);
		PrintWriter script = response.getWriter();
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>