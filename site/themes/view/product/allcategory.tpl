<div class="border-top pt-2">
    <section class="Cate-S-1">
        <div class="container-small">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent p-0 mb-2">
                    <li class="breadcrumb-item"><a href="{$arg.domain}" class="text-primary">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Toàn bộ danh mục</li>
                </ol>
            </nav>
        </div>
    </section>
    <section id="Cate-S-1" class="Cate-S-1 ">
        <div class="container-small">
            <h3 class="font-weight-bold mb-3 mt-3">Sản phẩm theo danh mục</h3>
            <div class="row m-0 bg-white border-top border-left navbar-fixed-top">
                {foreach from=$a_category_all item=cate key=k}
                <div class="item {if $k eq 0}active{/if} col-lg-2 col-md-3 col-6 border-right border-bottom p-0">
                    <div class="border h-100 py-lg-3 p-2">
                        <a href="{$smarty.server.REQUEST_URI}#scroll-{$k}" class="d-flex d-block h-100 justify-content-center">
                        <img src="{$cate.thumb}" width="35" height="35">
                        <span class="name align-self-center pl-2 font-weight-bold">{$cate.name}</span>
                        </a>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </section>
    <section class="Cate-S-2 Cate-S-1 mt-3" data-spy="scroll" data-target="#Cate-S-1" data-offset="0">
        <div class="container-small">
            <div class="row">
                <div class="col-lg-9 col-12">
                    {foreach from=$a_category_all item=cate key=k}
                    <div id="scroll-{$k}" class="row">
                        <h2 class="d-flex col-12 my-4">
                            <img src="{$cate.thumb}" width="35" height="35">
                            <span class="align-self-center pl-4 font-weight-bold text-uppercase">{$cate.name} ({$a_cate_number[$cate.id]|default:0})</span>
                        </h2>
                        {foreach from=$cate.sub item=sub}
                        <div class="col-lg-6 pl-5 mb-4">
                            <h3>
                                <a href="{$sub.url}" class="text-primary font-weight-bold">{$sub.name}
                                <span class="text-muted">({$a_cate_number[$sub.id]|default:0})</span>
                                </a>
                            </h3>
                            <ul class="list-unstyled my-2">
                                {foreach from=$sub.sub item=data}
                                <li>
                                    <a href="{$data.url}">{$data.name} ({$a_cate_number[$data.id]|default:0})</a>
                                </li>
                                {/foreach}
                            </ul>
                            {if count($sub.sub) >8 || count($sub.sub) eq 8 }
                            <a href="{$sub.url}" class="text-primary">Xem thêm <i class="fa fa-angle-down"></i></a>
                            {/if}
                        </div>
                        {/foreach}
                    </div>
                    {/foreach}
                </div>
                <div class="col-lg-3 d-none d-lg-block">
                    <h2 class="my-4">
                        <span class="align-self-center font-weight-bold">Mua hàng trên Daisan</span>
                    </h2>
                    <div class="border mt-3 p-3">
                        <div class="text-muted">
                            Tại Daisan, chúng tôi có rất nhiều công cụ và dịch vụ miễn phí dành cho người mua để giúp tìm nguồn cung ứng sản phẩm phù hợp dễ dàng cho bạn!
                        </div>
                        <ul class="list-unstyled mt-3 pl-3">
                            <li class="d-block">
                                <a href="" class="text-info"><i class="fa fa-circle pr-2"></i>Dịch vụ người mua</a>
                            </li>
                            <li class="d-block">
                                <a href="" class="text-info"><i class="fa fa-circle pr-2"></i>Trung tâm giao dịch an toàn</a>
                            </li>
                            <li class="d-block">
                                <a href="" class="text-info"><i class="fa fa-circle pr-2"></i>Câu chuyện thành công của người mua</a>
                            </li>
                            <li class="d-block">
                                <a href="" class="text-info"><i class="fa fa-circle pr-2"></i>Cộng đồng người mua</a>
                            </li>
                        </ul>
                    </div>
                    <h2 class="my-4">
                        <span class="align-self-center font-weight-bold">Trung tâm an ninh & an ninh</span>
                    </h2>
                    <div class="border mt-3 p-3 pl-3">
                        <div class="text-muted">
                            Tại Daisan, chúng tôi có rất nhiều công cụ và dịch vụ miễn phí dành cho người mua để giúp tìm nguồn cung ứng sản phẩm phù hợp dễ dàng cho bạn!
                        </div>
                        <!-- 
                        <ul class="mt-3">
                            <li class="d-block pb-2">
                                <a href=""><i class="fa fa-circle pr-2"></i>Mẹo mới để mua an toàn trên Alibaba.com</a>
                            </li>
                            <li class="d-block pb-2">
                                <a href=""><i class="fa fa-circle pr-2"></i>Học hỏi từ những người khác. Xem nghiên cứu điển hình của chúng tôi về gian lận</a>
                            </li>
                        </ul> -->
                    </div>
                    <h2 class="my-4">
                        <span class="align-self-center font-weight-bold">Công cụ mua</span>
                    </h2>
                    <div class="border mt-3 p-3">
                        <ul class="list-3">
                            <li class="d-block ic-1">
                                <a href="" class="font-weight-bold">Trung tâm thông báo</a>
                                <p class="text-muted">Quản lý yêu cầu từ người mua</p>
                            </li>
                            <li class="d-block ic-2">
                                <a href="" class="font-weight-bold">Quản lí thương mại
                                </a>
                                <p class="text-muted">Trò chuyện với người mua trong thời gian thực</p>
                            </li>
                            <li class="d-block ic-3">
                                <a href="" class="font-weight-bold">Thông báo thương mại</a>
                                <p class="text-muted">Luôn cập nhật về các cập nhật thương mại</p>
                            </li>
                            <li class="d-block ic-4">
                                <a href="" class="font-weight-bold">Yêu cầu mua</a>
                                <p class="text-muted">Cho các nhà cung cấp biết nhu cầu tìm nguồn cung ứng của bạn</p>
                            </li>
                            <li class="d-block ic-5">
                                <a href="" class="font-weight-bold">Yêu thích</a>
                                <p class="text-muted">Đánh dấu sản phẩm và nhà cung cấp</p>
                            </li>
                        </ul>
                    </div>
                    <h2 class="my-4">
                        <span class="align-self-center font-weight-bold">Hướng dẫn mua an toàn</span>
                    </h2>
                    <!-- 
                    <div class="border mt-3 p-3">
                        <div class="text-muted">Làm thế nào để kiểm tra nhà cung cấp của bạn trước khi đặt hàng?
                        </div>
                        <ul class="list-cus mt-3 pl-3">
                            <li class="d-block pb-1">
                                <a href="" ><i class="fa fa-circle pr-1"></i>Tôi là nhà giao dịch mới, tôi nên làm gì?</a>
                            </li>
                            <li class="d-block pb-1">
                                <a href="" ><i class="fa fa-circle pr-1"></i>Lợi ích của việc kiểm tra đối với người mua ở nước ngoài.</a>
                            </li>
                            <li class="d-block pb-1">
                                <a href="" ><i class="fa fa-circle pr-1"></i>Làm thế nào để tìm một nhà cung cấp tốt?</a>
                            </li>
                            <li class="d-block pb-1">
                                <a href="" ><i class="fa fa-circle pr-1"></i>Cách tự kiểm tra các nhà cung cấp Trung Quốc của bạn.</a>
                            </li>
                        </ul>
                    </div> -->
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('body').scrollspy({ target: '#Cate-S-1' })
        $("#Cate-S-1 .item").click(function() {
          $(".item").removeClass("active");
          $(this).addClass("active");
        });
        });
        var height = $("header").height() + $("#Cate-S-1").height();
        console.log($(window).height());
        $(window).scroll(function() {
          if($(window).scrollTop() >  height){
            $("#Cate-S-1 .row").addClass('fixed-top');
            $("#Cate-S-2 .row").css('padding-top','180px');
          }
          else{
            $("#Cate-S-1 .row").removeClass('fixed-top');
          }
        });
</script>