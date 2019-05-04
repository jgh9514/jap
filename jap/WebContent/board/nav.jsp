<%@page import="java.util.ArrayList"%>
<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/nav.css">

<%
	Board_DAO board_DAO = new Board_DAO();
	ArrayList<Board_DTO> list =  board_DAO.Get_Board_Data();
%>
<div id="sub-tab">
    <ul>
        <li class="active"><a href="/jap/board/list.jsp">전체</a></li>
    <%
    	for(int i = 0; i < list.size(); i++){
    		Board_DTO Ary = list.get(i);
    %>
        <li><a href="/jap/board/list.jsp?board_no=<%=Ary.getBoard_id()%>"><%=Ary.getBoard_name()%></a></li>
    <%
    	}
    %>
    </ul>
</div>

