<div id="results">
	<div class="row row-sm">
		<div class="col-sm-2 d-none d-sm-block">
			<div id="menu">
				<h3 class="text-nm-1 text-b pb-2">Sorted by</h3>
				<a href="#" class="sort active">Liên quan</a> <a href="#"
					class="sort" data-field="price" data-direction="asc">Giá bán</a> <a
					href="#" class="sort" data-field="published_on"
					data-direction="desc">Mới nhất</a>

				<div id="facets" class="pt-3">
					<div class="st-custom-facets">
						<h3 class="text-nm-1 text-b pb-2">Prices</h3>
						<input type="checkbox" class="price-filter" name="price"
							data-type="range" data-from="0" data-to="100000" id="under100000">
						<label for="under100000">Dưới 100k</label><br /> <input
							type="checkbox" class="price-filter" class="price"
							data-type="range" data-from="200000" data-to="500000"
							id="under500000"> <label for="under500000">Dưới
							500k</label><br /> <input type="checkbox" class="price-filter"
							class="price" data-type="range" data-from="500000"
							data-to="1000000" id="under1000000"> <label
							for="under1000000">Dưới 1000k</label><br /> <input
							type="checkbox" class="price-filter" class="price"
							data-type="range" data-from="1000000" data-to="*"
							id="over1000000"> <label for="over1000000">Trên
							1000k</label>
					</div>
					<div class="st-dynamic-facets"></div>
				</div>
			</div>
			<!-- end menu -->
		</div>
		<div class="col-md-10">
			<div class="row row-sm" id="st-results-container"></div>
			<!-- end st-results-container -->
		</div>
	</div>
