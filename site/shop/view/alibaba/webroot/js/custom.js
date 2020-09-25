arg = JSON.parse(arg);

$(document).ready(function(){
	$('#searchpage_key').keypress(function(event){
	    if(event.which==13) searchpage();
	});
	$('#Keyword').keypress(function(event){
	    if(event.which==13) search();
	});
	$('#searchmobile').keypress(function(event){
	    if(event.which==13) searchmobile();
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

function searchpage(kid) {
	var sour = arg.url_sour;
	var keyword = $("#searchpage_key").val();
	var url = arg.url_page+sour+"site=search&k=" + encodeURI(keyword);
	window.location.href = url;
}
function searchmobile(kid) {
	var sour = arg.url_sour;
	var keyword = $("#searchmobile").val();
	var url = arg.url_page+sour+"site=search&k=" + encodeURI(keyword);
	window.location.href = url;
}

function search(kid) {
	var Keyword = $("#Keyword").val();
	var Type = $("#Type").val();
	var search_router = (Type==0||!Type)?'product':(Type==1?'supplier':'quote');
	var url;
	if(Keyword==''){
		noticeMsg('Message', 'Vui lòng nhập từ khóa...', 'error');
		$("#Keyword").focus();
		return false;
	}else if(Keyword!=''){
		var data = {};
		data.key = Keyword;
		data.kid = kid;
		data.ajax_action = 'save_keyhistory';
		$.post('?mod=home&site=ajax_handle', data).done(function(){
			url = arg.domain+search_router+"?k="+encodeURI(Keyword)+"&t="+Type;
			window.location.href = url;
		});
	}
}

function SendContact(){
	var data = {};
	data['page_id'] = $("#contact input[name=page_id]").val();
	data['product_id'] = $("#contact input[name=product_id]").val();
	data['message'] = $("#contact textarea[name=message]").val();
	data['ajax_action'] = 'send_contact';
	
	if(data.message.length<20 || data.message.length>1000){
		noticeMsg('Thông báo', 'Vui lòng nhập nội dung 20 đến 1000 ký tự.', 'error');
		$("#contact textarea[name=message]").focus();
		return false;
	}
	
	var url = arg.url_page+arg.url_sour+"site=contact";
	loading();
	$.post(url, data).done(function(e){
		var data = JSON.parse(e);
		if(data.code==1){
			noticeMsg('System Message', data.msg, 'success');
			$("textarea[name=message]").val('');
			endloading();
		}else{
			noticeMsg('System Message', data.msg, 'error');
			endloading();
		}
	});
}

function noticeMsg(title, text, type){
	if(type==null)
		type = "info";
	var notice = new PNotify({
		title: title,
		text: text,
		type: type,
		mouse_reset: false,
		buttons: {
			sticker: false
		},
		animate: {
			animate: true,
			in_class: 'fadeInDown',
			out_class: 'fadeOutRight'
		}
	});
	notice.get().click(function () {
		notice.remove();
	});
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