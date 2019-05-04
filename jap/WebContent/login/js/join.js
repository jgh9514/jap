
	
	
	
$(document).ready(function() {
	$('#jap_user_pw_check').keydown(function(e){
        if(e.keyCode == 9){
			Confirm_password();
    		if(t1 && t2 && t3) $(".menu").eq(1).click();
			$("#jap_user_name").focus();
            return false;
        }
    });
	$("#authNo").keydown(function(e){
        if(e.keyCode == 9){
			check_MAC();
			if(t4 && t5 && t6){ $(".menu").eq(2).click();}
            return false;
        }
    });
	
	
			
			
	/*회원가입칸 드롭다운 메뉴 START*/
	$("#membership_form")[0].reset(); //회원가입 입력폼 리셋
	$("#authNo").prop("disabled",true);	
	
	if(window.innerWidth > 768 ){
		$(".active").parent().children(".dropdown").css("height","350px"); // active된 메뉴의 높이 조정 / 반응형으로 전환시 수정해야함
	}else{
		$(".active").parent().children(".dropdown").css("height","320px"); // active된 메뉴의 높이 조정 / 반응형으로 전환시 수정해야함
	}
	$(".menu").on('click',function(){
		if($('.menu.active i').hasClass('clear') || $(this).children('i').hasClass('clear')){ //현재 active되어 있는 드롭다운의 form을 전부 입력했는지 혹은 클릭한 메뉴의 form이 전부 입력되어있는지 확인
			var active_count;
			$(".menu").each(function(index){
				if($(this).hasClass("active")){
					active_count = index;
				}
			});
			if($(".menu").index($(this)) == "2" && active_count == 0){
				alert("개인정보를 먼저 입력해주시기 바랍니다.");
				return 0;	
			}
			//$(".menu").eq(1).
			var height_size = "350px"; //높이 세팅 변수
			var this_drop = $(this).parent().children(".dropdown"); //클릭한 메뉴 설정
			
			var $aa = $(".dropdown"); // 클래스(dropdown) 객체 생성
			
			
			if(window.innerWidth < 768 ){
				height_size = "55vh";
			}
			if(!$aa.is(":animated")){ // 클래스(dropdown)의 에니메이션 진행 여부 확인
				if(this_drop.queue().length == 0){ //클릭한 메뉴의 자손 클래스(dropdown)의 큐스텍 개수가 0일 경우
					if($(this).hasClass("active")){ //클릭한 메뉴의 클래스(active) 여부 확인
		
						$(this_drop).animate({height:"0px"},500); //클릭한 메뉴의 자손 클래스(dropdown)의 높이를 0으로 설정
						$(".menu").removeClass("active"); //클릭한 메뉴에 active 클래스 제거
						
					}else if($('.active').length == 0){ //active 메뉴가 0일 경우
						
						$(this_drop).animate({height:height_size},500); //클릭한 메뉴의 자손 클래스(dropdown)의 높이를 높이 세팅 변수의 값으로 세팅
						$(this).addClass("active"); //클릭한 메뉴에 active 클래스 추가
						
					}else{ // 그 외에 경우
						$(".active").parent().children(".dropdown").animate({
							height:"0px"
						},500,function(){
							$(this_drop).animate({height:height_size},500);
						}); // 우선 active클래스가 있는 메뉴의 자손 클래스(dropdown)의 높이를 0으로 설정한 후 클릭한 메뉴의 자손 클래스(dropdown)의 높이를 높이 세팅 변수의 값으로 세팅
						$(".menu").delay(500).removeClass("active"); //클래스(menu)의 엘리먼트의 클래스(active)를 제거
						$(this).delay(500).addClass("active"); //클릭한 메뉴에 active 클래스 추가
					}
				}
			}
		}else{ //그 외에 경우
			alert("입력되지 않은 정보가 존재합니다.");
		}		
	});
	/*회원가입칸 드롭다운 메뉴 END*/
	
	
	$("input").focus(function(){
		if($(this).val() == "" && $(this).parent().parent().find(".error_next_box").text()==""){
			$(this).css("border","1px solid #08a600");	//input 처음 입력 시 input 테두리 녹색으로 변경
		}
	});
	
	
	/*생년월일 날짜 option 설정 START*/
	for(var i = 2005; i > 1910; i--){ 
    	$("#birth_year_select").append( "<option value='"+i+"'>"+i+"</option>"); //년도
    }
    for(var i = 1; i < 13; i++){ 
    	$("#birth_month_select").append( "<option value='"+i+"'>"+i+"</option>"); //월
    }
	/*생년월일 날짜 option 설정 END*/
	
	
	/*성별 설정*/
    $(".sex_button").click(function(){
    	$(".sex_button").css({
    		"background":"#fff",
    		"color":"#000"
    	});
    	$(this).css({
    		"background":"#08a600",
    		"color":"#fff"
    	});
    });
});


