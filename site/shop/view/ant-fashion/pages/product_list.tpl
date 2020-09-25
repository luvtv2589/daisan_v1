
<section id="S-9" class="S-1 mt-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 d-none d-sm-block">
                
                <aside class="cate">
                    <h3 class="title px-1">
                        Danh mục
                    </h3>
                    <ul>
                        {foreach from=$a_main_product_category key=k item=data}
                        <li>
                            <a href="{$data.url}" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$data.name} <i class="fa fa-angle-right float-right"></i></a>
                            <!-- <ul class="sub ml-4 dropdown-menu p-0">
                                <li><a href="">Trang chủ</a></li>
                                <li><a href="">Trang chủ</a></li>
                                <li><a href="">Trang chủ</a></li>
                                <li><a href="">Trang chủ</a></li>
                                <li><a href="">Trang chủ</a></li>
                                </ul> -->
                        </li>
                        {/foreach}
                    </ul>
                </aside>
            </div>
            <div class="col-lg-9 col-12">
                <div class="row">
                    <div class="col-lg-12">
                        <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                    </div>
                    <div class="col-lg-12 py-3">
                        <div class="bdb">
                            <span class="py-3">Tất cả sản phẩm</span>
                            <span class="float-right">
                                <form>
                                    <label>Sắp xếp: </label>
                                    <select>
                                        <option>Thứ tự</option>
                                        <option>A → Z</option>
                                    </select>
                                </form>
                            </span>
                        </div>
                    </div>
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-4 col-12 mt-4 mt-lg-0">
                        <div class="item">
                            <a href="{$data.url}">
                            <img src="{$data.avatar}" class="w-100" height="200">
                            </a>
                            <div class="actions">
                                <form action="" method="post">
                                    <a class="fa fa-shopping-basket add_to_cart" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mua ngay"></a>
                                    <a href="{$data.url}"  data-toggle="tooltip" data-placement="top" title="" class="fa fa-search quick-view" data-original-title="Xem nhanh"></a>
                                </form>
                            </div>
                            <div class="info pb-5 pt-3 text-center px-3">
                                <h3 class="name"><a href="{$data.url}" title="{$data.name}">{$data.name}</a></h3>
                                <span>Giá từ {$data.price|number_format}đ</span>
                            </div>
                        </div>
                    </div>
                   {/foreach}
                    <div class="col-12 text-left">
                        <div class="d-inline-block">{$paging}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>