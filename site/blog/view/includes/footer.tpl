<footer class="footer" id="ft">
	<div class="back-to-top mt-3 rounded-circle" id="backtop_default">
		<button type="button"
			class="btn w-100 rounded-circle"
			data-original-title="" title="">
			<span class="text-center text-lg text-mnm"><i
				class="fa fa-arrow-up"></i></span>
		</button>
	</div>
	<div class="container">
		<div class="footer_logo py-3">
			<a href=""><img src="{$arg.logo.image}" height="24px"></a>
		</div>
		<div class="row">
			{foreach from=$a_main_category key=k item=data} {if $k le 5}
			<div class="col-sm-2 col-6">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link px-0 active"
						href="{$data.url}">{$data.name}</a></li> {foreach from=$data.sub key=h
					item=sub}
					{if $h le 3}
					<li class="nav-item"><a class="nav-link px-0"
						href="{$sub.url}">{$sub.name}</a></li>{/if} {/foreach}
				</ul>
			</div>
			{/if} {/foreach}
		</div>
		<div
			class="border-top d-flex justify-content-center align-items-center py-2 mt-2 footer_bottom">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link text-muted" href="./">©
						Daisanplus 2020</a></li> {foreach from=$a_menu_foot item=data}
				<li class="nav-item"><a class="nav-link text-muted"
					href="{$data.url}">{$data.name}</a></li> {/foreach}
			</ul>
		</div>
	</div>
</footer>