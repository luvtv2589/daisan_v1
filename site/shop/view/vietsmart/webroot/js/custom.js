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
