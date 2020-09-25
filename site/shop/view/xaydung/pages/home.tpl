{if $a_home_sliders_show}
<div>
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
<section id="S-1">
    <div class="container py-4">
        <div class="owl-carousel owl-theme">
            <div class="item text-center">
                <div class="d-inline-block rounded-circle bg-warning align-self-center">
                    <img class="d-inline-block" src="{$arg.stylesheet}images/ic-2.png" width="30" height="30">
                </div>
                <div class="text-uppercase font-weight-bold mt-1 fz-22">Bảo trì trọn đời</div>
            </div>
            <div class="item text-center">
                <div class="d-inline-block rounded-circle bg-warning align-self-center">
                    <img class="d-inline-block" src="{$arg.stylesheet}images/ic-3.png" width="30" height="30">
                </div>
                <div class="text-uppercase font-weight-bold mt-1 fz-22">Bảo trì trọn đời</div>
            </div>
            <div class="item text-center">
                <div class="d-inline-block rounded-circle bg-warning align-self-center">
                    <img class="d-inline-block" src="{$arg.stylesheet}images/ic-4.png" width="30" height="30">
                </div>
                <div class="text-uppercase font-weight-bold mt-1 fz-22">Bảo trì trọn đời</div>
            </div>
            <div class="item text-center">
                <div class="d-inline-block rounded-circle bg-warning align-self-center">
                    <img class="d-inline-block" src="{$arg.stylesheet}images/ic-5.png" width="30" height="30">
                </div>
                <div class="text-uppercase font-weight-bold mt-1 fz-22">Bảo trì trọn đời</div>
            </div>
        </div>
        <script type="text/javascript">
            $('#S-1 .owl-carousel').owlCarousel({
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
                    items:4
                }
            }
        });
        </script>
    </div>
</section>
<section id="S-2" class="S-2 bg-light">
    <div class="container">
        <h2 class="title text-center font-weight-bold text-uppercase">Về chúng tôi</h2>
        <div class="row">
            <div class="col-lg-4 col-12 mb-3">
                <a href="{$a_main_menu.company_information}">
                <!-- <img src="{$arg.stylesheet}images/slider.jpg" class="w-100"> -->
                <img src="{$page.img_intro}" class="w-100">
                </a>
                <div class="title-1 my-3">
                    <a href="{$a_main_menu.company_information}" class="font-weight-bold text-uppercase">Giới thiệu</a>
                </div>
                <p class="text fz-12 text-justify">
                    {$page.description|default:''}
                </p>
                <a href="{$a_main_menu.company_information}" class="btn btn-sm btn-outline-warning rounded-0 text-dark">Xem thêm >></a>
            </div>
            <div class="col-lg-4 col-12">
                <div class="list-group">
                    <a href="#" class="">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1 text-uppercase"><i class="fa fa-circle text-ye mr-2"></i>THIẾT KẾ KIẾN TRÚC</h5>
                        </div>
                        <p class="my-3 fz-12 text-justify text-dark">{$page.name} là đơn vị hàng đầu chuyên sâu trong lĩnh vực thiết kế kiến trúc - nội thất uy tín nhất tại Hà Nội và các tỉnh thành. Dịch vụ thiết kế kiến trúc tại Nhà Xinh mang đến cho khách hàng </p>
                    </a>
                    <a href="#" class="">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1 text-uppercase"><i class="fa fa-circle text-ye mr-2"></i>XÂY NHÀ TRỌN GÓI</h5>
                        </div>
                        <p class="my-3 fz-12 text-justify text-dark">{$page.name} chuyên nhận thầu các công trình thiết kế, thi công xây nhà trọn gói với dịch vụ "chìa khóa trao tay" uy tín, chất lượng,đúng thời hạn. Liên hệ : {$page.phone}</p>
                    </a>
                    <a href="#" class="">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1 text-uppercase"><i class="fa fa-circle text-ye mr-2"></i>THI CÔNG NỘI THẤT</h5>
                        </div>
                        <p class="my-3 fz-12 text-justify text-dark">{$page.name} là công ty thiết kế và thi công nội thất chuyên nghiệp, uy tín tại Hà Nội. Nhận thi công, báo giá chi tiết các gói dịch vụ từ tiết kiệm - cao cấp. Liên hệ {$page.phone}</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-12">
                <div class="owl-carousel owl-theme">
                    {foreach from=$a_home_supporters item=data}
                    <div class="item bg-white text-center py-3">
                        <div class="avt rounded-circle d-inline-block">
                            <img src="{$data.avatar}">
                        </div>
                        <div class="font-weight-bold text-capitalize my-2">Hotline - {$data.name}</div>
                        <p class="font-weight-bold text-uppercase mb-0">mail: <span class="text-warning">{$data.email}</span></p>
                        <p class="font-weight-bold text-uppercase mb-0">TEL: <span class="text-warning">{$data.phone}</span></p>
                        <p class="font-weight-bold text-uppercase mb-0">skype: <span class="text-warning">{$data.skype}</span></p>
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
                            items:1
                            }
                        }
                    });
                </script>
            </div>
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
{if $a_home_product_new}
<section id="S-4" class="S-4 S-2">
    <div class="container text-center">
        <h2 class="title text-uppercase font-weight-bold">Sản phẩm mới</h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_product_new key=k item=data}
            <div class="item">
                <div>
                    <a class="pos-rel d-block p-3" href="{$data.url}" alt="{$data.name}">
                        <img src="{$data.avatar}" class="w-100" height="268">
                    <span class="mask"></span>
                    </a>
                </div>
                <div class="name my-3">
                    <a href="" class="font-weight-bold">{$data.name}</a>
                </div>
                <p class="fz-12 mt-3 px-3">Giá từ {$data.price|number_format}đ</p>
                <a href="{$data.url}" class="btn btn-outline-warning btn-sm my-2">Xem thêm >></a>
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
{/if}
<section id="S-5" class="S-5 S-2 bg-light py-5">
    <div class="container">
        <h2 class="title font-weight-bold text-uppercase text-center">Tại sao nên chọn {$page.name}</h2>
        <div class="row">
            <div class="col-lg-6 col-12 d-none d-lg-block">
                <div class="wrapper">
                    <div class="list-icon">
                        <div class="icon icon-1 bg-warning rounded-circle p-2">
                            <img src="{$arg.stylesheet}images/ic-2.png" width="37" height="37">
                        </div>
                        <div class="icon icon-2 bg-warning rounded-circle p-2">
                            <img src="{$arg.stylesheet}images/ic-3.png" width="37" height="37">
                        </div>
                        <div class="icon icon-3 bg-warning rounded-circle p-2">
                            <img src="{$arg.stylesheet}images/ic-4.png" width="37" height="37">
                        </div>
                        <div class="icon icon-4 bg-warning rounded-circle p-2">
                            <img src="{$arg.stylesheet}images/ic-5.png" width="37" height="37">
                        </div>
                        <div class="icon icon-5 bg-warning rounded-circle p-2">
                            <img src="{$arg.stylesheet}images/ic-6.png" width="37" height="37">
                        </div>
                    </div>
                    <div class="text bg-white rounded-circle align-self-center text-center">
                        <div class="SS-1">
                            <div class="SS-2">
                                <h3 class="title-1 ">{$page.name}</h3>
                                <span class="fz-12 mx-3 text-center d-block">"HIỂU RÕ" về công nghệ sản xuất, sở hữu xưởng sản xuất thi công nội thất riêng với chi phí RẺ HƠN đến 20%.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-12 align-self-center">
                <h3 class="title-1 font-weight-bold text-uppercase mt-5 mt-lg-0 text-center text-lg-left d-none d-lg-block">5 lý do bạn nên chọn chúng tôi</h3>
                <p class="pl-5">
                    <span class="d-inline-block px-2 border-warning text-warning border rounded-circle">1</span>
                    Là công ty uy tín, tin cậy với kinh nghiệm trên 10 năm thiết kế - thi công xây dựng nội thất
                </p>
                <p class="pl-5">
                    <span class="d-inline-block px-2 border-warning text-warning border rounded-circle">2</span>
                    Là công ty uy tín, tin cậy với kinh nghiệm trên 10 năm thiết kế - thi công xây dựng nội thất
                </p>
                <p class="pl-5">
                    <span class="d-inline-block px-2 border-warning text-warning border rounded-circle">3</span>
                    Là công ty uy tín, tin cậy với kinh nghiệm trên 10 năm thiết kế - thi công xây dựng nội thất
                </p>
                <p class="pl-5">
                    <span class="d-inline-block px-2 border-warning text-warning border rounded-circle">4</span>
                    Là công ty uy tín, tin cậy với kinh nghiệm trên 10 năm thiết kế - thi công xây dựng nội thất
                </p>
                <p class="pl-5">
                    <span class="d-inline-block px-2 border-warning text-warning border rounded-circle">5</span>
                    Là công ty uy tín, tin cậy với kinh nghiệm trên 10 năm thiết kế - thi công xây dựng nội thất
                </p>
            </div>
        </div>
    </div>
