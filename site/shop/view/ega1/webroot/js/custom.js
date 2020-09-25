arg = JSON.parse(arg);

$(document).ready(function(){
	$('#Keyword').keypress(function(event){
	    if(event.which==13) search();
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
	var sour = arg.url_sour;
	var keyword = $("#search #search_key").val();
	var url = arg.url_page+sour+"site=search&k=" + encodeURI(keyword);
	window.location.href = url;
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

function loading(){
	$("#loading").show();
}

function endloading(){
	$("#loading").hide();
}
