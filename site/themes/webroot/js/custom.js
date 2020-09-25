var arg = JSON.parse(str_arg);
$(function() {
	  $('.lazy').lazy();
});
$(document).ready(function(){
	var arr_keyword = [];
	$.getJSON(arg.json_keyword, function(data) {
	    $.each(data, function(key, value) {
	        if ($.inArray(value, arr_keyword) === -1) {
	        	arr_keyword.push(value)
	        }
	    })
	});
	
	$(document).click(function (e) {
		var container = $("#search_suggest_api");
		if (!container.is(e.target) && container.has(e.target).length === 0) {
			container.hide();
		}
	});

	$("#Keyword_api").keyup(function (){
		$("#search_suggest_api").html("");
		var a = true;
		// if (event.which == 32)
		if (event.which == 32) {
			$("#search_suggest_api").css("display", "block");
			var Keyword = $("#Keyword_api").val();
			var data = {};
			data.key = Keyword;
			$.post('?mod=product&site=suggest', data).done(function (e) {
				var data = JSON.parse(e);
				var xhtml = `<div class="wrap-suggest">
								<ul class="main-suggest">`;
				
				data.forEach((e, i) => {
					if (e.category != '') {
						xhtml += `<li><a href="/product?k=` + e.category +`" class="w-90 main-suggest-text">` + e.category + `</a>`;
						if (e.attribute_contents != null) {
							xhtml += `<span class="w-10 text-right"><i class="fa fa-arrow-right" aria-hidden="true"></i></span>
									<ul class="sub-suggest">`;
							e.attribute_contents.forEach((items) => {
								xhtml += `<li class="sub-suggest-text">
											<div class="row">
												<span class="col-md-12 mr-2 mt-2 mb-2 mt-lg-0 "><b>`+ items.name + `:</b></span>
												<div class="col-md-12">`;
								items.contents.forEach(items2 => {
									console.log(items2);
									if (items2.img_name != ''){
										xhtml += `<a href="/product?k=` + e.category + `&attribute_keyword=` + items2.name + `"
											class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 ">
											<div class="card" style="min-width: 55px;">
												<img class="img-attr"
													src="/site/upload/attribute/`+ items2.img_name + `"
													title="Loại A">
												<div class="card-body p-1 text-center">
													<span>`+ items2.name + `</span>
												</div>
											</div>
										</a>`;
									}else{
										xhtml += `<a href="/product?k=` + e.category + `&attribute_keyword=` + items2.name + `"
											class="form-check form-check-inline mr-2 mt-2 mb-2 mt-lg-0 bg-white">
												<span>`+ items2.name + `</span>
										</a>`;
									}
								});
								xhtml += `</div></div></li>`;
							});
							xhtml += `</ul>`;
						}
						xhtml += `</li>`;
					}
				});

				xhtml += `</ul></div>`;
				
				$("#search_suggest_api").html(xhtml);
			});
		}
	});

	// $("#search_suggest_api").mouseout(function (){
	// 	$("#search_suggest_api").css("display", "none");
	// });

	$("#Keyword").autocomplete({
	    source: function(request, response) {
	        var results = $.ui.autocomplete.filter(arr_keyword, request.term);
			response(results.slice(0, 10));
	    }
	});
	
	$("#KeyMap").autocomplete({
	    source: function(request, response) {
	        var results = $.ui.autocomplete.filter(arr_keyword, request.term);
			response(results.slice(0, 10));
	    }
	});
	
	$('#Keyword').keypress(function(event){
	    if(event.which==13) search();
	});

	$('#Keyword_api').keypress(function (event) {
		if (event.which == 13) search();
	});

	$("#mKeyword").autocomplete({
	    source: function(request, response) {
	        var results = $.ui.autocomplete.filter(arr_keyword, request.term);
	        response(results.slice(0, 10));
	    }
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
	if ($("#horizontalmenu").length) {
		$('#horizontalmenu').ddscrollSpy({ // initialize first demo
			scrolltopoffset : 0
		});
	}
	setTimeout(function(){ 
		$('.load_product_recommen').load('?mod=system&site=ajax_load_product_recommen&location='+arg.id_location);
	}, 2000);

	//console.log('?mod=system&site=ajax_load_product_recommen&id='+arg.id_location);
	
});

$(window).scroll(function () {
    if ($(this).scrollTop() > $(window).height()-300) $(".contact-supplier").addClass('fixed');
    else $(".contact-supplier").removeClass('fixed');
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

	
	if ($("#Keyword").length > 0) {
		var Keyword = $("#Keyword").val();
	}
	if ($("#Keyword_api").length > 0) {
		var Keyword = $("#Keyword_api").val();
	}
	
	var str_key = findAndReplace(Keyword," ","+");
	var Type = $("#Type").val();
	var search_router = (Type==0)?'product':(Type==1?'supplier':'quote');
	var url;
	if(Keyword==''){
		noticeMsg('Message', 'Vui lòng nhập từ khóa...', 'error');
		$("#Keyword").focus();
		return false;
	}else{ 
		var data = {};
		data.key = Keyword;
		data.kid = kid;
		console.log(data);	
		data.ajax_action = 'save_keyhistory';
		$.post('?mod=home&site=ajax_handle', data).done(function(){
			url = arg.url_location+search_router+"?k="+encodeURI(str_key)+"&t="+Type;
			window.location.href = url;
		});
	}
}

function msearch(kid) {
	var Keyword = $("#mKeyword").val();
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
			url = arg.url_location+search_router+"?k="+encodeURI(str_key)+"&t="+Type;
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
function LoadKeyword(key){
	var data = {};
	data.key = key;
	$("#search_suggest").load('?mod=home&site=load_search_suggest', data, function(e){
		console.log(e);
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
function LoadInfoUser(){
	$('.list_info_user').load('?mod=system&site=info_listuser');
}
function add_cart(id, number){
	var data = {};
	data['id'] = id;
	data['number'] = number;
	data['ajax_action'] = "cart_add_product";
	loading();
	$.post('./?mod=product&site=ajax_handle', data).done(function(e){
		location.href = "./?mod=product&site=cart";
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

function SetMoney(obj){
	var n = 0;
	var value = $(obj).val().replace(/,/g, "");
	if(value==null || value=='') value = 0;
	var re = '\\d(?=(\\d{' + (3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    var rt = parseFloat(value).toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
	if(rt==0) rt = '';
	$(obj).val(rt);
}
function SetLocation(value){
	var location1 = $("#Location_"+value).val();
	// console.log(location1);
	$.post('?mod=system&site=ajax_set_location_used',{'location1':location1}).done(function(e){
	var data = JSON.parse(e);
	// location.reload();
	window.location.href = data.url;
	});
}
function SetLocationMobile(id){
	$.post('?mod=system&site=ajax_set_location_used',{'location1':id}).done(function(e){
	var data = JSON.parse(e);
	//location.reload();
	window.location.href = data.url;
	});
}
function GetSupplierLocation(id){
	$.post('?mod=system&site=ajax_set_location_used',{'location1':id}).done(function(e){
	var data = JSON.parse(e);
	//location.reload();
	window.location.href = data.url;
	});
}

$('.slider_brand').owlCarousel({
	'items' : 3,
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : true,
	'smartSpeed' : 500,
	'stagePadding' : 20,
	'margin' : 2

});
$('.slider_all_service').owlCarousel({
	'items' : 3,
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : false,
	'smartSpeed' : 500,
	//'stagePadding' : 10,

});
$('.slider_cate_hot').owlCarousel({
	'items' : 3,
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : false,
	'smartSpeed' : 500,
	'stagePadding' : 20,

});
$('.slider_nation').owlCarousel({
	'items' : 4,
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : false,
	'smartSpeed' : 500,
	'stagePadding' : 20,

});
$('.slider_prod_hot').owlCarousel({
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : false,
	'smartSpeed' : 500,
	'margin' : 5,
	'responsive' : {
		0 : {
			items : 3,
			nav : false
		},
		600 : {
			items : 3,
			nav : false
		},
		1000 : {
			items : 4,
		}
	}
});
$('.slider_cate_all').owlCarousel({
	'loop' : true,
	'nav' : false,
	'dots' : false,
	'autoplay' : false,
	'smartSpeed' : 500,
	'margin' : 5,
	'stagePadding' : 60,
	'responsive' : {
		0 : {
			items : 1,
			nav : false
		},
		600 : {
			items : 1,
			nav : false
		},
		1000 : {
			items : 1,
		}
	}
});
