<%@page import="board_content.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<% 
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-kk-mm", Locale.KOREA);
	String bdate = sdf.format(today);
	

	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	String board_no = request.getParameter("board_no");
	String bcode = request.getParameter("bcode");
	String contents = request.getParameter("contents");
	String title = request.getParameter("title_input");
	
%>

<c:set var="userID" value="<%=userID%>" />
<c:set var="board_no" value="<%=board_no%>" />
<c:set var="userID" value="<%=userID%>" />
<c:set var="bdate" value="<%=bdate%>" />
<c:set var="title" value="<%=title%>" />

<jsp:useBean id="Bbs_data" class="board_content.Board_Content_DTO" scope="page"/>
<jsp:setProperty name="Bbs_data" property="board_id" value="${board_no}"/>
<jsp:setProperty name="Bbs_data" property="title" value="${title}"/>
<jsp:setProperty name="Bbs_data" property="contents" />
<jsp:setProperty name="Bbs_data" property="bcode"/>
<jsp:setProperty name="Bbs_data" property="userId" value="${userID}"/>
<jsp:setProperty name="Bbs_data" property="bdate" value="${bdate}"/>
<jsp:setProperty name="Bbs_data" property="hit_count" value="0" />
<jsp:setProperty name="Bbs_data" property="vote_count" value="0"/>

<%

	PrintWriter script = response.getWriter();
	Board_Content_DAO BbsDAO = new Board_Content_DAO();
	int result = BbsDAO.Content_Update(Bbs_data);
	
	if(result == -1){
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert('글 수정이 완료되었습니다.')");
		script.println("location.href = 'read.jsp?board_no=" + board_no + "&bcode=" + bcode + "'");
		script.println("</script>");
	}
%>