</section>
{if $a_home_partners}
<section id="S-6" class="S-5 S-2">
    <div class="container py-4">
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_partners item=data}
            <div class="item text-center">
                <div class="rounded-circle d-inline-block">
                    <img src="{$data.logo_custom}" alt="{$data.name}">
                </div>
                <div class="title-1 text-warning text-uppercase font-weight-bold mt-3">{$data.name}</div>
                <p class="text-white mx-3 text-left mx-lg-5 px-lg-5 font-weight-bold mt-4">" {$data.description}"</p>
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
                    items:1
                },
                1000:{
                    items:1
                }
            }
        });
        </script>
    </div>
</section>
{/if}
{if $a_home_product_main}
<section id="S-7" class="S-4 S-2 pb-4">
    <div class="container text-center">
        <h2 class="title text-uppercase font-weight-bold">Danh sách sản phẩm</h2>
        <div class="owl-carousel owl-theme">
            {foreach from=$a_home_product_main key=k item=data}
            <div class="item pb-3">
                <div>
                    <a class="d-block pos-rel" href="{$data.url}" alt="{$data.name}">
                    <img src="{$data.avatar}" class="w-100" height="268">
                    <span class="mask"></span>
                    </a>
                </div>
                <small class="text-warning">Ngày: 15,01,2018</small>
                <div class="name  py-2">
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
{/if}
<section  class="py-4 bg-light mt-4">
    <div class="container">
        <h3 class="sec-tit text-center ">
            <span class="bg-light">Sơ lược về công ty</span>
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
            <div class="col-md-3 mb-3 mg-lg-0">
                <div class="img-zoom"><img alt="" src="{$data}" class="w-100 img-thumbnail rounded-0"></div>
            </div>
            {/foreach}
        </div>
        <div class="text-center my-4">
            <a href="{$a_main_menu.contact}" class="btn btn-danger mr-3"><i class="fa fa-fw fa-envelope-o"></i> Liên hệ với nhà cung cấp</a>
            <button class="btn btn-outline-warning mr-3 mt-3 mt-md-0">Bắt đầu đặt hàng</button>
            <a href="{$a_main_menu.company_information}" class="mt-3 mt-md-0 d-block d-md-inline-block text-info">Tìm hiểu thêm về chúng tôi ></a>
        </div>
    </div>
    </div>
</section>
