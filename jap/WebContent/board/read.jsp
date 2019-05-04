<%@page import="board.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board_content.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="css/read.css">
<link rel="stylesheet" href="../css/default.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/bbs.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="container">
		<div>
			<%
				String b_no = request.getParameter("board_no");
				String bcode = request.getParameter("bcode");
				Board_Content_DAO bbsDAO = new Board_Content_DAO();
				Board_DAO board_dao = new Board_DAO();
			
				Board_Content_DTO data = bbsDAO.Get_Board_Content(b_no,bcode);
				int board_no = 0;
				String board_name ="";
				try{
					if(b_no == null){
						
					}else{
						board_no = Integer.parseInt(b_no);
						board_name = board_dao.getboard_name(b_no);
					}
					
				}catch(Exception e){
				}
			%>
			
			<div class="title">
				<%=data.getTitle() %>
			</div>
			<div class="content">
				<%=data.getContents() %>
			</div>
			
			<div id="tag">
				<a href="#">#구글애널리틱스</a>
				<a href="#">#구글태그매니저</a>
			</div>
			
			<div id="content_footer">
				<div class="left">
					<ul>
						<li>좋아요</li>
						<li>댓글</li>
					</ul>
				</div>
				
				<div class="right">
					<ul class="shere">
						<li></li>
					</ul>
				</div>
			</div>
			<div id="category_list">
				<div class="title">&#39;<%=board_name %>&#39; 카테고리의 다른글</div>
				<ul>
				
		    		<%
		
		    			ArrayList<Board_Content_DTO> Bbs_List = bbsDAO.Board_List_Read(board_no,"bcode", "DESC", "5", 0,Integer.parseInt(bcode));
		    			
		    			for(int i = 0; i<Bbs_List.size(); i++){
		    				Board_Content_DTO list_data = Bbs_List.get(i);
		  			%>
					<li>
						<p class="Left">
							<span class="bcode"><%=list_data.getBcode() %></span>
							<a href="read.jsp?board_no=<%=list_data.getBoard_id() %>&bcode=<%=list_data.getBcode() %>"><%=list_data.getTitle()%></a><span>(0)</span>
						</p>
						<p class="right">
							<span><%=list_data.getHit_count()%> 읽음</span>
						</p>
					</li>
					
		  			<%
		  				}
		    		%>
				</ul>
			</div>
			
			<div class="content_footer">
				<div class="gLeft">
		 			<div>
		 				<a class="btn" href="list.jsp?board_no=<%=board_no%>">목록</a>
		 			</div>	
				</div>
				<div class="gRight">
				    <%
						String userID = null;
						if(session.getAttribute("userID") != null){
							userID = (String)session.getAttribute("userID");
						}
				    	if("jgh9514".equals(userID)){
				 	%>
			   			<div>
			   				<a class="btn" href="modify.jsp?board_no=<%=board_no%>&bcode=<%=bcode%>">수정</a>
			   			</div>	
			 			<div>
			 				<a class="btn" href="list.jsp?board_no=<%=board_no%>">삭제</a>
			 			</div>
				   	<%
				    	}
				    %>
				  	
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>