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
{if $a_home_product_new}
<section id="S-1 " class="mt-5 S-1">
        <div class="container">
            <h3 class="sec-tit text-center py-4">
                <span>Sản phẩm bán chạy</span>
            </h3>
            <div class="sec-content">
                <div class="row">
                    {foreach from=$a_home_product_new key=k item=data}
                    <div class="col-lg-3 col-6 mt-3">
                        <div class="card w-100">
                           <a href="{$data.url}">
                                <img class="card-img-top w-100 zoom-in" height="200" src="{$data.avatar}" alt="{$data.name}">
                           </a>
                            <div class="card-body text-center">
                                <h3 class="card-title">{$data.name}</h3>
                                <a href="{$data.url}" class="btn cl-red">Giá từ {$data.price|number_format}₫</a>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </section>
{/if}
{if $a_home_supporters}
<section id="S-11" class="mt-5 S-1">
        <div class="mask"></div>
        <div class="container">
            <h3 class="tit text-white text-center py-4">
                <span>Nhân viên hỗ trợ</span>
            </h3>
            <div class="sec-content">
                <div class="row">
                    {foreach from=$a_home_supporters item=data}
                    <div class="col-lg-3 col-12 mb-3">
                        <div class="card w-100">
                            <img class="card-img-top w-100 zoom-in" src="{$data.avatar}" height="255" alt="{$data.name}">
                            <div class="card-body text-center">
                                <h3 class="card-title">{$data.name}</h3>
                                <p class="card-text">
                                    Hotline : {$data.phone}
                                </p>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </section>
{/if}       


{if $a_home_product_main}
<section  class="mt-5 S-1">
        <div class="container">
            <h3 class="sec-tit text-center py-4">
                <span>Danh sách sản phẩm</span>
            </h3>
            <div class="sec-content">
                <div class="row">
                    {foreach from=$a_home_product_main key=k item=data}
                    <div class="col-lg-3 col-6 mt-3">
                        <div class="card w-100">
                           <a href="{$data.url}">
                                <img class="card-img-top w-100 zoom-in" height="200" src="{$data.avatar}" alt="{$data.name}">
                           </a>
                            <div class="card-body text-center">
                                <h3 class="card-title">{$data.name}</h3>
                                <a href="{$data.url}" class="btn cl-red">Xem chi tiet</a>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <div class="col-12 text-center">
                        <a href="{$a_main_menu.product_list}" class="btn btn-success text-white mt-3">Xem tất cả</a>
                    </div>
                </div>
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
{if $a_home_partners}
<section id="S-3" class="S-1">
        <div class="container">
            <div class="row py-5">
                <div class="col-lg-12">
                     <h3 class="sec-tit text-center py-4">
                <span>Đối tác quan trọng</span>
            </h3>
                </div>
                {foreach from=$a_home_partners item=data}
                <div class="col-lg-3 col-6 mt-3">
                    <div class="icon">
                        <img src="{$data.logo_custom}" class="w-100" alt="{$data.name}">
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
{/if}