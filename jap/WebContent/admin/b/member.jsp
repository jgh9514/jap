<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.*"%>
<%@ page import="paging.*"%>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="Sort" class="paging.Sort" scope="page"/>
<jsp:setProperty name="Sort" property="ord" />
<jsp:setProperty name="Sort" property="sort" />
<jsp:setProperty name="Sort" property="page" />
<jsp:setProperty name="Sort" property="rows" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="css/member.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>

 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<title>관리자 페이지</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../header.jsp" />
		</div>
		<div id="container">
			<div id="sidebar">
				<jsp:include page="../sidebar.jsp" />
			</div>
			<div id="content">
				<!-- <div id="container" style="min-width: 310px; height: 400px; width:50%; margin:0; border:2px solid #ddd;"></div> -->
				<div class="mOption">
					<table border="1" summary="">
						<caption>회원정보 조회</caption>
						<colgroup>
							<col style="width:145px;">
							<col style="width:auto;">
							<col style="width:145px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
					    		<th scope="row">개인정보</th>
					    		<td colspan="3">
					        		<select name="search_type" class="fSelect">
					        			<option value="">- 선택 -</option>
					        			<option value="name">이름</option>
							            <option value="member_id" selected="selected">아이디</option>
							            <option value="email">이메일</option>
							            <option value="phone">전화번호</option>
							            <option value="mobile">휴대폰번호</option>
							            <option value="nick_name">별명</option>
							            <option value="addr">주소</option>
							            <option value="cssn">사업자번호</option>
					        		</select>
					        		<input type="text" name="type" value="" class="fText" style="width:130px;">
					            </td>
							</tr>
					        
					        <tr>
						        <th scope="row">회원등급</th>
					        	<td>
					        		<input type="hidden" id="grp_sel" name="grp_sel" value="0">
					        		<select name="group_no" onchange="checkGroup(this)" class="fSelect">
					        			<option value="" selected="selected">전체</option>
					        			<option value="1">일반회원</option>
					        			<option value="3">관리회원</option>
					        		</select>
					       		</td>
							</tr>
							
							<tr>
								<th scope="row">가입경로</th>
								<td>
									<label class="gLabel eSelected"><input type="radio" name="input_channel" value="" checked="checked" class="fChk"> 전체</label>
									<label class="gLabel"><input type="radio" name="input_channel" value="P" class="fChk"> PC</label>
									<label class="gLabel"><input type="radio" name="input_channel" value="M" class="fChk"> 모바일</label>
								</td>
								<th scope="row" style="">유입경로
									<div class="cTip">
										<div class="mTooltip  gMedium">
											<button type="button" class="icon eTip">도움말</button>
											<div class="tooltip" style="z-index : 1; ">
						        				<div class="content">
						            				<strong class="titleEm">유입경로</strong>
													<ul class="mList"><li>접속통계 광고매체를 통하여 가입한 회원의 경로입니다.</li></ul>
						        				</div>
						       					<button type="button" class="close eClose">닫기</button>
						        				<span class="edge"></span>
						   					</div>
										</div>
									</div>
								</th>
								<td>
									<select name="entry_path_group" id="entry_path_group" onchange="display_media_list(this)" class="fSelect">
										<option value="" selected="selected">- 그룹명 -</option>
										<option value="네이버">네이버</option>
										<option value="기타">기타</option>
										<option value="다음">다음</option>
										<option value="야후(대만)">야후(대만)</option>
										<option value="바이두(중국)">바이두(중국)</option>
										<option value="구글(일본)">구글(일본)</option>
										<option value="구글(홍콩)">구글(홍콩)</option>
					                </select>
							        <select name="entry_path" id="entry_path" class="fSelect">
							        	<option value="" selected="selected">- 광고매체 -</option>
						        	</select>
							    </td>
							</tr>
							
							<tr>
					    		<th scope="row">가입일</th>
					    		<td colspan="3">
									<div style="float:left">
											<div id="reg_form">
											    <input type="text" id="regist_start_date" name="regist_start_date" class="fText gDate" value="2018-11-22" readonly="readonly">
											    <a href="#none" id="btnRegistStartDate" class="btnIcon icoCal"><span>달력보기</span></a>
											    ~
											    <input type="text" id="regist_end_date" name="regist_end_date" class="fText gDate" value="2018-11-22" readonly="readonly">
											    <a href="#none" id="btnRegistEndDate" class="btnIcon icoCal"><span>달력보기</span></a>
											</div>
					                </div>
					            </td>
					        </tr>
					        
					        <tr>
					            <th scope="row">나이</th>
					            <td>
					                <input type="text" name="age1" value="" class="numberic fText right" style="width:40px;" maxlength="2"> 세 ~
					                <input type="text" name="age2" value="" class="numberic fText right" style="width:40px;" maxlength="2"> 세
					            </td>
					            <th scope="row">성별</th>
					            <td>
					                <label class="gLabel eSelected"><input type="radio" name="gender" value="1" checked="checked" class="fChk"> 전체</label>
					                <label class="gLabel"><input type="radio" name="gender" value="2" class="fChk"> 남</label>
					                <label class="gLabel"><input type="radio" name="gender" value="3" class="fChk"> 여</label>
					            </td>
					        </tr>
					        
					   		<tr>
								<th scope="row">접속일</th>
								<td>
								    <input type="text" id="login_start_date" name="login_start_date" class="fText gDate" value="" readonly="readonly">
								    <a href="#none" id="btnLoginStartDate" class="btnIcon icoCal"><span>달력보기</span></a>
								    ~
								    <input type="text" id="login_end_date" name="login_end_date" class="fText gDate" value="" readonly="readonly">
								    <a href="#none" id="btnLoginEtartDate" class="btnIcon icoCal"><span>달력보기</span></a>
								    <span class="txtInfo">최근 1년까지 가능</span>
								</td>
								<th scope="row">접속 IP</th>
								<td>
					    			<input type="text" name="visit_ip" value="" class="fText" style="width:160px;">
					                <span class="txtInfo">예) 123.123.123.123</span>
					            </td>
					        </tr>
						</tbody>
					</table>
				</div>
				<%
					String Ord_default = Sort.getOrd();
					String Sort_default = Sort.getSort();
					String Rows_default = Sort.getRows();
					int Page_default = Sort.getPage();
					if(Ord_default == null) Ord_default = "regist_date";
					if(Sort_default == null) Sort_default = "DESC";
					if(Rows_default == null) Rows_default = "20";
					if(Page_default == 0) Page_default = 1;
					
					UserDAO userDAO = new UserDAO();
					ArrayList<UserDTO> list = userDAO.getMemberList(Ord_default, Sort_default, Rows_default, Page_default-1);
			
					int list_cnt = list.size();
					int total_list_cnt = userDAO.count();
				%>
				<form name="form1" method="post" action="member.jsp">
				<input type="hidden" name="ord" value="<%=Ord_default%>">
				<input type="hidden" name="sort" value="<%=Sort_default%>">
				<input type="hidden" name="page" value="<%=Page_default%>">
				<input type="hidden" name="rows" value="<%=Rows_default%>">
				<div class="mButton gCenter">
					<a href="#none" onclick="doSrchFrm();" class="btnSearch"><span>검색</span></a>
				</div>
				<div class="mTitle">
					<h2>회원 목록</h2>
				</div>
				<div class="mState">
					<div class="gLeft">
						<p class="total">[총 회원수 <strong><%=total_list_cnt%></strong>명] 검색결과 <strong>0</strong>건</p>
					</div>
					<div id="gRight">
		            <select id="rows" name="rows" onchange="RowsChenge()">
		                <option value="10" <%if(Rows_default.equals("10")){%>selected<%}%>>10개씩보기</option>
		                <option value="20" <%if(Rows_default.equals("20")){%>selected<%}%>>20개씩보기</option>
		                <option value="30" <%if(Rows_default.equals("30")){%>selected<%}%>>30개씩보기</option>
		                <option value="40" <%if(Rows_default.equals("40")){%>selected<%}%>>40개씩보기</option>
		                <option value="50" <%if(Rows_default.equals("50")){%>selected<%}%>>50개씩보기</option>
		                <option value="100" <%if(Rows_default.equals("100")){%>selected<%}%>>100개씩보기</option>
		                <option value="200" <%if(Rows_default.equals("200")){%>selected<%}%>>200개씩보기</option>
		                <option value="500" <%if(Rows_default.equals("500")){%>selected<%}%>>500개씩보기</option>
		                <option value="1000" <%if(Rows_default.equals("1000")){%>selected<%}%>>1,000개씩보기</option>
		            </select>
		        </div>
		        </div>
				<div class="mCtrl typeHeader">
					<div class="gLeft">
						<a href="#none" onclick="setBlacklist();" class="btnNormal"><span>회원등급 변경</span></a>
						<a href="#none" onclick="delete_choice()" class="btnNormal"><span><em class="icoDel"></em> 삭제</span></a>
					</div>
					<div class="gRight">
						<a href="#none" onclick="dn_excel_file();" title="새창 열림" class="btnNormal"><span><em class="icoXls"></em> 엑셀다운로드<em class="icoLink"></em></span></a>
				    </div>
				</div>
				<table id="member_search">
		        	<colgroup>
		                <col style="width:5%">
		                <col style="width:10%">
		                <col style="width:10%">
		                <col style="width:10%">
		                <col style="width:10%">
		                <col style="width:10%">
		                <col style="width:20%">
		                <col style="width:10%">
		                <col style="width:15%">
		            </colgroup>
					<thead>
					<%
		                String sort_check = "ASC";
		                String[] ord_check = {"regist_date", "userId", "userName", "userDate", "userEmail", "userGender", "userPhone"};
						String[] sort_list = {"","","","","","",""};
		                int ord_count = 0;
		                int sort_count = 0;
						for(int i=0; i<ord_check.length; i++){
							
							if(ord_check[i].equals(Ord_default)){
								ord_count = i;
								if(sort_check.equals(Sort_default)){
									sort_list[i] = "DESC";
								}
								else{
									sort_list[i] = "ASC";
									sort_count =1;
								}
							}
						}
		            %>
						<tr>
							<th><input type="checkbox" class="check_all"></th>
							<th class="menu" onclick="submitSearch('regist_date', '<%=sort_list[0]%>')">등록일<span class="sort"></span></th>
							<th class="menu" onclick="submitSearch('userId', '<%=sort_list[1]%>')">아이디<span class="sort"></span></th>
							<th>패스워드</th>
							<th class="menu" onclick="submitSearch('userName', '<%=sort_list[2]%>')">이름<span class="sort"></span></th>
							<th class="menu" onclick="submitSearch('userDate', '<%=sort_list[3]%>')">생년월일<span class="sort"></span></th>
							<th class="menu" onclick="submitSearch('userEmail', '<%=sort_list[4]%>')">이메일<span class="sort"></span></th>
							<th class="menu" onclick="submitSearch('userGender', '<%=sort_list[5]%>')">성별<span class="sort"></span></th>
							<th class="menu" onclick="submitSearch('userPhone', '<%=sort_list[6]%>')">연락처<span class="sort"></span></th>
						</tr>
						<script type="text/javascript">
							var ord_count = <%=ord_count%>;
							var sort_count = <%=sort_count%>;
							if(sort_count){
								$('#member_search .menu').eq(ord_count).addClass("ascend");
							}else{
								$('#member_search .menu').eq(ord_count).addClass("descend");
									
							}
						</script>
					</thead>
					<tbody>
					<%
						for(int i=0; i<list_cnt; i++){
							String aa = list.get(i).getRegist_date();
							String[] tt = aa.split(" ");
					%>
						<tr>
							<td><input type="checkbox" name="check_box" class="list_check" value="<%=list.get(i).getUserId()%>"></td>
							<td><%=tt[0]%></br><%=tt[1]%></td>
							<td><%=list.get(i).getUserId()%></td>
							<td><%=list.get(i).getUserPassword()%></td>
							<td><%=list.get(i).getUserName()%></td>
							<td><%=list.get(i).getUserDate()%></td>
							<td><%=list.get(i).getUserEmail()%></td>
							<td><%=list.get(i).getUserGender()%></td>
							<td><%=list.get(i).getUserPhone()%></td>
						</tr>
					<%
						}
					%>
					</tbody>
					<tfoot>
		            	<tr>
		                	<td colspan="12">
		                    	<nav>
		                        	<ul>
										<%
		                                    Paging paging = new Paging();
										
		                                    paging.makeBlock(Page_default);
		                                    paging.makeLastPageNum();
		                                    
		                                    int Last_Page_Num = paging.getLastPageNum();
		                                    double page_Num = Math.ceil(total_list_cnt / Double.parseDouble(Rows_default));
		                                    
		                                %>
		                            	<%if(Page_default != 1){%>
		                            		<li><a href="javascript:return" onclick="return Pagechenge(0)"><i class="double_left"></i></a></li>
		                            		<li><a href="javascript:return" onclick="return Pagechenge(<%=Page_default - 1%>)"><i class="single_left"></i></a></li>
		                                <%}else{%>
		                            		<li><a href="javascript:return"><i class="double_left"></i></a></li>
		                            		<li><a href="javascript:return"><i class="single_left"></i></a></li>
		                                <%}%>
		                                <%
										for(int i =paging.blockStartNum; i<=paging.blockLastNum; i++){
											if(i > page_Num) break;
											if(i == Page_default){
											%>
												<li><a href="javascript:return" class="active"><span><%=i%></span></a></li>
											<%
											}else{
											%>
												<li><a href="javascript:return" onclick="return Pagechenge(<%=i%>)"><span><%=i%></span></a></li>
											<%}%>
		                                <%}%>
										<%if(Page_default != page_Num){%>
		                                    <li><a href="javascript:return" onclick="return Pagechenge(<%=Page_default + 1%>)"><i class="single_right"></i></a></li>
		                                    <li><a href="javascript:return" onclick="return Pagechenge(<%=page_Num%>)"><i class="double_right"></i></a></li>
		                                <%}else{%>
		                                    <li><a><i class="single_right"></i></a></li>
		                                    <li><a><i class="double_right"></i></a></li>
		                                <%}%>
		                            </ul>
		                        </nav>
		                    </td>
		                </tr>
		            </tfoot>
				</table>
			</form>
			</div>
		</div>
	</div>
</body>
</html>