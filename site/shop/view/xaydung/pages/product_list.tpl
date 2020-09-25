<section class="mb-4">
        <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
</section>
<section id="S-8" class="S-4 S-2 pb-4">
            <div class="container text-center">
                <div class="action my-2">
                    {foreach from=$a_main_product_category key=k item=data}
                  <button class="btn btn-default border bg-transparent btn-sm mb-2">{$data.name}</button>
                  {/foreach}
               
                  </div>
                <div class="row">
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-4 mb-4 col-md-6">
                        <div class="item border pb-3">
                            <div class="border-bottom mb-2">
                                <a class="d-block pos-rel py-2" href="{$data.url}" alt="{$data.name}">
                                    <img src="{$data.avatar}" class="w-100" height="350">
                                    <span class="mask"></span>
                                </a>
                            </div>
                            <small class="text-warning">Ngày: 15,01,2018</small>
                            <div class="name ">
                                <a href="{$data.url}" alt="{$data.name}" class="font-weight-bold">{$data.name}</a>
                            </div>
                            <p class="fz-12 mt-3 px-3">Giá từ {$data.price|number_format}₫</p>
                            <a href="{$data.url}" class="btn btn-outline-warning rounded-0">Xem thêm >></a>
                        </div>
                    </div>
                    {/foreach}

                </div>
                <div class="col-lg-12 mt-4">
                    <div class="d-inline-block text-right">{$paging}</div>
                  </div>
            </div>
        </section>
        <section id="S-3" class="py-5 text-center">
            <div class="container">
                <div class="title text-warning font-weight-bold text-uppercase">Liên hệ ngay với chúng tôi để được hỗ trợ</div>
                <div class="des font-weight-bold text-uppercase text-white py-3">Tư vấn miễn phí</div>
                <button class="btn rounded-0 bg-transparent text-uppercase btn-outline-warning text-white">Gửi yêu cầu đến nhà xinh</button>
            </div>
        </section>
        <section id="S-7" class="S-4 S-2 pb-4">
            <div class="container text-center">
                <h2 class="title text-uppercase font-weight-bold">Danh sách sản phẩm</h2>
                <div class="owl-carousel owl-theme">
                    {foreach from=$result key=k item=data}
                    <div class="item pb-3">
                        <div>
                            <a class="d-block pos-rel" href="{$data.url}" alt="{$data.name}">
                                <img src="{$data.avatar}" class="w-100" height="268">
                                <span class="mask"></span>
                            </a>
                        </div>
                        <small class="text-warning py-4">Ngày: 15,01,2018</small>
                        <div class="name ">
                            <a href="{$data.url}" alt="{$data.name}" class="font-weight-bold">{$data.name}</a>
                        </div>
                        <p class="fz-12 mt-3 px-3">Giá từ {$data.price|number_format}đ</p>
                        <button class="btn btn-outline-warning rounded-0">Xem thêm >></button>
                    </div>
                    {/foreach}
                   
                </div>
                <script type="text/javascript">
                         $('.owl-carousel').owlCarousel({
                        loop:true,
                        margin:10,
                        nav:true,
                        navText:["<i class='fa fa-caret-left'></i>","<i class='fa fa-caret-right'></i>"],
                        navClass:['owl-prev','owl-next'],
                        dots:false,
                        responsive:{
                            0:{
                                items:1
                            },
                            600:{
                                items:2
                            },
                            1000:{
                                items:4
                            }
                        }
                    });
                    </script>
            </div>
        </section>
       