var arg = JSON.parse(str_arg);

$(document).ready(function(){
	$('#Keyword').keypress(function(event){
	    if(event.which==13) search();
	});
    $(".navbar-toggler").click(function(){
        $("#menu-mobile").show();
    });
    $(".close").click(function(){
        $("#menu-mobile").hide();
    });
	$("#totop").click(function () {
	    $("html, body").animate({scrollTop: 0}, 500);
	    return false
	});
});

function URLToArray(url) {
    var request = {};
    var pairs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0; i < pairs.length; i++) {
        if(!pairs[i])  continue;
        var pair = pairs[i].split('=');
        request[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
     }
     return request;
}

function search(kid) {
	var Keyword = $("#Keyword").val();
	var Type = $("#Type").val();
	var search_router = (Type==0)?'product':(Type==1?'supplier':'quote');
	var url;
	if(Keyword==''){
		noticeMsg('Message', 'Vui lòng nhập từ khóa...', 'error');
		$("#Keyword").focus();
		return false;
	}else if(Keyword!=''){
		url = arg.domain+search_router+"?k="+encodeURI(Keyword)+"&t="+Type;
		window.location.href = url;
	}
}

function LoadCategory(id, level){
	var Data = {};
	Data['id'] = id;
	Data['ajax_action'] = "load_category";
	var id_set = level+1;
	
	loading();
	$.post('?mod=home&site=ajax_handle', Data).done(function(e){
		$("#Cate"+id_set+" select").html(e);
		if(id_set==1) $("#Cate2 select").html('');
		endloading();
	});
}

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
function goBack() {
	$("#content-search").fadeOut(50);
	$("#main").fadeIn(100);
}
function goBackHistory() {
	window.history.back();
}
function loading(){
	$("#loading").show();
}

function endloading(){
	$("#loading").hide();
}