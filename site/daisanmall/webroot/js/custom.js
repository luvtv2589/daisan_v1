var arg = JSON.parse(str_arg);

$(document).ready(function(){
	$('#Keyword').keypress(function(event){
	    if(event.which==13) search();
	});
	$('#mKeyword').keypress(function(event){
	    if(event.which==13) msearch();
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
	$('.load_product_recommen').load('?mod=home&site=ajax_load_product_recommen');
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
		url = arg.url_location+search_router+"?k="+encodeURI(Keyword)+"&t="+Type;
		window.location.href = url;
	}
}
function msearch(kid) {
	var Keyword = $("#mKeyword").val();
	console.log(Keyword);
	var str_key = findAndReplace(Keyword," ","+");
	var Type = $("#Type").val();
	var search_router = (Type==0)?'product':(Type==1?'supplier':'quote');
	var url;
	if(Keyword==''){
		noticeMsg('Message', 'Vui lòng nhập từ khóa...', 'error');
		$("#mKeyword").focus();
		return false;
	}else if(Keyword!=''){
		var data = {};
		data.key = Keyword;
		data.kid = kid;
		data.ajax_action = 'save_keyhistory';
		$.post('?mod=home&site=ajax_handle', data).done(function(){
			url = arg.domain+search_router+"?k="+encodeURI(str_key)+"&t="+Type;
			window.location.href = url;
		});
	}
}
function findAndReplace(string, target, replacement) {
	 var i = 0, length = string.length;
	 for (i; i < length; i++) {
	   string = string.replace(target, replacement);
	 }
	 return string;
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
function showSearch() {
	$("#main").fadeOut(100);
	$("#content-search").fadeIn(50);
	$("#mKeyword").focus();
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