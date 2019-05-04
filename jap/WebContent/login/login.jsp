<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="css/login.css" type="text/css">
<link rel="stylesheet" href="css/default.css" type="text/css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/login.js"></script>
<script src="js/join.js"></script>

<title>로그인페이지</title>

</head>
<body>
	
	<%
		//세션에 로그인정보가 있는지 확인
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}

		String returnUrl = request.getParameter("returnUrl");
		
		//로그인정보가 있을 경우 메인화면으로 전송
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인된 상태입니다.')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		} 
		
	%>
	<div id="overflow_container">
    	<div id="position_container">
            <div id="find_container" class="div_margin">
                <div class="body_container">
                    
                </div>
            </div>
        

            <div id="login_container" class="div_margin">
                <h3><img src="image/logo.png" alt="로고"></h3>
                <div class="body_container">
                    <div class="login_title">
                        <h3><img src="image/login.png" alt="로그인 로고"></h3>
                        <span>가입하신 아이디와 패스워드로 로그인해주세요!</span>
                    </div>
                    <div class="form_container">
                        <form name="login_form" id="login_form" method="post" action="login_action.jsp" autocomplete="off">
							<input id="returnUrl" name="returnUrl" type="hidden" value="<%=returnUrl%>">
                            <span><label for="userId">아이디</label><input type="text" name="userId" id="userId" tabindex="1" placeholder="아이디"></span>
                            <span><label for="userPassword">패스워드</label><input type="password" name="userPassword" id="userPassword" tabindex="2" placeholder="비밀번호"></span>
                            <input type="submit" value="로그인" id="login_submit">
                        </form>
                        <div id="find_info">
                            <p><span>- ID/PW를 잃어버리셨습니까?</span><span class="float_right" onClick="membership('600')"><img src="image/login_button1.png" alt="아이디/비밀번호 찾기"></span></p>
                            <p><span>- JAP의 회원이 아니십니까?</span><span class="float_right" onClick="membership('-600')"><img src="image/login_button2.png" alt="회원가입"></span></p>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <div id="membership_container" class="div_margin">
                <div class="body_container">
                    <div class="membership_title">
                    	<span class="arrow" onClick="membership('0')"><img src="image/arrow_left_2.png" alt="뒤로가기"/></span>
                        <h3><img src="image/membership.png" alt="memvership로고"></h3>
                    </div>
                    <div class="form_container">
                        <form name="membership_form" id="membership_form" method="post" action="join_action.jsp">
                        	<input id="userEmail" name="userEmail" type="hidden">
							<input id="birth" name="birth" type="hidden">
                        	<ul>
                        		<li>
                        			<ul>
                        				<li class="menu active">
                        					<a>계정정보</a>
                        					<i id="account_icon"></i>
                        				</li>
                        				<li class="dropdown">
				                        	<!-- 아이디, 비밀번호  입력 -->
				                        	<div class="row_group join_user_id">
					                        	<div class="join_row">
					                        		<h3 class="join_title">아이디</h3>
					                            	<span class="input_box"><label for="jap_user_id"></label><input type="text" name="jap_User_id" id="jap_user_id" placeholder="아이디" maxlength="30" onblur="ID_Check();" title="아이디"><i id="user_id_icon"></i></span>
							                    	<span class="error_next_box" id="ID_MSG"></span>
					                        	</div>
					                        	
					                        	<div class="join_row join_user_pw">
					                        		<h3 class="join_title">비밀번호</h3>
					                            	<span class="input_box"><label for="jap_user_pw"></label><input type="password" name="jap_User_pw" id="jap_user_pw" placeholder="비밀번호" maxlength="16" onblur="Password_Check();" title="비밀번호"><i id="user_pw_icon"></i></span>
					                            	<span class="error_next_box" id="PW_MSG"></span>
					                        	</div>
					                        	
					                        	<div class="join_row join_user_pw_check">
					                        		<h3 class="join_title">비밀번호 재확인</h3>
					                            	<span class="input_box"><label for="jap_user_pw_check"></label><input type="password" name="jap_User_pw_check" id="jap_user_pw_check" placeholder="비밀번호 재확인" maxlength="16" onblur="Confirm_password();" title="비밀번호 재확인"><i id="user_pw_check_icon"></i></span>
					                            	<span class="error_next_box" id="PW_CHECK_MSG"></span>
					                        	</div>
				                        	</div>
				                        	<!-- // 아이디, 비밀번호  입력 -->
                        				</li>
                        			</ul>
                        		</li>
                        		<li>
                        			<ul>
                        				<li class="menu">
                        					<a>개인정보</a>
                        					<i id="individual_icon"></i>
                        				</li>
				                        <li class="dropdown">
				                        	<!-- 개인정보 입력 -->
				                        	<div class="row_group">
					                        	<div class="join_row join_user_name">
					                        		<h3 class="join_title">이름</h3>
					                            	<span class="input_box"><label for="jap_user_name"></label><input type="text" name="jap_User_name" id="jap_user_name" placeholder="이름" maxlength="30" onblur="NAME_Check();" title="이름"></span>
					                            	<span class="error_next_box" id="NAME_MSG"></span>
					                        	</div>
							                    
							                    <div class="join_row join_email">
							                        <h3 class="join_title">이메일</h3>
							                    	<span class="input_box">
								                    	<input id="email1" name="email1" class="mailId" value="" placeholder="이메일" type="text"  onblur="Email_Check();" title="이메일 앞부분"><span>@</span>
														<input id="email2" name="email2" class="mailAddress" value="" type="text"  onblur="Email_Address_Check();" title="이메일 뒷부분">
														<select id="email3" onchange="EMAIL_Change();">
															<option value="default" selected="selected">- 이메일 선택 -</option>
															<option value="naver.com">naver.com</option>
															<option value="daum.net">daum.net</option>
															<option value="nate.com">nate.com</option>
															<option value="hotmail.com">hotmail.com</option>
															<option value="yahoo.com">yahoo.com</option>
															<option value="empas.com">empas.com</option>
															<option value="korea.com">korea.com</option>
															<option value="dreamwiz.com">dreamwiz.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="etc">직접입력</option>
														</select>
													</span>
							                    	<span class="error_next_box" id="EMAIL_MSG"></span>
												</div>
							                    <div class="join_row join_phone">
					                        		<h3 class="join_title">휴대전화</h3>
							                    	<span class="input_box">
														<input id="mobile" name="mobile" maxlength="13" placeholder="전화번호 입력" type="text" title="휴대전화번호" onkeyup="autoHypen();">
														<a href="#" onclick="PHONE_Check();"><span>인증번호 받기</span></a>
														<input type="tel" onkeyup="check_MAC();" id="authNo" name="authNo" placeholder="인증번호 입력하세요" disabled="disabled" maxlength="6" title="인증번호">
                                                        <span id="timer">03:00</span>
													</span>
							                    	<span class="error_next_box" id="PHONE_MSG"></span>
												</div>
				                        	</div>
				                        	<!-- // 개인정보 입력 -->
                        				</li>
                        			</ul>
                        		</li>
                        		<li>
                        			<ul>
                        				<li class="menu">
                        					<a>추가정보</a>
                        					<i id="addition_icon"></i>
                        				</li>
				                        <li class="dropdown">
				                        	<!-- 개인정보 입력 -->
				                        	<div class="row_group">
					                        	<div class="join_row join_birthday">
							                        <h3 class="join_title">생년월일</h3>
							                        <span class="input_box">
	                        							<select onchange="Birth_Select('year'); Sum_Day();" id="birth_year_select" name="birth_year_select">
								                        	<option value="default" selected="selected">생년</option>
								                        </select>
								                        <input id="birth_year" name="birth_year" type="hidden" value="" title="생년">
								                        <select onchange="Birth_Select('month'); Sum_Day();" id="birth_month_select" name="birth_month_select">
								                        	<option value="default" selected="selected">월</option>
								                        </select>
								                        <input id="birth_month" name="birth_month" type="hidden" value="" title="월">
								                        <select onchange="Birth_Select('day');" id="birth_day_select" name="birth_day_select">
								                        	<option value="default" selected="selected">일</option>
								                        </select>
								                        <input id="birth_day" name="birth_day" type="hidden" value="" title="일">
							                        </span>
							                        <span class="error_next_box" id="birthdayMsg"></span>
							                    </div>
							                    
							                    <div class="join_row join_sex">
							                        <h3 class="join_title">성별</h3>
							                        <span class="input_box">
								                    	<input onchange="sex_check();" id="is_sex0" name="is_sex" value="M" type="radio"><label id="sex_left" class="sex_button" for="is_sex0" title="남자">남자</label>
								                        <input onchange="sex_check();" id="is_sex1" name="is_sex" value="F" type="radio"><label id="sex_right" class="sex_button" for="is_sex1" title="여자">여자</label>
							                        </span>
							                    </div>
				                        	</div>
				                        	<!-- // 개인정보 입력 -->
                        				</li>
                        			</ul>
                        		</li>
                        		<li>
                            		<button type="button" id="membership_submit" onclick="join_check();">회원가입</button>

                        		</li>
                        	</ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form method="post" name="smsForm" id="form1" action="sms2.jsp" style="display:none;">
	    <input type="hidden" name="action" value="go">
	    <input type="hidden" name="smsType" id="smsType">
	    <textarea name="msg" id="code" cols="30" rows="10"></textarea>
	    <input type="hidden" name="rphone" id="rphone">
	    <input type="hidden" name="sphone1" id="sphone1">
        <input type="hidden" name="sphone2" id="sphone2">
        <input type="hidden" name="sphone3" id="sphone3">
	    <input type="hidden" name="testflag" id="testflag">
	</form>
</body>
</html>