</div>
{literal}
<script type='text/javascript'>
	 var searchConfig = {
        facets: {},
        sort: {
          field: undefined,
          direction: undefined
        },
        price: {
          from: undefined,
          to: undefined
        }
      };
      var resultTemplate = Hogan.compile([
          "<div class='col-sm-3 col-6'>",
	            "<div class='frame-prod-card'>",
		            "<div class='card mb-2 mt-0 m-border-0'>",
			            "<div class='card-body p-sm-2 p-1'>",
				            "<div class='image-product'>",
					            "<div class='prod-img'>",
					           	 "<a href='{{url}}'><img class='card-img-top p-1' src='{{image}}' alt='{{title}}'></a>",
					            "</div>",
				           	"</div>",
				           	"<div class='infor-prod'>",
				           		"<h3 class='card-title mb-sm-1 mb-0'><a href='{{url}}' class='text-twoline text-nm-1 text-msm red' title=''>{{title}}</a></h3>",
				           		"<p class='mb-1'>Category: {{category}}</p><p class='price my-sm-1 mt-0 mb-sm-1 mb-0 text-nm-1 text-msm text-oneline'><span class='d-sm-inline-block d-none'>Giá :</span> <b class='col-red'>{{price}}</b> VND</p>",
				           	"<div>",
				           	"<div class='send-inquiry p-3 d-sm-block d-none'>",
				           		"<a href='' class='btn btn-block btn-call text-nm'><i class='fa fa-phone fa-fw'></i>Xem số điện thoại</a>",
				           		"<a href='' class='btn btn-primary btn-block btn-contact text-sm'>Liên hệ nhà bán<span class='d-block text-sm'>Yêu cầu báo giá</span></a>",
				           	"</div>",
			          	"</div>",
			         "</div>",
		        "</div>",
	       "</div>",
        ].join('') );
      var customRenderFunction = function(document_type, item) {
       	  var date = new Date(item['published_on']),
          data = {
            title: item['title'],
            quantity: item['quantity'],
            price: item['price'],
            image: item['image'],
            url: item['url'],
            category: item['category'],
            brand: item['brand'],
            location: item['location'],
            published_on: [date.getMonth(), date.getDate(), date.getFullYear()].join('/')
          };
        return resultTemplate.render(data);
      };

      var $facetContainer = $('.st-dynamic-facets');

      var reloadResults = function() {
        window.location.hash = window.location.hash.replace(/stp=[^&]*/i, 'stp=1'); // Reset to page 1
        $(window).hashchange();
      };

      var bindControls = function(data) {
        var
          resultInfo = data['info'],
          facets = '';
        $.each(resultInfo, function(documentType, typeInfo){
          $.each(typeInfo.facets, function(field, facetCounts) {
            facets += ['<div class="facet"><h3>', field, '</h3></div>'].join('');
            facets += '<div class="facet_option_list">';
            $.each(facetCounts, function(label, count) {
              var
                status = "",
                id = encodeURIComponent(label).toLowerCase();
              if (window.searchConfig.facets[field] && window.searchConfig.facets[field].indexOf(label) > -1) {
                status = 'checked="checked"'
              }

              facets += '<input type="checkbox"' + status + ' name="' + field + '" value="' + label + '" id="' + id + '"> <label for="' + id + '">' + label + ' (' + count + ')</label><br/>';
            });
            facets += '</div>';
            facets += '<a href="#" class="clear-selection" data-name="' + field + '">Clear all</a>'
          });
          $facetContainer.html(facets);
        });
      };

      var readSortField = function() {
        return { page: window.searchConfig.sort.field };
      };

      var readSortDirection = function() {
        return { page: window.searchConfig.sort.direction };
      };

      $('.sort').on('click', function(e){
        e.preventDefault();
        // Visually change the selected sorting order
        $('.sort').removeClass('active');
        $(this).addClass('active');
        // Update sorting settings
        window.searchConfig.sort.field = $(this).data('field');
        window.searchConfig.sort.direction = $(this).data('direction');

        reloadResults();
      });

      $facetContainer.on('click', 'input', function(e) {
        window.searchConfig.facets = {}; // Set the hash to empty
        $('.st-dynamic-facets input[type="checkbox"]').each(function(idx, obj) {
          var
            $checkbox = $(obj),
            facet = $checkbox.prop('name');
          if(!window.searchConfig.facets[facet]) {
            window.searchConfig.facets[facet] = [];
          }
          if($checkbox.prop('checked')) {
            window.searchConfig.facets[facet].push($checkbox.prop('value'));
          }
        })

        reloadResults();
      });

      $facetContainer.on('click', 'a.clear-selection', function(e) {
        e.preventDefault();
        var name = $(this).data('name');
        $('input[name=' + name + ']').prop('checked', false);
        window.searchConfig.facets[name] = [];

        reloadResults();
      });

      $('.price-filter').on('click', function(e){
        if ($(this).prop('checked')) {
          // Visually update the checkboxes
          $('.price-filter').prop('checked', false);
          $(this).prop('checked', true);
          // Update the search parameters
          window.searchConfig.price.from = $(this).data('from');
          window.searchConfig.price.to = $(this).data('to');
        } else {
          window.searchConfig.price.from = undefined;
          window.searchConfig.price.to = undefined;
        }
        reloadResults();
      })

      var readFilters = function() {
        return {
        	page: {
            category: window.searchConfig.facets['category'],
            brand:window.searchConfig.facets['brand'],
            price: {
              type: 'range',
              from: window.searchConfig.price.from,
              to: window.searchConfig.price.to
            }
          }
        }
      }
      
      $('#st-search-input').swiftypeSearch({
        resultContainingElement: '#st-results-container',
        engineKey: '-2v9p3LpgXqx9ysmjoqi',
        renderFunction: customRenderFunction,
        sortField: readSortField,
        sortDirection: readSortDirection,
        facets: { page: ['brand','category'] },
        filters: readFilters,
        postRenderFunction: bindControls,
        perPage: 20,
      });
      // Start the demo out with products loaded on the page
      $(window).on('load', function() {
        var hasSearchTerm = window.location.hash.indexOf('stq=') >= 0;
        if (!hasSearchTerm) {
          window.location.hash = 'stq=product&stp=1';
          reloadResults();
        }
      });
    </script>
{/literal}











