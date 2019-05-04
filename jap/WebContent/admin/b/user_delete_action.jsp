<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>


<jsp:useBean id="admin" class="admin.AdminDTO" scope="page"/>
<jsp:setProperty name="admin" property="ord" />
<jsp:setProperty name="admin" property="sort" />
<jsp:setProperty name="admin" property="page" />
<jsp:setProperty name="admin" property="rows" />


<% String users[] = request.getParameterValues("check_box"); %>
<%

	String SQL = "DELETE FROM [dbo].[jap.user] WHERE userId in (";
	for(int i = 0; i<users.length; i++){ 
		
		SQL = SQL + "'" + users[i] + "'";
		
		if(i+1 != users.length){
			SQL = SQL + ",";
		}
	}
	SQL = SQL + ")";

	UserDAO user_dao = new UserDAO();
	
	int result = user_dao.user_delete(SQL);
	PrintWriter script = response.getWriter();
	
	if(result == -1){
		script.println("<script>");
		script.println("alert('오류발생')");
		script.println("window.history.back()");
		script.println("</script>");
	}else{
		String Ord_default = admin.getOrd();
		String Sort_default = admin.getSort();
		String Rows_default = admin.getRows();
		int Page_default = admin.getPage();
		if(Ord_default == null) Ord_default = "regist_date";
		if(Sort_default == null) Sort_default = "DESC";
		if(Rows_default == null) Rows_default = "20";
		if(Page_default == 0) Page_default = 1;
	%>
		<form name="form1" method="post" action="member.jsp">
			<input type="hidden" name="ord" value="<%=Ord_default%>">
			<input type="hidden" name="sort" value="<%=Sort_default%>">
			<input type="hidden" name="page" value="<%=Page_default%>">
			<input type="hidden" name="rows" value="<%=Rows_default%>">
		</form>
		<script>
			var form1 = document.forms['form1'];			
			form1.submit();
		</script>
	<%
	}
%>