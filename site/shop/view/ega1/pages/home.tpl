{if $a_home_sliders_show}
<div class="p-3">
        <div id="carouselExampleIndicators" class="carousel slide"
            data-ride="carousel">
            <ol class="carousel-indicators">
                {foreach from=$a_home_sliders_show key=k item=img}
                <li data-target="#carouselExampleIndicators" data-slide-to="{$k}" {if $k eq 0}class="active"{/if}></li>
                {/foreach}
            </ol>
            <div class="carousel-inner">
                {foreach from=$a_home_sliders_show key=k item=img}
                <div class="carousel-item {if $k eq 0}active{/if}">
                    <img class="d-block w-100" src="{$img}">
                </div>
                {/foreach}
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators"
                data-slide="prev"> <span class="carousel-control-prev-icon"></span>
            <span class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                data-slide="next"> <span class="carousel-control-next-icon"></span>
            <span class="sr-only">Next</span>
            </a>
        </div>
</div>
{/if}
{if $a_home_supporters}
  <section id="S-2" class="S-2 ">
         <div class="container-fluid bdb-1">
            <div class="row py-4">
                {foreach from=$a_home_supporters item=data}
               <div class="col-12 col-sm-3 py-2 py-lg-0">
                  <div class="wapper mb-2d-block text-center justify-content-center">
                     <div class="icon mb-3">
                        <img src="{$data.avatar}" class="w-100 rounded-circle" alt="ega women shoes">
                     </div>
                     <div class="info pl-2">
                        <h4 class="m-0">{$data.name}</h4>
                        <p class="m-0">HOTLINE: {$data.phone}</p>
                     </div>
                  </div>
               </div>
               {/foreach}
            </div>
         </div>
      </section>
{/if}  
{if $a_home_product_new}
<section id="S-3" class="my-4 S-4">
         <div class="container">
            <div class="row">
                <div class="title mb-1 text-center w-100">
                  <h2 class="w-100">
                     <a href="" class="d-inline-block">Sản phẩm bán chạy</a>
                  </h2>
               </div>
                {foreach from=$a_home_product_new key=k item=data}
               <div class="col-lg-4 col-12 mt-3 mt-lg-0 mb-3">
                  <div class="wrapper">
                     <a href="{$data.url}">
                        <span class="img d-block">
                            <img src="{$data.avatar}" class="w-100" height="200">
                        </span>
                        <span class="name">
                           <h2>{$data.name}</h2>
                        </span>
                     </a>
                  </div>
               </div>
               {/foreach}
            </div>
         </div>
      </section>
{/if}
     
<section id="S-3" class="S-1 py-4 bg-light mt-4">
   
    <div class="container">
         <h3 class="sec-tit text-center ">
                <span class="bg-light">Giới thiệu</span>
            </h3>
        <div class="py-4 text-left" id="cominfo">
            <div class="row bg-light py-3">
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-map-marker"></i></span>
                        <span class="title-1">Địa chỉ</span>
                        <span class="value">{$page.address|default:''}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-history"></i></span>
                        <span class="title-1">Bắt đầu hoạt động</span>
                        <span class="value">{$page.date_start|date_format:'%Y'}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-address-card-o"></i></span>
                        <span class="title-1">Thể loại doanh nghiệp</span>
                        <span class="value">Công ty thương mại</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-cubes"></i></span>
                        <span class="title-1">Sản phẩm chính</span>
                        <span class="value">{$page.mainproducts}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-users"></i></span>
                        <span class="title-1">Số lượng nhân viên</span>
                        <span class="value">{$page.number_mem_show}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 pb-2">
                    <div class="item">
                        <span class="icon pr-2"><i class="fa fa-fw fa-bolt"></i></span>
                        <span class="title-1">Doanh thu hàng năm</span>
                        <span class="value">{$page.revenue}</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-nm">
            {foreach from=$page.a_image item=data}
            <div class="col-md-3">
                <div class="img-zoom"><img alt="" src="{$data}" class="w-100 img-thumbnail rounded-0"></div>
            </div>
            {/foreach}
        </div>
        <div class="text-center my-4">
            <a href="{$a_main_menu.contact}" class="btn btn-danger mr-3"><i class="fa fa-fw fa-envelope-o"></i> Liên hệ với nhà cung cấp</a>
            <button class="btn btn-outline-warning mr-3">Bắt đầu đặt hàng</button>
            <a href="{$a_main_menu.company_information}" class="text-info">Tìm hiểu thêm về chúng tôi ></a>
        </div>
    </div>
    </div>
</section>

{if $a_home_product_main}
<section id="S-4" class="S-4 mt-5 S-4-1">
         <div class="container">
            <div class="row">
               <div class="title mb-1 text-center w-100">
                  <h2>
                     <a href="" class="d-inline-block text-uppercase">Danh sách sản phẩm</a>
                  </h2>
               </div>
               {foreach from=$a_home_product_main key=k item=data}
               <div class="col-lg-3 col-6 my-2 my-lg-0 pt-3">
                  <div class="card">
                     <a href="{$data.avatar}">
                        <img src="{$data.avatar}" class="w-100" height="150">
                     </a>
                     <div class="action">
                        <div class="wrapper">
                           <a href="" data-toggle="tooltip" title="" class="" data-original-title="Lựa chọn"><i class="fa fa-shopping-cart"></i></a>
                           <a href="{$data.url}" data-toggle="tooltip" data-url="" data-target="#quicklook-modal" data-modalcontent="quicklook-content" title="" class="ega-quicklook-btn" product_url="/giay-cao-got-valentino-07" data-original-title="Xem nhanh"><i class="fa fa-eye"></i></a>
                        </div>
                     </div>
                     <div class="info mt-3 text-center">
                        <h3>
                           <a href="{$data.url}">{$data.name}</a>
                        </h3>
                        <div class="price">
                           Giá từ {$data.price|number_format}đ
                        </div>
                     </div>
                  </div>
               </div>
               {/foreach}
            </div>
         </div>
      </section>
{/if}
<section class="mt-5">
        <div class="row">
            <div class="col-lg-12">
                <a href="" class="img-1 d-block">
                    <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                </a>
            </div>
    </div>
</section> 
{if $a_home_partners}
<seciton id="S-5" class="S-4">
         <div class="container  mt-5">
            <div class="row">
               <div class="title mb-1 text-center w-100">
                  <h2>
                     <a href="" class="d-inline-block text-uppercase">Đối tác</a>
                  </h2>
               </div>
               <div class="owl-carousel owl-theme">
                {foreach from=$a_home_partners item=data}
                  <div class="item">
                 <a href="{}">
                     <img src="{$data.logo_custom}" class="w-100">
                     </a>
                  </div>
                  {/foreach}
               </div>
               <script type="text/javascript">
                  $('.owl-carousel').owlCarousel({
                      loop:true,
                      margin:10,
                      nav:false,
                      dots:false,
                      responsive:{
                          0:{
                              items:3
                          },
                          600:{
                              items:3
                          },
                          1000:{
                              items:5
                          }
                      }
                  })
               </script>
            </div>
         </div>
      </seciton>
{/if}