/*각 메뉴별 form 데이터 유효성 검사 START*/
var t1,t2,t3,t4,t5,t6,t7,t8 = false;
function Form_Clear(Name, Bool){
    $("#account_icon").removeClass("clear");
    $("#individual_icon").removeClass("clear");
    $("#addition_icon").removeClass("clear");
	
    if(Name=="id"){
    	t1 = Bool;
    }else if(Name == "pw"){
    	t2 = Bool;
    }else if(Name == "pw_check"){
    	t3 = Bool;
    } else if(Name=="name"){
    	t4 = Bool;
    }else if(Name == "email"){
    	t5 = Bool;
    }else if(Name == "phone"){
    	t6 = Bool;
    }else if(Name == "birth"){
    	t7 = Bool;
    }else if(Name == "gender"){
    	t8 = Bool;
    }
    
    if(t1 && t2 && t3){
    	$("#account_icon").addClass("clear");
    }
	if(t4 && t5 && t6){
    	$("#individual_icon").addClass("clear");    	
    }
	if(t7 && t8){
    	$("#addition_icon").addClass("clear");    	
    }
}
/*각 메뉴별 form 데이터 유효성 검사 END*/


/*Input 입력 값 유효성 불일치일 경우 진동알림 START*/
function False_Input_Value(input){
	$(input).css("position","absolute");
	$(input).animate({
		"left":"-5px"
	},100,function(){
		$(input).animate({
    		"left":"5px"
    	},100,function(){
    		$(input).animate({
        		"left":"-5px"
        	},100,function(){
        		$(input).animate({
            		"left":"5px"
            	},100,function(){
            		$(input).animate({
                		"left":"0px"
                	},100);
            	});
        	});
    	});
	});
}
/*Input 입력 값 유효성 불일치일 경우 진동알림 END*/



function True_Availability(MSG, MSG_Text, Input, Icon){
	
	$(MSG).css("display","none");
	$(MSG).html("");
	$(Input).css("border","1px solid #0275f4");
	$(Icon).removeClass("error");
	$(Icon).addClass("clear");
}

function False_Availability(MSG, MSG_Text, Input, Icon){
	False_Input_Value(Input);
	$(MSG).css({
		"display":"block",
		"color":"#f00",
	});
	$(MSG).html(MSG_Text);
	$(Input).css("border","1px solid #f00");
	$(Icon).removeClass("clear");
	$(Icon).addClass("error");
}

/*아이디 체크 함수 START*/
function ID_Check(){
	var UserID = $("#jap_user_id");
	var UserID_Value = $(UserID).val();
	var UserID_Msg = $("#ID_MSG");
	var UserID_Icon = $("#user_id_icon");
    var exp = new RegExp('(^[-_])|[^0-9a-z_-]');
    Form_Clear("id",false);
    
    if(UserID_Value.length == 0){
		False_Availability(UserID_Msg, "필수 정보입니다.", UserID, UserID_Icon);
    }else if(UserID_Value.length < 5 || exp.test(UserID_Value)){
		False_Availability(UserID_Msg, "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.", UserID, UserID_Icon);
    }else{
    	ID_Check_Action();
    	
    }
}
/*아이디 체크 함수 END*/

