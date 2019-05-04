<%@page import="paging.*"%>
<%@page import="board_content.*"%>
<%@page import="admin.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:useBean id="Sort" class="paging.Sort" scope="page"/>
<jsp:setProperty name="Sort" property="ord" />
<jsp:setProperty name="Sort" property="sort" />
<jsp:setProperty name="Sort" property="page" />
<jsp:setProperty name="Sort" property="rows" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/bbs.js"></script>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String b_no = request.getParameter("board_no");
		int board_no = 0;
		try{
			if(b_no == null){
				
			}else{
				board_no = Integer.parseInt(b_no);
			}
			
		}catch(Exception e){
		}
		if(board_no < 0){
			script.println("<script>");
			script.println("alert('해당 게시판은 존재하지 않습니다.')");
			script.println("</script>");
		}
		

		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		String path = this.getClass().getSimpleName().replaceAll("_", ".");
		
		if(b_no != null){
			path += "?board_no="+b_no;
		}

		String Ord_default = Sort.getOrd();
		String Sort_default = Sort.getSort();
		String Rows_default = Sort.getRows();
		int Page_default = Sort.getPage();
		if(Ord_default == null) Ord_default = "bcode";
		if(Sort_default == null) Sort_default = "DESC";
		if(Rows_default == null) Rows_default = "5";
		if(Page_default == 0) Page_default = 1;
	
		Board_Content_DAO bbsDAO = new Board_Content_DAO();
	%>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<form name="form1" method="post" action="<%=path%>">
		<input type="hidden" name="ord" value="<%=Ord_default%>">
		<input type="hidden" name="sort" value="<%=Sort_default%>">
		<input type="hidden" name="page" value="<%=Page_default%>">
		<input type="hidden" name="rows" value="<%=Rows_default%>">
	    <div id="board_data">
	    	<div class="subnav">
		   		<div class="div_left">
		   			<input type="text" name="board_search" id="board_search" placeholder="검색...">
		   			<i class="fas fa-search"></i>
	   			</div>
	   			<div class="div_right">
		   			<select id="sort">
		   				<option value="default">정렬</option>
		   				<option value="latest">최신순</option>
		   				<option value="name">이름순</option>
		   				<option value="comment">댓글순</option>
		   			</select>
		   			<ul class="switch_view">
		   				<li class="list_view active"><i class="fas fa-list"></i></li>
		   				<li class="grid_view"><i class="fas fa-th-large"></i></li>
		   			</ul>
	   			</div>
	   		</div>
	   		<%
	   		
				int All_Page_Count = bbsDAO.page_count(Rows_default, b_no);
				Paging paging = new Paging();
				paging = bbsDAO.page_list(Rows_default, b_no, Page_default);

				int left_page = (Page_default == 1) ? 1: Page_default-1;
				int right_page = (All_Page_Count == Page_default) ? All_Page_Count: Page_default+1;
				
				if(All_Page_Count != 0){
			%>
		   		<div class="page_nav">
		   			<div class="view_page">
		   				<span><%=All_Page_Count%> 중 <%=Page_default%> 페이지 보기</span>
		   			</div>
		   			
		   			<div class="page float_right">
		   				<ul>
		   					<li onclick="return Pagechenge(<%=left_page%>)"><i class="fas fa-angle-left"></i></li>
		   					<%
		   						for(int i =paging.blockStartNum +1; i<=paging.blockLastNum; i++){
		  					%>
		   						<li <%if(i == Page_default){%>class="active"<%}%> onclick="return Pagechenge(<%=i%>)"><%=i %></li>
		  					<%
		  					}
		  					%>
		   					<li onclick="return Pagechenge(<%=right_page%>)"><i class="fas fa-angle-right"></i></li>
		   				</ul>
		   			</div>
		   		</div>
	   		<%
				}
	   		%>
	    	<div class="item-list">
	    		<%
	    			ArrayList<Board_Content_DTO> Bbs_List = bbsDAO.getPostList(board_no, Ord_default, Sort_default, Rows_default, Page_default-1);
	    			
	    			if(Bbs_List.size() == 0){
	 			%>
	 				<div class="search_data">
	 					<p>검색 결과가 없습니다.</p>
	 				</div>
	 			<%
	 				}
	    			for(int i = 0; i<Bbs_List.size(); i++){
	    				Board_Content_DTO test = Bbs_List.get(i);
	   					String[] upload_date = test.getBdate().split(" ");
	  			%>
	  				<div class="item">
		  				<div class="thumbnail"><a href="read.jsp?board_no=<%=test.getBoard_id() %>&bcode=<%=test.getBcode() %>"><img src="http://placehold.it/295x192" alt="thumbnail"></a></div>
		  				<div class="information">
			  				<div class="title"><a href="read.jsp?board_no=<%=test.getBoard_id() %>&bcode=<%=test.getBcode() %>"><%=test.getTitle() %></a></div>
			  				<div class="content"><%=test.getContents().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "") %></div>
			  				<div class="register"><span>등록자 : <%=test.getUserId() %></span><span>등록일 : <%=upload_date[0] %></span><span>댓글(0)개</span></div>
		  				</div>
	  				</div>
	  			<%
	  				}
	    		%>
	    	</div>
	    	<div class="item-foot">
	   			<div class="page">
	   				<ul>
	   					<li onclick="return Pagechenge(<%=left_page%>)"><i class="fas fa-angle-left"></i></li>
	   					<%
	   						for(int i =paging.blockStartNum +1; i<=paging.blockLastNum; i++){
	  					%>
	   						<li <%if(i == Page_default){%>class="active"<%}%> onclick="return Pagechenge(<%=i%>)"><%=i %></li>
	  					<% 
	  					}
	  					%>
	   					<li onclick="return Pagechenge(<%=right_page%>)"><i class="fas fa-angle-right"></i></li>
	   				</ul>
	   			</div>
	    	</div>
	    	<a href="write.jsp?board_no=<%=board_no%>"><span>글쓰기</span></a>
	    
	    </div>
    </form>
</body>
</html>