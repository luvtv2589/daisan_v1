<section id="S-10" class="S-2 my-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 order-12 order-lg-0 mt-4 mt-lg-0 mg-lg-0">
                <aside class=" mb-4 ">
                    <h4 class="title d-block w-100">
                        DANH MỤC SẢN PHẨM
                    </h4>
                    <ul class="nav navbar-pills">
                        {foreach from=$a_main_product_category item=data}
                        <li class="nav-item w-100">
                            <a href="{$data.url}" class="nav-link">{$data.name}
                            <span class="text-muted">(8)</span>
                            </a>
                        </li>
                        {/foreach}
                    </ul>
                </aside>
                <aside class=" mb-4 list-i">
                    <h4 class="title d-block w-100">
                        SẢN PHẨM LIÊN QUAN
                    </h4>
                    <ul class="nav navbar-pills">
                        {foreach from=$result key=k item=data}
                        <li class="nav-item w-100 d-flex py-3 pl-1 border-bottom">
                            <a href="{$data.url}" class="nav-link p-0">
                            <img src="{$data.avatar}" width="100">
                            </a>
                            <div class="info pl-2">
                                <h3>
                                    <a href="{$data.url}">{$data.name}</a>
                                </h3>
                                <div class="price">Giá từ {$data.price|number_format}₫</div>
                            </div>
                        </li>
                        {/foreach}
                    </ul>
                </aside>
            </div>
            <div class="col-lg-9">
                <h4 class="title d-block w-100 text-center text-lg-left">
                    <span class="mb-2 mb-lg-0 d-block d-lg-inline-block"> 
                    DANH SÁCH SẢN PHẨM
                    </span>
                    <div id="sort-by" class="float-lg-right">
                        <label class="left hidden-xs">Sắp xếp theo: </label>
                        <select onchange="sortby(this.value)">
                            <option class="valued" value="default">Mặc định</option>
                            <option value="price-asc">Giá tăng dần</option>
                            <option value="price-desc">Giá giảm dần</option>
                            <option value="alpha-asc">Từ A-Z</option>
                            <option value="alpha-desc">Từ Z-A</option>
                            <option value="created-asc">Mới đến cũ</option>
                            <option value="created-desc">Cũ đến mới</option>
                        </select>
                    </div>
                </h4>
                <div class="row">
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-4 col-md-4 col-6">
                        <div class="item p-2">
                            <div class="list-product">
                                <div class="thumnail">
                                    <div class="sale">Sale</div>
                                    <a href="{$data.url}" class="d-block">
                                    <img src="{$data.avatar}" class="w-100" height="200">
                                    </a>
                                    <div class="action">
                                        <form>
                                            <button class="btn-cart btn-custom" title="Chọn sản phẩm" type="button">Chọn sản phẩm</button>
                                            <a href="{$data.url}" class="btn-custom"><i class="fa fa-search" aria-hidden="true"></i></a>
                                            <a href="" class="btn-custom"><i class="fa fa-heart-o"></i></a>
                                        </form>
                                    </div>
                                </div>
                                <div class="info">
                                    <h3 class="name">
                                        <a href="{$data.url}">{$data.name}</a>
                                    </h3>
                                    <p>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </p>
                                    <div >
                                        <span class="price">Giá từ {$data.price|number_format}₫</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <div class="col-12 text-center">
                        <div class="d-inline-block text-right">{$paging}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>