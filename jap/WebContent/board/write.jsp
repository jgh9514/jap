<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="css/write.css">

<script type="text/javascript" src="smart_editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String bcode = request.getParameter("bcode");
		String b_no = request.getParameter("board_no");
		String Referrer = request.getHeader("referer");
		int board_no = 0;
		try{
			board_no = Integer.parseInt(b_no);
			
		}catch(Exception e){
		}
		if(board_no < 0){
			script.println("<script>");
			script.println("alert('해당 게시판은 존재하지 않습니다.')");
			script.println("location.href='/jap/index.jsp'");
			script.println("</script>");
		}

		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID == null){
			String url = URLEncoder.encode("/jap/board/write.jsp?board_no=" + b_no,"UTF-8");
			script.println("<script>");
			script.println("alert('글쓰기는 회원이상 작성이 가능합니다.')");
			script.println("location.href='/jap/login/login.jsp?returnUrl="+url+"'");
			script.println("</script>");
		}
		
	%>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div id="container">
	<form id="boardWriteForm" action="write_action.jsp" method="post">
		<input id="board_no" name="board_no" value="<%=board_no%>" type="hidden">
		<input id="move_write_after" name="move_write_after" value="<%=Referrer%>" type="hidden">
		<div class="title">
			<label for="title_input">제목</label><input type="text" name="title_input" id="title_input">
		</div>
		<textarea name="contents" id="contents" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
		
		<span class="gLeft">
			<a href="list.jsp?board_no=<%=board_no%>" class="btn_submitboard btncolor_subbasic"><span>목록</span></a>
		</span>
		<span class="gRight">
			<input type="submit" onclick="submitContents();" class="btn_submitboard btncolor_subordinate" value="등록">
			<a href="list.jsp?board_no=<%=board_no%>" class="btn_submitboard btncolor_subbasic"><span>취소</span></a>
		</span>
	</form>
</div>
</body>


<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "smart_editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["contents"].exec("PASTE_HTML", ["<p>aa</p>"]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["contents"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</html>