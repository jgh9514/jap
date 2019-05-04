$(document).ready(function() {
	$("html").css({
		width:window.innerWidth,
		height:window.innerHeight
	});
	$("#overflow_container").css({
		height:window.innerHeight
	});
	if(window.innerWidth > 768 ){
		div_margin();
	}
	$(window).resize(function(){
		$("html").css({
			width:window.innerWidth,
			height:window.innerHeight
		});
		$("#overflow_container").css({
			height:window.innerHeight
		});

		if(window.innerWidth > 768 ){
			div_margin();
		}
	});
});


function div_margin(){
	
	var overflow_width = $("#overflow_container").css('width').replace(/[^-\d\.]/g, '');
	var overflow_height = $("#overflow_container").css('height').replace(/[^-\d\.]/g, '');
	
	$('.div_margin').each(function (index, item) {

		var login_width = $(item).css('width').replace(/[^-\d\.]/g, '');
		var login_height = $(item).css('height').replace(/[^-\d\.]/g, '');
		
		$(item).css({
			marginLeft:(overflow_width- login_width)/2,
			marginRight:(overflow_width - login_width)/2,
			marginTop:(window.innerHeight - login_height)/2,
			marginBottom:(window.innerHeight - login_height)/2
		});
		$(window).resize(function(){
			$(item).css({
				marginLeft:(overflow_width- login_width)/2,
				marginRight:(overflow_width - login_width)/2,
				marginTop:(window.innerHeight - login_height)/2,
				marginBottom:(window.innerHeight - login_height)/2
			});
		});
	});
}

function membership(pt_left){
	
	$("#position_container").animate({
		"left" : pt_left +"px"
	},500);
	
}