$(document).ready(function(){
	$("#sub-tab ul li").mouseenter(function(){
		$("#sub-tab ul li").removeClass("active");
		$(this).addClass("active");
	});
	$("#sub-tab ul").mouseleave(function(){
		$("#sub-tab ul li").removeClass("active");
		$("#sub-tab ul li:first-child").addClass("active");
	});
	
	$(".post").hover(function(){
		$(this).children(".post-meta").children(".post-contents-container").children("h3").css("color","#fac200");
		$(this).children(".post-thumb").children("img").addClass("on");
	},function(){
		$(this).children(".post-meta").children(".post-contents-container").children("h3").css("color","#000");
		$(this).children(".post-thumb").children("img").removeClass("on");
	});
});

function Pagechenge(count){
	var form1 = document.forms['form1'];
	$('input:hidden[name="page"]').val(count);
	
	form1.submit();
}