{literal}
<style>
	.results-box {
		position: fixed;
		left: 2%;
		top: 88px;
		width: 400px;
		z-index: 100;
		overflow: hidden;
		border-radius: 3px;
		background: #fff;
		-webkit-transition: all .3s;
		-moz-transition: all .3s;
		-ms-transition: all .3s;
		-o-transition: all .3s;
		transition: all .3s;
	}

	.list_address_title {
		background: #4caf50;
		padding: 22px 15px 22px 20px;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
		line-height: 1.2;
		font-size: 22px;
		font-weight: 300;
		color: #fff;
		z-index: 5;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
		line-height: 1.2;
		font-size: 22px;
		font-weight: 300;
		color: #fff;
	}

	.list_address {
		/*height: 200px;*/
		position: fixed;
		top: 160px;
		left: 2%;
		bottom: 20px;
		width: 400px;
		z-index: 99px;
		overflow: hidden;
		border-radius: 3px;
		background: #fff;
		-webkit-transition: all .3s;
		-moz-transition: all .3s;
		-ms-transition: all .3s;
		-o-transition: all .3s;
		transition: all .3s;
		overflow-y: scroll;
	}

	.itemaddress {
		padding: 15px 20px;
		text-align: left;
		background: #fff;
		border: 2px solid #fff;
		overflow: hidden;
	}

	.itemaddress:hover {
		background: #f5f5f5;
		cursor: pointer;
	}

	.itemaddress.active {
		border: 1px solid #000;
		background: #f5f5f5;
	}

	.modal-dialog {
		left: 50px;
		top: 60px;
		position: absolute;
		width: 400px;
		z-index: 999;
		}
	    #map_div {
		height: 650px;
		width: 100%;
		}

	@media ( max-width :768px) {
		#map_div {
			height: 300px;
			width: 100%;
		}
		.itemaddress {
		    padding: 10px;
		    border-bottom: 1px solid #ccc;
		}
		.modal-dialog {
			position: fixed;
		    margin: 0;
		    width: 100%;
		    height: 100%;
		    padding: 0;
		    left: 0;
		    top:0;
     	}
     }
	.categories-list-item:hover{
		color: red;
	}
	.categories-list{width: 450px; padding: 0px 15px;}

	/* Clearable text inputs */
	.clearable{
		background: #fff url("../images/icons/mJotv.gif") no-repeat right -10px center;
		/*border: 1px solid #999;*/
		/*padding: 3px 18px 3px 4px;     !* Use the same right padding (18) in jQ! *!*/
		/*border-radius: 3px;*/
		/*transition: background 0.4s;*/
	}
	.clearable.x  { background-position: right 5px center; } /* (jQ) Show icon */
	.clearable.onX{ cursor: pointer; }              /* (jQ) hover cursor style */
	.clearable::-ms-clear {display: none; width:0; height:0;} /* Rem
	.categories-list-item:hover{}
</style>

{/literal}
<div id="map_content">
	<div class="row">
		<div class="col-3">
			<div class="results-box d-none d-sm-block">
				<div class="d-flex bd-highlight border-bottom list_address_title"
					 data-toggle="collapse" data-target="#collapseExample"
					 aria-expanded="false" aria-controls="collapseExample">
					<div class="flex-grow-1 bd-highlight">Kết quả tìm kiếm</div>
					<a href="javascript:void(0)"><i class="fa fa-angle-down fa-fw text-white"></i></a>
				</div>

				<div class="collapse list_address list-online-agents show" id="collapseExample"></div>
			</div>
		</div>
		<div id="map_div"></div>
		<!-- Danh sách trên mobile -->
		<div class="col-md-12 d-block d-sm-none">
			<p class="px-3 py-2 mb-0">
				Kết quả tìm kiếm cho <b></b>
			</p>
			<div class="list_address_mobile list-online-agents show" id="style_scroll"></div>
			<div class="clearfix"></div>
		</div>
		<!-- end -->
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	 aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content border-0 shadow">
			<img src="" class="img-fluid modal_image">
			<div class="modal-header rounded-0 list_address_title py-2">
{*				<h3 class="modal-title text-lg" id="modal_name_page">Diamond Palace</h3>*}
				<h3 class="modal-title text-lg modal_name_page"></h3>
				<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="dropdown-divider"></div>
				<ul class="nav flex-column">
					<li class="nav-item nav-link"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i><span class="modal_address pl-2"></span></li>
					<li class="nav-item nav-link"><i class="fa fa-phone fa-fw" aria-hidden="true"></i><span class="modal_phone pl-2"></span></li>
					<li class="nav-item nav-link"><i class="fa fa-envelope-o fa-fw " aria-hidden="true"></i><span class="modal_email pl-2"></span></li>
				</ul>
			</div>
			<div class="modal-footer">
				<a href="" class="btn btn-success modal_pageurl" target="_blank">Đến gian hàng</a>
			</div>
		</div>
	</div>
</div>

{literal}
	<script>
		var geocoder;
		var center, lat_search, lng_search;
		var map;
		var lat = 20.9937774;
		var lng = 105.8114176;
		var radius = 1500000;
		var agents = [];
		var marker = {};
		var markers = [];
		// var locations = [];
		// var txt = $('#search-agent').val().trim();
		var agentOnlineListWrapper = $('.list-online-agents ul');
		// $('form input').on('keypress', function(e) {
		// 	return e.which !== 13;
		// });
		$('form input:not([type="submit"])').keydown(function(e) {
			var keyCode = e.keyCode || e.which;
			$('.dropdown-menu').toggleClass('hide');
			if (keyCode === 13) {
				e.preventDefault();
				searchAddress()
				return false;
			}
		});

		// $(document).on('keyup keypress', 'input', function(e) {
		// 	if(e.which == 13) {
		// 		$('.dropdown-menu').toggleClass('hide');
		// 		e.preventDefault();
		// 		return false;
		// 	}
		// });

		// $('#Keyword').on('keyup keypress', function(e) {
		// 	console.log(213123)
		// 	var keyCode = e.keyCode || e.which;
		// 	$('.dropdown-menu').toggleClass('hide');
		// 	if (keyCode === 13) {
		// 		e.preventDefault();
		// 		return false;
		// 	}
		// });

		function submitFormSearch() {
			console.log(123123)
			return false;
		}

		function tog(v){return v?'addClass':'removeClass';}
		$(document).on('input', '.clearable', function(){
			$(this)[tog(this.value)]('x');
		}).on('mousemove', '.x', function( e ){
			$(this)[tog(this.offsetWidth-18 < e.clientX-this.getBoundingClientRect().left)]('onX');
		}).on('touchstart click', '.onX', function( ev ){
			ev.preventDefault();
			$(this).removeClass('x onX').val('').change();
		});

		$(document).ready(function () {
			if ($(window).width() < 700) {
				$('#mmenu_map').on('click', function() {
					$('#sidebar').removeClass('active');
					$('.overlay').fadeIn();
					$('a[aria-expanded=true]').attr('aria-expanded', 'false');
				});
				$('.overlay').on('click', function() {
					$('#sidebar').addClass('active');
					$('.overlay').fadeOut();
				});

			} else {
				$('#mmenu_map').on('click', function() {
					$("#sidebar").toggleClass('active');
					$('#content').toggleClass('active');
				});
			}

			$('body').on('click', '.online-location', function () {
				var infoWindow = new google.maps.InfoWindow();
				infoWindow.close();
				var agentId = $(this).data("id");
				var lat = Number($(this).data("lat"));
				var lng = Number($(this).data("lng"));
				var address = String($(this).data("address"));
				var name_page = String($(this).data("name_page"));
				var phone = String($(this).data("phone"));
				var email = String($(this).data("email"));
				var image = String($(this).data("image"));
				var url = String($(this).data("url"));
				var icon_cam = 'site/upload/3.png';
				var icon = {
					url: icon_cam, // url
					scaledSize: new google.maps.Size(30, 35), // size
				};
				// clearMarkers(map);
				if (marker[agentId] !== undefined) {
					marker[agentId].setMap(null);
					delete marker[agentId];
				}
				marker[agentId] = new google.maps.Marker({
					position: {lat: lat, lng: lng},
					map: map,
					animation: google.maps.Animation.DROP,
					// animation: google.maps.Animation.BOUNCE,
					// draggable: true,
					title: name_page + "<br>" + address,
					icon: icon,
					// label: {
					// 	text: name_page,
					// 	color: "#0c0909",
					// 	fontWeight: "bold"
					// }
				});
				markers.push(marker[agentId]);
				map.setCenter(new google.maps.LatLng(lat, lng));
				map.setZoom(12);
				clickIcon(agentId, name_page, address, email, phone, image, url);
				$(this).addClass('active').siblings('.active').removeClass('active');
				$(".modal_name_page").text(name_page);
				$(".modal_address").text(address);
				$(".modal_email").text(email);
				$(".modal_phone").text(phone);
				$(".modal_image").attr('src',image);
				$(".modal_pageurl").attr('href',url);
				$("#exampleModal").modal();
			});
			//
			// $('#location_id').select2({
			// 	// placeholder: '---Tất cả---'
			// });

			jQuery.expr[':'].contains = function(a, i, m) {
				return jQuery(a).text().toUpperCase()
						.indexOf(m[3].toUpperCase()) >= 0;
			};
		});

		function clickIcon(agentId, name_page, address, email, phone, image, url) {
			var infoWindow = new google.maps.InfoWindow();
			google.maps.event.addListener(marker[agentId], 'click', function() {

				if(!marker[agentId].open){
					infoWindow.open(map, marker[agentId]);
					infoWindow.setContent(name_page + "<br>" + address);
					$(".location-" + agentId).addClass('active').siblings('.active').removeClass('active');
					agentId = agentId.replace("link", "");
					// Scroll
					$('#collapseExample').animate({
						scrollTop: $("#location-"+agentId).offset().top},
					'slow');

					$(".modal_name_page").text(name_page);
					$(".modal_address").text(address);
					$(".modal_email").text(email);
					$(".modal_phone").text(phone);
					$(".modal_image").attr('src',image);
					$("#exampleModal").modal();
					marker[agentId].open = true;
				}
				else{
					infoWindow.close();
					marker[agentId].open = false;
				}
				google.maps.event.addListener(map, 'click', function() {
					infoWindow.close();
					marker[agentId].open = false;
				});
			});
			marker[agentId].addListener('mouseover', function() {
				infoWindow.open(map, this);
				var icon_cam = 'site/upload/3.png';
				var icon = {
					url: icon_cam, // url
					scaledSize: new google.maps.Size(30, 35), // size
				};
				// infoWindow.setIcon(icon)
				infoWindow.setContent(name_page + "<br>" + address);
				agentId = agentId.replace("link", "");
				// Scroll
				$('#collapseExample').animate({
					scrollTop: $("#location-"+agentId).offset().top},
				'slow');
				$(".location-" + agentId).addClass('active').siblings('.active').removeClass('active');
				infoWindow.open(map, marker[agentId]);
			});

			// assuming you also want to hide the infowindow when user mouses-out
			marker[agentId].addListener('mouseout', function() {
				infoWindow.close();
			});

		}

		$('#KeyMap').keyup(function(e) {
			return e.which !== 13
		});
		
		$('#KeyMap').keypress(function(event){
			if(event.which==13) searchAddress();
			
		});

		// $('#Keyword').on('keyup keypress', function(e) {
		// 	var keyCode = e.keyCode || e.which;
		// 	if (keyCode === 13) {
		// 		e.preventDefault();
		// 		console.log(1111111)
		// 		return false;
		// 	}
		// });

		// $("#Keyword").blur(function(){
		// 	$('.dropdown-menu').removeClass('show');
		// });

		$("#KeyMap").keypress(function(){
			var value_text = $("[name=search-agent]").val();
			if(!value_text) {
				$('.dropdown-menu').removeClass('hide');
				$('.dropdown-menu').addClass('show');
			} else {
				$('.dropdown-menu').removeClass('show');
			}
		});


		$("#headsearch").click(function() {
			var value_text = $("[name=search-agent]").val();
			if(!value_text) {
				$('.dropdown-menu').removeClass('hide');
				$('.dropdown-menu').addClass('show');
			} else {
				$('.dropdown-menu').removeClass('show');
			}
		});

		$("#btn_select").click(function() {
			var value_text = $("[name=search-agent]").val();
			if(!value_text) {
				$('.dropdown-menu').removeClass('hide');
				$('.dropdown-menu').addClass('show');
			} else {
				$('.dropdown-menu').removeClass('show');
			}
		});

		function clickvalue(clickElm) {
			var data_value = $(clickElm).attr('data-value');
			$("#KeyMap").val(data_value);
			$('.dropdown-menu').toggleClass('hide');
			return false;
		}

		function initMap() {
			var centerPosition = new google.maps.LatLng(lat, lng);

			var options = {
				zoom: 11,
				center: centerPosition,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};

			map = new google.maps.Map(document.getElementById('map_div'), options);
			searchAddress();

		}


		// markers.addListener("click", () => {
		// 	console.log(123123)
		// 	// infowindow.open(map, marker);
		// });

		function searchAddress(){
			deleteMarkers();

			var icon_xanh = 'site/upload/4.png';
			var icon_cam = 'site/upload/3.png';
			var key = $("#KeyMap").val();
			var location_id = $("#location_id option:selected").val();
			var data = {};
			data.key = key;
			data.location_id = location_id;
			$.post('?mod=home&site=ajax_mapHome', data).done(function(res){
				var data = JSON.parse(res);

				if(data) {
					$('.online-location').remove();
				}

				$.each(data, function (index, location) {
					console.log(location)
					var lat = Number(location.lat);
					var lng = Number(location.lng);
					$('#location-' + location.id).remove();

					// if (markers[location.id] !== undefined) {
					// 	markers[location.id].setMap(null);
					// 	delete markers[location.id];
					// }

					if(lat && lng){
						// $('.online-location').remove();
						var icon = {
							url: icon_xanh, // url
							scaledSize: new google.maps.Size(30, 35), // size
						};

						// Create the initial InfoWindow.
						var infoWindow = new google.maps.InfoWindow();

						marker[location.id] = new google.maps.Marker({
							// draggable: true,
							animation: google.maps.Animation.DROP,
							position: {lat: lat, lng: lng},
							title: location.name_add,
							map: map,
							icon: icon,
							scrollwheel: false,
							streetViewControl: true,
							// label: {
							// 	color: "#0c0909",
							// 	fontWeight: "bold"
							// }
						});

						markers.push(marker[location.id]);

						clickIcon(location.id, location.name_page, location.address , location.email, location.phone, location.image, location.url);

						$('#collapseExample').append('<div class="itemaddress online-location location-' + location.id + '" id="location-' + location.id + '" ' +
								'data-id="' + location.id + '" data-lat="' + location.lat + '" ' +
								'data-lng="' + location.lng + '"' + ' data-text="' + location.name_add + '"' + ' data-address="' + location.address + '"' + ' ' +
								'data-name_page="' + location.name_page + '"' + ' data-phone="' + location.phone + '"' + ' data-image="' + location.image + '"' + ' data-url="' + location.url + '"' + ' data-email="' + location.email + '">' +
								'<div class="row row-sm">' +
								'<div class="col-3 overflow-hidden">' +
								'<img src="'+ location.image + '" class="" height="80">' +
								'</div>' +
								'<div class="col-9">' +
								'<div class="d-flex">' +
								'<div class="flex-grow-1 bd-highlight">' +
								'<h3 class="text-nm-1 text-b">' + location.name_page + '</h3>' +
								'</div>' +
								'</div>' +
								'<p class="mb-1">'  + location.name_add + '</p>' +
								'<p class="mb-0">' + location.address + '</p>' +
								// '<p>Chi tiết cửa hàng</p>' +
								'</div>' +
								'</div>' +
								'</div>');

						$('#style_scroll').append('<div class="px-2 itemaddress online-location location-' + location.id + '" id="location-' + location.id + '" ' +
								'data-id="' + location.id + '" data-lat="' + location.lat + '" ' +
								'data-lng="' + location.lng + '"' + ' data-text="' + location.name_add + '"' + ' data-address="' + location.address + '"' + ' ' +
								'data-name_page="' + location.name_page + '"' + ' data-phone="' + location.phone + '"' + ' data-image="' + location.image + '"' + ' data-url="' + location.url + '"' + ' data-email="' + location.email + '">' +
								'<div class="row row-sm">' +
								'<div class="col-3 overflow-hidden">' +
								'<img src="'+ location.image + '" class="" height="80">' +
								'</div>' +
								'<div class="col-9">' +
								'<div class="d-flex">' +
								'<div class="flex-grow-1 bd-highlight">' +
								'<h3 class="text-nm-1 text-b">' + location.name_page + '</h3>' +
								'</div>' +
								'<a href="#" class="px-2"><i class="fa fa-globe text-success text-big" aria-hidden="true"></i></a>' +
								'</div>' +
								'<p class="mb-1">'  + location.name_add + '</p>' +
								'<p class="mb-0">' + location.address + '</p>' +
								// '<p>Chi tiết cửa hàng</p>' +
								'</div>' +
								'</div>' +
								'</div>');
					} else {
						// console.log(location.id)
						// $('.online-location').remove();
					}
				});
			});
		}

		function toggleBounce() {
			if (marker.getAnimation() !== null) {
				marker.setAnimation(null);
			} else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		}

		
		function newLocation(newLat,newLng) {
			map.setCenter({
				lat : Number(newLat),
				lng : Number(newLng)
			});
		}
		function location_add(selectElm) {
			// var location_id = parseFloat($("#location_id option:selected").val());
			var lat = Number($("#location_id option:selected").attr('data-lat'));
			var lng =  Number($("#location_id option:selected").attr('data-lng'));
			newLocation(lat, lng);
		}
		// Sets the map on all markers in the array.
		function setMapOnAll(map) {
			for (let i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}

		// Removes the markers from the map, but keeps them in the array.
		function clearMarkers() {
			setMapOnAll(null);
		}

		// Shows any markers currently in the array.
		function showMarkers() {
			setMapOnAll(map);
		}

		// Deletes all markers in the array by removing references to them.
		function deleteMarkers() {
			clearMarkers();
			markers = [];
		}
		// window.onload = initMap();
	</script>
{/literal}
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
{*<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCryD5oP1LSHLcOmoGPjSYZw7T4iNMz3o0&callback=initMap&libraries=places"  async defer></script>*}
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&v=beta&key=AIzaSyCryD5oP1LSHLcOmoGPjSYZw7T4iNMz3o0&callback=initMap" async defer></script>