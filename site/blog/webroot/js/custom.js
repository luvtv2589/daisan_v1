var arg = JSON.parse(str_arg);

$(document).ready(function(){
	$('#search_key').keypress(function(event){
	    if(event.which==13) search();
	});
	$('.navigation').on('click', function() {
		$('#sidebar').addClass('active');
		$('.overlay').fadeIn();
		$('a[aria-expanded=true]').attr('aria-expanded', 'false');
	});
	$('.overlay').on('click', function() {
		$('#sidebar').removeClass('active');
		$('.overlay').fadeOut();
	});
	$('.back-to-top button').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 500);
	});
});

function search() {
	var Keyword = $("#search_key").val();
	url = "?mod=posts&site=search&key="+encodeURI(Keyword);
	window.location.href = url;
}
$(window).scroll(function() {
	if ($(this).scrollTop() > $(window).height() - 300)
		$(".head_top_fixed").addClass('showmenu');
	else
		$(".head_top_fixed").removeClass('showmenu');
});
function ShowAllCateNews() {
	$("#fsAllCateNews").modal('show');
	$('.modal-backdrop').remove();
}
function ShowInfoUser() {
	$("#fsInfoUser").modal('show');
	$('.modal-backdrop').remove();
}
$(window).scroll(function() {
	var width = $(document).width();
	if (width > 1000) {
		if ($(this).scrollTop() > 100) {
			$('.back-to-top').fadeIn();
		} else {
			$('.back-to-top').fadeOut();
		}
		;
	}
	;
});

function noticeMsg(title, text, type){
	if(type==null) type = "info";
	var notice = new PNotify({
		title: title,
		text: text,
		type: type,
		mouse_reset: false,
		buttons: {sticker: false},
		animate: {animate: true, in_class: 'fadeInDown', out_class: 'fadeOutRight'}
	});
	notice.get().click(function () {
		notice.remove();
	});
}

function loading(){
	$("#loading").show();
}

function endloading(){
	$("#loading").hide();
}
