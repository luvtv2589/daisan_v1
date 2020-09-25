<div id="introduce">
	<div id="particles-js"
		style="height: 450px; position: relative; z-index: 99;">
		<div class="particles w-100 h-100"
			style="z-index: -1; position: absolute">
			<div class="row m-0 justify-content-center"
				style="position: absolute; top: 20%; left: 0; right: 0">
				<div class="col-sm-7">
					<h1
						class="text-shadow mb-3 text-warning text-mbiggest text-uppercase text-center">Giới
						thiệu về Daisan.vn</h1>
					<h3
						class="text-shadow mt-5 text-info text-mbiggest text-uppercase text-center">Chuyên
						biệt để khác biệt</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="border-top border-bottom" id="introduce">
		<!-- <div class="part1 bg-light py-5">
			<div class="container ">
				<div class="row">
					<div class="col-sm-6">
						<h3 class="mb-3">Thành lập</h3>
						Launched in 1999, Alibaba.com is the leading platform for global
						wholesale trade. We serve millions of buyers and suppliers around
						the world. Launched in 1999, Alibaba.com is the leading platform
						for global wholesale trade. We serve millions of buyers and
						suppliers around the world. Launched in 1999, Alibaba.com is the
						leading platform for global wholesale trade. We serve millions of
						buyers and suppliers around the world. Launched in 1999,
						Alibaba.com is the leading platform for global wholesale trade. We
						serve millions of buyers and suppliers around the world. Launched
						in 1999, Alibaba.com is the leading platform for global wholesale
						trade. We serve millions of buyers and suppliers around the world.
						Launched in 1999, Alibaba.com is the leading platform for global
						wholesale trade. We serve millions of buyers and suppliers around
						the world.
					</div>
					<div class="col-sm-6 d-sm-block d-none">
						<div class="imgpart1 mx-auto"></div>
					</div>
				</div>
			</div>
		</div> -->
		{foreach from=$a_post_about.posts key=k item=data} {if $k mod 2 eq 0}
		<div class="part2 py-5">
			<div class="container ">
				<div class="row">
					<div class="col-sm-6 d-sm-block d-none">
						<div class="imgpart2 mx-auto">
							<img src="{$data.avatar}" class="img-fluid">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card-body">
							<h3>{$data.title}</h3>
							<p class="d-none d-lg-block">{$data.content}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		{else if $k mod 2 eq 1}
		<div class="part2 py-5 bg-light">
			<div class="container ">
				<div class="row">
					<div class="col-sm-6">
						<div class="card-body">
							<h3>{$data.title}</h3>
							<p class="d-none d-lg-block">{$data.content}</p>
						</div>
					</div>
					<div class="col-sm-6 d-sm-block d-none">
						<div class="imgpart2 mx-auto">
							<img src="{$data.avatar}" class="img-fluid">
						</div>
					</div>
				</div>
			</div>
		</div>
		{/if} {/foreach}
	</div>
</div>
<script type="text/javascript" src="site/themes/webroot/js/particles.js"></script>
<script type="text/javascript" src="site/themes/webroot/js/app.js"></script>
<script type="text/javascript">
	particlesJS('particles-js', {
		"particles" : {
			"number" : {
				"value" : 130,
				"density" : {
					"enable" : true,
					"value_area" : 800
				}
			},
			"color" : {
				"value" : "#fff"
			},
			"shape" : {
				"type" : "circle",
				"stroke" : {
					"width" : 0,
					"color" : "#fff"
				},
				"polygon" : {
					"nb_sides" : 5
				},
				"image" : {
					"src" : "img/github.svg",
					"width" : 100,
					"height" : 100
				}
			},
			"size" : {
				"value" : 5,
				"random" : true,
				"anim" : {
					"enable" : false,
					"speed" : 40,
					"size_min" : 0.1,
					"sync" : false
				}
			},
			"line_linked" : {
				"enable" : true,
				"distance" : 150,
				"color" : "#fff",
				"opacity" : 0.4,
				"width" : 1
			},
			"move" : {
				"speed" : 3
			}
		},
		"interactivity" : {
			"events" : {
				"onhover" : {
					"enable" : true,
					"mode" : "repulse"
				},
				"onclick" : {
					"enable" : false,
					"mode" : "push"
				},
			},
		},
	});
</script>