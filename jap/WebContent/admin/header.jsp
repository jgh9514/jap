<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/header.css">
<!-- GNB Start -->
<div class="header">
	<h1 class="logo"><a href="/admin/php/shop1/main.php"><img src="//img.echosting.cafe24.com/ec/layout/ko_KR/h1_logo.png" alt="CAFE24 쇼핑몰센터"></a></h1>
	<div class="topBar theme1">
		<div class="util">
			<ul class="related">
				<li id="QA_Top_WebLogStatistics" class="topMenuAct "><a href="#none" class="access">접속통계</a></li>
				<li id="QA_Top_ftp" class="topMenuAct "><a href="#none" class="ftp">FTP</a></li>
			</ul>
		</div>
		<div class="membership major">
			<span class="admin">
				<span class="thumbnail"></span>
				<button type="button" class="btnCover"></button>
            </span>
            <div class="adminLayer" style="display: none;">
            	<div class="detail">
            		<span class="thumbnail"></span>
            		<div class="info">
            			<strong class="mallID">deeppoint2</strong>
            			<span class="name">대표운영자님</span>
            			<a href="http://deeppoint2.cafe24.com/admin/php/m/company_info_f.php" class="auth" title="새창 열림">내쇼핑몰정보</a>
           			</div>
         		</div>
         		<div class="btnMember">
         			<a href="#none" onclick="openPopupCompanyAuth()" class="button">사업자 정보</a>
         			<a href="/admin/php/shop1/log_out.php" class="button">로그아웃</a>
         		</div>
            </div>
        </div>
		<div class="service">
        	<button type="button" id="gnbTopMore" class="btnMore"></button>
			<ul class="list" style="display: none;">
				<li><a href="#none" class="link" onclick="top.MenuAction.change('', '1508', '', 'transformTreeNo');">사이트맵</a></li>
				<li><a href="#none" class="link" onclick="addFavorite();">즐겨찾기 추가</a></li>
				<li><a href="#none" class="link" onclick="shop_admin_icon();">바탕화면 추가</a></li>
			</ul>
		</div>
 	</div>
</div>
<h2>주요메뉴</h2>
<div id="gnb" class="menu12">
 	<ul>
        <li id="shop" class=" selected"><a id="QA_Gnb_store" href="#none">상점관리</a></li>
        <li id="member" class=""><a id="QA_Gnb_member" href="#none">회원관리</a></li>
        <li id="board" class=""><a id="QA_Gnb_board" href="#none">게시판관리</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
        <li id="marketing" class=""><a id="QA_Gnb_marketing" href="#none">개발중</a></li>
	</ul>
</div>