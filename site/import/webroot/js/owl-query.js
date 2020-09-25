$(function() {
			$('[data-toggle="tooltip"]').tooltip();
		$('.owl-mslider').owlCarousel({
			loop : true,
			autoplay : true,
			margin : 10,
			nav : false,
			dots : true,
			items : 1,
			stagePadding : 40,
		});
		$('.owl-ranking').owlCarousel({
			loop : true,
			margin : 10,
			nav : false,
			dots : false,
			autoplay : true,
			autoplayTimeout : 2000,
			responsive:{
			        0:{
			            items:3,
			        },
			        600:{
			            items:5,
			        },
			        1000:{
			            items:8,
			        }
			    }
		});
		$('.owl_ads').owlCarousel({
			loop : false,
			margin : 0,
			nav : true,
			dots : false,
			items : 8,
			onInitialized : counter_ads, // When the plugin has initialized.
			onTranslated : counter_ads
		// When the translation of the stage has finished.
		});
		function counter_ads(event) {
			var element = event.target; // DOM element, in this example
										// .owl-carousel
			var items = event.item.count; // Number of items
			var item = event.item.index + 1; // Position of the current item
			// it loop is true then reset counter from 1
			if (item > items) {
				item = item - items
			}
			$('.counter_ads').html(+item + "/" + items)
		}
});