var arg = JSON.parse(str_arg);

$(document).ready(function(){
	var arr_keyword = [];
	$.each(arg.json_keyword, function(key, value) {
		if ($.inArray(value, arr_keyword) === -1) {
			arr_keyword.push(value)
		}
	})
	$("#search_key").autocomplete({
		source : function(request, response) {
			var results = $.ui.autocomplete.filter(arr_keyword, request.term);
			response(results.slice(0, 10));
		},
		select : function(event, ui) {
			search(ui.item.value);
		},
	});
	$('#search_key').keypress(function(event){
	    if(event.which==13) search();
	});
	$('#search_key').change(function(){ search(); });
	$("#search_key_mobile").autocomplete({
	    source: function(request, response) {
	        var results = $.ui.autocomplete.filter(arr_keyword, request.term);
	        response(results.slice(0, 10));
	    },
	    select: function (event, ui) { search_mobile(ui.item.value); },
	});
	$('#search_key_mobile').keypress(function(event){
	    if(event.which==13) search_mobile();
	});
	$('#search_key_mobile').change(function(){
		search_mobile();
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
	if ($("#horizontalmenu").length) {
		$('#horizontalmenu').ddscrollSpy({ // initialize first demo
			scrolltopoffset : 0
		});
	}
	LoadFastCartDetail();
});
$(window).on('load', function() {
	$('#preloading').fadeOut('fast');
});
$(window).scroll(function() {
	var width=$(document).width();
	if(width>1000){
		if ($(this).scrollTop() > 100) {
			$('.back-to-top').fadeIn();
		} else {
			$('.back-to-top').fadeOut();
		};
	};
});
$('.back-to-top button').click(function() {
	$('html, body').animate({
		scrollTop : 0
	}, 500);
});
$(window).scroll(function () {
    if ($(this).scrollTop() > $(window).height()-300) $(".contact-supplier").addClass('fixed');
    else $(".contact-supplier").removeClass('fixed');
});
function ShowAllService() {
	$("#fsAllService").modal('show');
	$('.modal-backdrop').remove();
}
function LoadFastCartDetail(){
	$('.list_cart').load('?mod=product&site=cart_fastdetail', function(){
		var number_product = $('#cart_product_number').html();
		$('.number_cart').html(number_product);
	});
}

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

function search(value) {
	var key = $("#search_key").val();
	var str_key = findAndReplace(key," ","+");
	var url = arg.url_import+'?mod=home&site=index';
	if(key==''){
		$("#search_key").focus();
		return false;
	}else{
		var data = {};
		data.key = key;
		data.kid = value;
		data.ajax_action = 'save_keyhistory';
		$.post('?mod=home&site=ajax_handle', data).done(function(){
			if(!value) url = url+"&key="+encodeURI(str_key);
			else url = url+"&key="+encodeURI(value);
			window.location.href = url;
		});
	}
}
function search_mobile(value) {
	var key = $("#search_key_mobile").val();
	var url = arg.url_import+'?mod=home&site=index';
	if(key==''){
		$("#search_key_mobile").focus();
		return false;
	}else{
		if(!value) url = url+"&key="+encodeURI(key);
		else url = url+"&key="+encodeURI(value);
		window.location.href = url;
	}
}


function findAndReplace(string, target, replacement) {
	 var i = 0, length = string.length;
	 for (i; i < length; i++) {
	   string = string.replace(target, replacement);
	 }
	 return string;
}

function LoadKeyword(key){
	var data = {};
	data.key = key;
	$("#search_suggest").load('?mod=home&site=load_search_suggest', data, function(e){
		if(e!='') $("#search_suggest").show();
		else $("#search_suggest").hide();
	});
}

var item = 0;
function GetKeyword(e) {
	if (e.keyCode == '38' || e.keyCode == '40') {
		var maxitem = $("#search_suggest li").length;
		if (e.keyCode == '38') {
			if (item == 0) item = maxitem;
			else item -= 1;
		} else if (e.keyCode == '40') {
			if (item == maxitem) item = 0;
			else item += 1;
		}
		$("#search_suggest li").removeClass('active');
		$("#SugId" + item).addClass('active');
		var itemvalue = $("#SugId"+item+" a").html();
		$("#Keyword").val(itemvalue);
	}
}

function AddToCart(product_id, page_id, price){
	var data = {};
	data['product_id'] = product_id;
	data['page_id'] = page_id;
	data['price'] = price;
	data['action'] = "cart_add";
	loading();
	$.post('?mod=product&site=ajax_handle', data).done(function(e){
		LoadFastCartDetail();
		noticeMsg('Thông báo', 'Sản phẩm đã được thêm vào giỏ hàng', 'success');
		endloading();
		return false;
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
	$("#Keyword").focus();
}
function goBack() {
	$("#content-search").fadeOut(50);
	$("#main").fadeIn(100);
}
function goBackHistory() {
	window.history.back();
}
function loading(){
	$('#preloading').show();
}

function endloading(){
	$('#preloading').fadeOut('fast');
}

function SetMoney(obj){
	var n = 0;
	var value = $(obj).val().replace(/,/g, "");
	if(value==null || value=='') value = 0;
	var re = '\\d(?=(\\d{' + (3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    var rt = parseFloat(value).toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
	if(rt==0) rt = '';
	$(obj).val(rt);
}

function LoadLocation(type, value) {
	loading();
	$.post('?mod=help&site=ajax_load_location', {'type' : type, 'value' : value}).done(function(e) {
		$("#"+type).html(e);
		if (type == 'province'){
			$("#district").html('');
			$("#wards").html('');
		}else if (type == 'district') $("#wards").html('');
		endloading();
	});
}