/*서버에서 ID 존재여부 확인 START*/
function ID_Check_Action(){
	var UserID = $("#jap_user_id");
	var UserID_Value = $(UserID).val();
	var UserID_Msg = $("#ID_MSG");
	var UserID_Icon = $("#user_id_icon");
	$.ajax({
		type : "POST",
		url : "id_check_action.jsp",
		cache : false,
		async: false,
		datatype:"text",
		data : {
			"jap_user_id" : UserID_Value
		},
		success : function(data){
		    
			var $msg_data = $(data);
			var Massage = $msg_data.filter("#one").text();
			
			if(Massage == ""){
				True_Availability(UserID_Msg, Massage, UserID, UserID_Icon);
	        	Form_Clear("id",true);
			}else{
				False_Availability(UserID_Msg, Massage, UserID, UserID_Icon);
			}
		},
		error : function(){
			alert("아이디 중복체크 중 오류가 발생하였습니다.");
		}
	});
}
/*서버에서 ID 존재여부 확인 END*/




/*비밀번호 체크 함수 START*/
function Password_Check(){
	var UserPassword = $("#jap_user_pw");
    var UserPassword_Value = $(UserPassword).val();
	var UserPassword_Check = $("#jap_user_pw_check");
    var UserPassword_Msg = $("#PW_MSG");
    var UserPassword_Icon = $("#user_pw_icon");
	
    var chk1 = /^.*(?=.*[a-zA-Z])(?=.*[`~!@#$%^&*\(\)+=\-_|\{\}\[\]:;\'\"<>,.\/?]).{8,16}/g;
    var chk2 = /^.*(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}/g;
    Form_Clear("pw",false);
    

    var checkString_1 = UserPassword_Value.match(chk1);
    var checkString_2 = UserPassword_Value.match(chk2);
    
	if($(UserPassword_Check).val() != "") Confirm_password();
	
    if(UserPassword_Value.length == 0){
		False_Availability(UserPassword_Msg, "필수 정보입니다.", UserPassword, UserPassword_Icon);
    }else if(UserPassword_Value.length < 8 || (checkString_1 == null && checkString_2 == null)){
		False_Availability(UserPassword_Msg, "8~16자 영문 대 소문자, 숫자, 특수문자중 2개 이상 조합", UserPassword, UserPassword_Icon);
    }else{
		True_Availability(UserPassword_Msg, "", UserPassword, UserPassword_Icon);
    	Form_Clear("pw",true);
    }
}

function Confirm_password(){
	var UserPassword = $("#jap_user_pw");
    var UserPassword_Value = $(UserPassword).val();
	var UserPassword_Check = $("#jap_user_pw_check");
    var UserPassword_Check_Value = $(UserPassword_Check).val();
    var UserPassword_Check_Msg = $("#PW_CHECK_MSG");
    var UserPassword_Check_Icon = $("#user_pw_check_icon");
    
	Form_Clear("pw_check",false);	
	
    if(!t2){
		False_Availability(UserPassword_Check_Msg, "비밀번호를 먼저 입력해주세요.", UserPassword_Check, UserPassword_Check_Icon);
    }else if(UserPassword_Check_Value.length == 0){
		False_Availability(UserPassword_Check_Msg, "필수정보 입니다.", UserPassword_Check, UserPassword_Check_Icon);
    }else if(UserPassword_Value != UserPassword_Check_Value){
		False_Availability(UserPassword_Check_Msg, "비밀번호가 일치하지 않습니다.", UserPassword_Check, UserPassword_Check_Icon);
    }else{
		True_Availability(UserPassword_Check_Msg, "", UserPassword_Check, UserPassword_Check_Icon);
    	Form_Clear("pw_check",true);
    }
}
/*비밀번호 체크 함수 END*/

/*이름 체크 함수 START*/
function NAME_Check(){
	var UserName = $("#jap_user_name");
    var UserName_Value = $(UserName).val();
    var UserName_Msg = $("#NAME_MSG");
    var exp = new RegExp('[^가-힣0-9a-zA-Z]');
	Form_Clear("name",false);
    
    
    if(UserName_Value.length == 0){
		False_Availability(UserName_Msg, "필수정보 입니다.", UserName, "");
    }else if(exp.test(UserName_Value)){
		False_Availability(UserName_Msg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)", UserName, "");
    }else{
		True_Availability(UserName_Msg, "", UserName, "");
		Form_Clear("name",true);
    	
    }
}
/*이름 체크 함수 END*/


/*이메일 체크 함수 START*/
var m1, m2, m3 = false;
function Email_Clear(Name, Bool){
	Form_Clear("email",false);
	
	if(Name == "email1"){
		m1 = Bool;
	}else if(Name == "email2"){
		m2 = Bool;
	}else if(Name == "email3"){
		m3 = Bool;
	}
	
	if(m1 && (m2 || m3)){
    	$("#userEmail").attr("value",$("#email1").val() + "@" + $("#email2").val());	
		Form_Clear("email",true);
	}
}
function Email_Check(){	
	var UserEmail_1 = $("#email1");
    var UserEmail_Msg = $("#EMAIL_MSG");
    var UserEmail_1_Value = $(UserEmail_1).val();
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/i;
    Email_Clear("email1",false);
    var checkString_1 = UserEmail_1_Value.match(regExp);
	
    if(UserEmail_1_Value.length == 0){
		False_Availability(UserEmail_Msg, "필수정보 입니다.", UserEmail_1, "");
    }else if(checkString_1 == null){
		False_Availability(UserEmail_Msg, "이메일 주소를 다시 확인해주세요.", UserEmail_1, "");
    }else{
		True_Availability(UserEmail_Msg, "", UserEmail_1, "");
    	Email_Clear("email1",true);
    }
}

function Email_Address_Check(){	
	var UserEmail_2 = $("#email2");
    var UserEmail_2_Value = $(UserEmail_2).val();
    var UserEmail_Msg = $("#EMAIL_MSG");
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/i;
    Email_Clear("email2",false);
    
    var checkString_1 = UserEmail_2_Value.match(regExp);
	
    if(UserEmail_2_Value.length == 0){
		$(UserEmail_Msg).css({
			"color":"#f00",
			"display":"block",	
		});
		$(UserEmail_Msg).html("필수정보 입니다.");
		$(UserEmail_2).css("border","1px solid #f00");
    }else if(checkString_1 == null){
		$(UserEmail_Msg).css({
			"color":"#f00",
			"display":"block",	
		});
		$(UserEmail_Msg).html("이메일 주소를 다시 확인해주세요.");
		$(UserEmail_2).css("border","1px solid #f00");
    }else{
		True_Availability(UserEmail_Msg, "", UserEmail_2, "");
    	Email_Clear("email2",true);
    }
}


function EMAIL_Change(){
    var UserEmail_2 = $("#email2");
    var UserEmail_3 = $("#email3");
    var width = $(UserEmail_3).css("width").split("px");
    Email_Clear("email3",false);
		
    if($(UserEmail_3).val() == "etc"){
        $(UserEmail_2).attr("value","");
    	$(UserEmail_2).css({
    		"display":"block",
            "z-index":"11",
            "width":(Number(width[0])-19)+'px'
        });
    	$(UserEmail_2).focus();
    }
    else if($(UserEmail_3).val() != "default"){
        $(UserEmail_2).css({
    		"display":"none",
        	"z-index":"1",
        });
        $(UserEmail_2).attr("value",UserEmail_3.val());
    	Email_Clear("email3",true);
    }
}
/*이메일 체크 함수 END*/


/*핸드폰 체크 함수 START*/
var SetTime = 180;
/*MAC (메세지 인증 코드) */
function PHONE_Check(){
	var UserMobile = $("#mobile");
    var UserMobile_Value = $(UserMobile).val();
    var UserMobile_Msg = $("#PHONE_MSG");
    var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    var regExp2 = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
    
    var checkString_1 = UserMobile_Value.match(regExp);
    var checkString_2 = UserMobile_Value.match(regExp2);
    
    if(UserMobile_Value.length == 0){
		False_Availability(UserMobile_Msg, "필수 정보입니다.", UserMobile, "");
    }else if(checkString_1 == null && checkString_2 == null){
		False_Availability(UserMobile_Msg, "형식에 맞지 않는 번호입니다.", UserMobile, "");
    }else{
		Mobile_Check_Action();
    }
}
 
/*핸드폰 체크 함수 END*/


/*서버에서 핸드폰번호 가입자 존재여부 확인 START*/
function Mobile_Check_Action(){
	var UserMobile = $("#mobile");
	var UserMobile_Value = $(UserMobile).val();
    var UserMobile_Msg = $("#PHONE_MSG");
	$.ajax({
		type : "POST",
		url : "mobile_check_action.jsp",
		cache : false,
		async: false,
		datatype:"text",
		data : {
			"mobile" : UserMobile_Value
		},
		success : function(data){
			var $msg_data = $(data);
			var Massage = $msg_data.filter("#one").text();
			
			if(Massage == ""){
				$(UserMobile).css("border","1px solid #0275f4");
				$(UserMobile_Msg).css({
					"display":"block",
					"color":"#08a600",
				});
				$(UserMobile_Msg).html("인증번호를 발송했습니다.");
				SetTime = 180;
				tid=setInterval('msg_time()',1000);
				
				SMS_Data_Set();
			}else{
				False_Availability(UserMobile_Msg, Massage, UserMobile, "");
			}
		},
		error : function(){
			alert("핸드폰번호 중복체크 중 오류가 발생하였습니다.");
		}
	});
}
/*서버에서 핸드폰번호 가입자 존재여부 확인 END*/

/*핸드폰 번호 자동 하이폰 함수 START*/
function autoHypen() { 
	var phone = $("#mobile").val();
	var phone_num = autoHypenPhone(phone);
	$("#mobile").val(phone_num);
}

function autoHypenPhone(str){
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if( str.length < 4){
    return str;
  }else if(str.length < 7){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3);
    return tmp;
  }else if(str.length < 11){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 3);
    tmp += '-';
    tmp += str.substr(6);
    return tmp;
  }else{
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 4);
    tmp += '-';
    tmp += str.substr(7);
    return tmp;
  }
  return str;
}
/*핸드폰 번호 자동 하이폰 함수 END*/

/*MAC (메세지 인증 코드) 함수 START*/
var MAC="";
var authNo_count = 3;
function SMS_Data_Set(){

	$("#authNo").removeAttr("disabled");
	$("#authNo").css("background-color","#fff");
	$("#smsType").attr("value","S");
	$("#rphone").attr("value","010-7255-0992");
	$("#sphone1").attr("value","010");
	$("#sphone2").attr("value","7255");
	$("#sphone3").attr("value","0992");
	$("#testflag").attr("value","");
	MAC = "";
	authNo_count = 3;
	for(var i = 0; i<6; i++){
    	var random_int = Math.random();
    	random_int *= 10;
    	random_int = Math.floor(random_int);
    	
    	MAC = MAC+random_int;
	}
	$("#code").text("[jap]본인확인\n인증번호["+ MAC +"]를\n입력해주세요.");
	
	SMS_Send();
}
function SMS_Send(){
	var formData = $("#form1").serialize();
	 
	$.ajax({
		type : "POST",
		url : "sms2.jsp",
		cache : false,
		data : formData,
		success : onSuccess,
		error : onError
	});
}
function onSuccess(data){
	var $msg_data = $(data);
	var massage = $msg_data.filter("#one").text();
	var Msg = $("#sendPhoneList");
	$(Msg).html(massage);
}
function onError(data, status){
	alert("데이터 전송오류 발생");
}

function msg_time() {	// 1초씩 카운트
	var m = pad(Math.floor(SetTime / 60),2) + ":" + pad((SetTime % 60),2);
	SetTime--;					// 1초씩 감소
	$("#timer").html(m);		// div 영역에 보여줌 
	if (SetTime < 0) {			// 시간이 종료 되었으면..
    	var UserMobile_Msg = $("#PHONE_MSG");
		$("#PHONE_MSG").css("color","#f00");
		$(UserMobile_Msg).html("인증 유효시간이 초과되었습니다. 다시 인증하시기 바랍니다.");
		$("#authNo").prop("disabled",true);
		$("#authNo").css({
			"background":"#bbb",
			"border":"0"
		});
		$("#authNo").val("");
		$("#timer").html("03:00");
		clearInterval(tid);		// 타이머 해제
	}
	
}

function pad(n, width) {
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}



function check_MAC(){
	var UserMobile = $("#mobile");
	var UserAuthNo = $("#authNo");
    var UserMobile_Value = $(UserMobile).val();
	var UserAuthNo_Value = $(UserAuthNo).val();
    var UserMobile_Msg = $("#PHONE_MSG");
    
	Form_Clear("phone",false);
	
	if(UserAuthNo_Value.length == 6){
		if(MAC == UserAuthNo_Value){
			True_Availability(UserMobile_Msg, "", UserAuthNo, "");
			clearInterval(tid);	
			$("#timer").html("");
			Form_Clear("phone",true);
		}else{
			False_Availability(UserMobile_Msg, "인증코드가 일치하지 않습니 다.", UserAuthNo, "");
			$(UserAuthNo).val("");
			authNo_count--;
			if(authNo_count == 0){
				$(UserMobile_Msg).html("입력횟수가 초과되었습니다. 다시 인증하시기 바랍니다.");
				$(UserAuthNo).prop("disabled",true);
				$(UserAuthNo).css({
					"background":"#bbb",
					"border":"0"
				});
				$("#timer").html("03:00");
				clearInterval(tid);
			}
		}
	}
}
/*MAC (메세지 인증 코드) 함수 END*/



/*생년월일 Form START*/
function Birth_Select(type){
    var birth_type = "#birth_" + type + "_select";
	var test = $(birth_type).val();
    $("#birth_"+type).attr("value",test);
	Form_Clear("birth",false);
	
	if($("#birth_year_select").val() != "default" && $("#birth_month_select").val() != "default" && $("#birth_day_select").val() != "default"){
    	$("#birth").attr("value",$("#birth_year").val()+"-"+$("#birth_month").val()+"-"+$("#birth_day").val());
		Form_Clear("birth",true);
	}
}

function Sum_Day(){
	$("#birth_day_select").html("<option value="+"default"+" selected="+"selected"+">일</option>");
	var UserBirth_Year = $("#birth_year");
	var UserBirth_Month = $("#birth_month");
    var retValue;
    

    
    if($(UserBirth_Year).val() != "default" && $(UserBirth_Year).val() != "" && $(UserBirth_Month).val() != "default" && $(UserBirth_Month).val() !=""  ){
        retValue = fn_GetDatCount(parseInt(UserBirth_Year.value), parseInt(UserBirth_Month.value));
        
        
        for(var i = 1; i <= retValue; i++){ 
            $("#birth_day_select").append( "<option value='"+i+"'>"+i+"</option>");
        }
    }
    
}

function fn_GetDatCount(year,month){
    var retValue="";
    
    if(month == "2"){
        if(year%4==0 && year%100!=0 || year%400 == 0)
            retValue ="29";
        else
            retValue ="28";
    }else if(month=="1" || month=="3" || month=="5" || month=="7" || month=="8" || month=="10" || month=="12"){
    	retValue="31";    
    }else{
    	retValue="30";
    }
    return retValue;
}
/*생년월일 Form END*/


function sex_check(){
	if($("input[name=is_sex]:checked").val() == "M" || $("input[name=is_sex]:checked").val() == "F"){
		Form_Clear("gender",true);
	}
}


function join_check(){
	if(!t1){
		Page_Move("아이디를 입력해주시기 바랍니다.", 0, "#jap_user_id");
	}else if(!t2){
		Page_Move("비밀번호를 입력해주시기 바랍니다.", 0, "#jap_user_pw");
	}else if(!t3){
		Page_Move("비밀번호 재확인을 입력해주시기 바랍니다.", 0, "#jap_user_pw_check");
	}else if(!t4){
		Page_Move("이름을 입력해주시기 바랍니다.", 1, "#jap_user_name");
	}else if(!t5){
		Page_Move("이메일을 입력해주시기 바랍니다.", 1, "#email1");		
	}else if(!t6){
		Page_Move("연락처 인증을 해주시기 바랍니다.", 1, "#mobile");		
	}else if(!t7){
		Page_Move("생년월일을 선택해주시기 바랍니다.", 3, "#mobile");
	}else if(!t8){
		Page_Move("성별을 선택해주시기 바랍니다.", 3, "#mobile");
	}else{
		$("#membership_form").submit();
	}
	return 0;
}

function Page_Move(Art, Page_N, Selecter){
	alert(Art);
	$(".menu").eq(Page_N).click();
	$(Selecter).focus();
}