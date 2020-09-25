{literal}
	<style>
		/* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
		#map_div {
			height: 100%;
		}
		/* Optional: Makes the sample page fill the window. */
		html, body {
			height: 100%;
			margin: 0;
			padding: 0;
		}
		#floating-panel {
			position: absolute;
			top: 10px;
			left: 25%;
			z-index: 5;
			background-color: #fff;
			padding: 5px;
			border: 1px solid #999;
			text-align: center;
			font-family: 'Roboto','sans-serif';
			line-height: 30px;
			padding-left: 10px;
		}
		#floating-panel {
			background-color: #fff;
			border: 1px solid #999;
			left: 25%;
			padding: 5px;
			position: absolute;
			top: 10px;
			z-index: 5;
		}
		.table-no-border td { border: none !important;}
		.list-online-agents ul { list-style: none; margin: 0; padding: 0; border-top: 1px solid #ddd; height: 90vh; overflow-x: scroll;}
		.list-online-agents ul li {padding: 5px;border: 1px solid #dddd;border-top: none;}
		.list-online-agents ul li:hover { cursor: pointer;
		}

		.form-control {
			display: block;
			width: 100%;
			height: 34px;
			padding: 6px 12px;
			font-size: 14px;
			line-height: 1.42857143;
			color: #555;
			background-color: #fff;
			background-image: none;
			border: 1px solid #ccc;
			border-radius: 4px;
			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
			-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
			-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
			transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		}

	</style>
{/literal}
<div class="container" style="margin-top: 30px">
	<div class="row">
{*		<div class="col-sm-12">*}
{*			<input class="form-control" name="search-agent" id="search-agent" value="" placeholder="Tìm kiếm tên gian hàng" type="text" style="border-radius: 20px;margin-right: 5px;"/>*}
{*		</div>*}
		<div class="col-sm-6">
			<input class="form-control" name="search-agent" id="search-agent" value="" placeholder="Tìm kiếm gian hàng..." type="text" style="border-radius: 20px;margin-right: 5px;"/>
		</div>
		<div class="col-sm-2">
			<select class="d-none d-sm-none d-md-inline-block form-control" id="location_id" name="location_id"> {$s_location}</select>
		</div>
		<div class="col-sm-2">
			<a class="btn btn-success" href="javascript:void(0)" style="border-radius: 20px;" onclick="searchAddress()">Tìm kiếm</a>
			<a class="btn btn-info" href="" style="border-radius: 20px;">Clear</a>
		</div>
		<div class="col-sm-3">
			<table class="table table-responsive table-no-border">
				<tr>
					<td class="list-online-agents">
						<ul>
							{foreach from=$address key=k item=data}
								<li id="location-{$data.id}" class="online-location" data-id="{$data.id}" data-lat="{$data.lat}"
									data-lng="{$data.lng}" data-text="#{$data.name}">
									<span class="text-aqua">
										<i class="fa fa-circle"></i>
									</span>
									<strong>{$data.name_page}</strong><br>
									<strong style="color:blue">{$data.name_add}</strong><br>
									<span class="address">{$data.address}</span>
								</li>
							{/foreach}
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-9">
			<div class="form-group" style="margin-top:20px">
				<label class="control-label"><strong>Địa chỉ các gian hàng</strong></label><br>
				<div class="col-sm-10 row">
					<input class="form-control" type="text" id="user_check_address" name="user_check_address" value="" maxlength="255" placeholder="Số nhà, đường phố, quận huyện, tỉnh thành">
				</div>
			</div>
			<div id="map_div" style="height: 800px; width: 100%"></div>
		</div>
	</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{$arg.stylesheet}plugins/jquery-autocomplete/jquery.autocomplete.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCryD5oP1LSHLcOmoGPjSYZw7T4iNMz3o0&libraries=places&callback=initMap" async defer></script>
{literal}
	<script>
		var geocoder;
		var center, lat_search, lng_search;
		var map;
		var lat = 20.9937774;
		var lng = 105.8114176;
		var radius = 1500000;
		var agents = [];
		var markers = {};
		var locations = [];
		var marker;
		var txt = $('#search-agent').val().trim();
		var agentOnlineListWrapper = $('.list-online-agents ul');

		$(document).ready(function () {
			jQuery.expr[':'].contains = function(a, i, m) {
				return jQuery(a).text().toUpperCase()
						.indexOf(m[3].toUpperCase()) >= 0;
			};

			$('#search-agent').submit(function() {
				var value = $(this).val().toLowerCase();
				$("tr td.list-online-agents ul li").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		});
		// function searchAddress() {
		// 	var value = $('#search-agent').val().toLowerCase();
		// 	console.log($('.search-agent').text());
		// 	$("tr td.list-online-agents ul li").filter(function() {
		// 		$('#search-agent').toggle($('.search-agent').text().toLowerCase().indexOf(value) > -1)
		// 	});
		// }


		function initMap() {
			geocoder = new google.maps.Geocoder();
			map = new google.maps.Map(document.getElementById('map_div'), {
				zoom: 10,
				center: {lat: 20.9990, lng: 105.8054},
				mapTypeId: 'roadmap'
			});
			map.addListener('click', function(e) {
				marker = new google.maps.Marker({
					map: map,
					draggable: true,
					animation: google.maps.Animation.DROP,
					position: e.latLng
				});
				marker.addListener('click', toggleBounce);
			});

			searchBox();

			var autocomplete = new google.maps.places.Autocomplete($('[name=user_check_address]').get(0));
			var autocompleteaddress = new google.maps.places.Autocomplete($('[name=address]').get(0));
			var marker = new google.maps.Marker({
				map: map,
				anchorPoint: new google.maps.Point(0, -29)
			});

			autocompleteaddress.addListener('place_changed', function() {
				marker.setVisible(false);
				var place = autocompleteaddress.getPlace();
				if (!place.geometry) {
					// User entered the name of a Place that was not suggested and
					// pressed the Enter key, or the Place Details request failed.
					console.log("No details available for input: '" + place.name + "'");
					return;
				}

				// If the place has a geometry, then present it on a map.
				if (place.geometry.viewport) {
					map.fitBounds(place.geometry.viewport);
				} else {
					map.setCenter(place.geometry.location);
					map.setZoom(17);  // Why 17? Because it looks good.
				}
				marker.setPosition(place.geometry.location);
				marker.setVisible(true);
				// Update lat-lng values
				$('[name=lat_from]').val(place.geometry.location.lat);
				$('[name=lng_from]').val(place.geometry.location.lng);
				$('#center_point_lat').val(place.geometry.location.lat);
				$('#center_point_lng').val(place.geometry.location.lng);
			});
			autocomplete.addListener('place_changed', function() {
				marker.setVisible(false);
				var place = autocomplete.getPlace();
				if (!place.geometry) {
					// User entered the name of a Place that was not suggested and
					// pressed the Enter key, or the Place Details request failed.
					console.log("No details available for input: '" + place.name + "'");
					return;
				}

				// If the place has a geometry, then present it on a map.
				if (place.geometry.viewport) {
					map.fitBounds(place.geometry.viewport);
				} else {
					map.setCenter(place.geometry.location);
					map.setZoom(17);  // Why 17? Because it looks good.
				}
				marker.setPosition(place.geometry.location);
				marker.setVisible(true);

				marker = new google.maps.Marker({
					map: map,
					draggable: false,
					animation: google.maps.Animation.DROP,
					position: {lat: 20.9994, lng: 105.7823},
					title: text,
					label: {
						text: text,
						color: "#0c0909",
						fontWeight: "bold"
					}
				});

			});

			$('body').on('click', '.online-location', function () {
				var agentId = $(this).data("id");
				var lat = Number($(this).data("lat"));
				var lng = Number($(this).data("lng"));
				var text = $(this).data("text");

				markers[agentId] = new google.maps.Marker({
					position: {lat: lat, lng: lng},
					map: map,
					animation: google.maps.Animation.DROP,
					draggable: true,
					title: text,
					label: {
						text: text,
						color: "#0c0909",
						fontWeight: "bold"
					}
				});
				map.setCenter(new google.maps.LatLng(lat, lng));
				map.setZoom(15);
				map.addListener('click', toggleBounce);
			});
			searchAddress();
		}
		function searchAddress(){
			var key = $("#search-agent").val();
			var location_id = $("#location_id option:selected").val();
			var data = {}
			data.key = key;
			data.location_id = location_id;
			$.post('?mod=home&site=ajax_mapHome', data).done(function(res){
				var data = JSON.parse(res);
				if(data) {
					$('.online-location').remove();
				}
				// console.log(data);
				$.each(data, function (index, location) {
					var lat = Number(location.lat);
					var lng = Number(location.lng);
					$('#location-' + location.id).remove();
					if(lat && lng){
					// 	$('.online-location').remove();
						marker = new google.maps.Marker({
							map: map,
							draggable: true,
							animation: google.maps.Animation.DROP,
							position: {lat: lat, lng: lng},
							title: location.name_add,
							// label: {
							// 	color: "#0c0909",
							// 	fontWeight: "bold"
							// }
						});
						$('.list-online-agents ul').append('<li id="location-' + location.id + '" class="online-location" data-id="' + location.id + '" data-lat="' + location.lat + '" ' +
								'data-lng="' + location.lng + '"' +
								'data-text="' + location.id + '"' +
								'<span class="text-aqua"><i class="fa fa-circle"></i></span>' +
								'<strong style="color:blue">' + location.name_add + '</strong><br>' +
								'<strong>' + location.name_page + '</strong><br>' +
								'<span class="address">' + location.address + '</span></li>');
					} else {
						$('.online-location').remove();
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
		function searchBox() {
			var searchBox = new google.maps.places.Autocomplete(document.getElementById('pac-input'));
			searchBox.addListener('place_changed', function() {
				var place = searchBox.getPlace();
				// For each place, get the icon, name and location.
				if (place.geometry.viewport) {
					map.fitBounds(place.geometry.viewport);
				} else {
					map.setCenter(place.geometry.location);
					map.setZoom(18);
				}
			});
		}
		function LoadFrm(id){
			$("#FrmContent input").val('');
			$("#FrmContent input[name=id]").val(id);
			var Data = {};
			Data['id'] = id;
			Data['ajax_action'] = 'load_frm';
			loading();
			$.post('?mod=profile&site=address', Data).done(function(e){
				var data = JSON.parse(e);
				$("#FrmContent input[name=name]").focus();
				$("#FrmContent input[name=name]").val(data.name);
				$("#FrmContent select[name=province_id]").val(data.province_id);
				$("#FrmContent input[name=address]").val(data.address);
				$("#FrmContent input[name=phone]").val(data.phone);
				$("#FrmContent input[name=email]").val(data.email);
				endloading();
			});
		}
	</script>
{/literal}