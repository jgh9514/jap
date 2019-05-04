$(document).ready(function(){
	$(".eTip").on("click",function(){
		$(this).parent().find(".tooltip").css("display","block");
	});
	$(".eClose").on("click",function(){
		$(this).parent().css("display","none");
		
	});
	
	
	
	$("input:checkbox:checked").prop("checked",false);
	var ord = $('input:hidden[name="ord"]').val();
	var sort = $('input:hidden[name="sort"]').val();
	var page = $('input:hidden[name="page"]').val();
	var rows = $('input:hidden[name="rows"]').val();
	if(ord == "null" || ord==""){
	}
	else{
	}
	
	$("#member_search thead tr th .check_all").click(function(){
		if($(this).is(":checked")){
			$("#member_search tbody tr").find('input:checkbox[name="check_box"]').prop("checked", true);
			$("#member_search tbody tr").css("background-color","#fff3a1");
		}
		else{
			$("#member_search tbody tr").find('input:checkbox[name="check_box"]').prop("checked", false);
			$("#member_search tbody tr").css("background-color","#fff");
		}
	});
	
	$("#member_search tbody tr td input:checkbox").click(function(){
		
		if($(".list_check:checked").length == $(".list_check").length){
			$(".check_all").prop("checked", true);
		}else{
			$(".check_all").prop("checked", false);
		}
		
		if($(this).is(":checked")){
			$(this).parents("tr").css("background-color","#fff3a1");
		}
		else{
			$(this).parents("tr").css("background-color","#fff");
		}
	});
	
	
});



function submitSearch(name, sort_way){
	
	var form1 = document.forms['form1'];
	$('input:hidden[name="ord"]').val(name);
	$('input:hidden[name="sort"]').val(sort_way);
	
	
	form1.submit();
	
}


function RowsChenge(){
	var form1 = document.forms['form1'];
	var row = $("#rows").val();
	$('input:hidden[name="rows"]').val(row);
	$('input:hidden[name="page"]').val(1);
	
	form1.submit();
}


function Pagechenge(count){
	var form1 = document.forms['form1'];
	$('input:hidden[name="page"]').val(count);
	
	form1.submit();
}


function excel_down(){
	location.href='./excel_download.jsp';	
}

function delete_choice(){
	var check_user_id_delete = new Array();
	$("#member_search tbody tr").each(function(){
		var check_list = $(this).find(".list_check").is(":checked");
		if(check_list){
			check_user_id_delete.push($(this).find(".list_check").val());
		}
	});
	if(check_user_id_delete == ""){
		alert("삭제할 회원을 선택해 주세요.");
	}
	else{
		var delete_message = confirm("탈퇴/삭제 하시겠습니까? \n탈퇴/삭제된 아이디는 재가입 및 복구가 불가합니다.");
		if(delete_message == false){
			alert("삭제되지 않았습니다.");
		}
		else{
			var form1 = document.forms['form1'];
			$(form1).attr("action","user_delete_action.jsp");
			form1.submit();
			//삭제 페이지 개설하여 파라미터 값 전달하면 됨
		}
	}
}