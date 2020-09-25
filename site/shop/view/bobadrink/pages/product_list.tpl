<section class="banner">
    <h1>Danh mục sản phẩm</h1>
</section>

<section id="S-9" class="S-2 my-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 d-none d-sm-block order-12 order-lg-0">
                <aside>
                    <h2>Danh mục sản phẩm</h2>
                    <ul class="nav-ul nav navbar-pills">
                        {foreach from=$a_main_product_category key=k item=data}
                        <li class="nav-item w-100">
                            <a href="{$data.url}" class="nav-link">{$data.name} <i class="fa fa-angle-down float-right"></i></a>
                        </li> 
                        {/foreach}

                    </ul>
                </aside>
                <aside class="mt-5">
                    <h2>Sản phẩm liên quan</h2>
                    <ul class="nav-ul nav navbar-pills mt-3">
                        {foreach from=$result key=k item=data}
                        <li class="nav-item w-100 d-flex py-2"><a href="{$data.url}"
                            class="nav-link d-inline-block p-0 "> <img
                                src="{$data.avatar}" width="100">
                        </a>
                            <div class="product-info pl-2">
                                <h3>
                                    <a href="">Ngói phẳng kiểu pháp</a>
                                </h3>
                                <div class="price">Giá từ {$data.price|number_format}₫</div>
                            </div></li> {/foreach}
                    </ul>
                </aside>
            </div>
            <div class="col-lg-9 col-12">
                <div class="row">
                    <div class="col-12">
                        <div class="srt ">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 text-left d-none d-sm-block">
                                    <span>Tổng <b>{$out.number}</b> sản phẩm</span>
                                </div>
                                <div
                                    class="col-lg-6 col-md-6 d-flex justify-content-end col-12 ">
                                    <div id="sort-by">
                                        <label class="left hidden-xs">Sắp xếp theo: </label> <select
                                            onchange="sortby(this.value)">
                                            <option class="valued" value="default">Mặc định</option>
                                            <option value="price-asc">Giá tăng dần</option>
                                            <option value="price-desc">Giá giảm dần</option>
                                            <option value="alpha-asc">Từ A-Z</option>
                                            <option value="alpha-desc">Từ Z-A</option>
                                            <option value="created-asc">Mới đến cũ</option>
                                            <option value="created-desc">Cũ đến mới</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-4 col-md-4 col-6 mb-4">
                        <div class="item">
                            <a href="{$data.url}"> <img src="{$data.avatar}"
                                class="w-100" height="270">
                            </a>
                            <div class=" w-100 action text-center">
                                <form>
                                    <a href="{$data.url}" class=""> <i class="fa  fa-search"></i>
                                    </a>
                                    <button class="btn btn-danger" type="button">Mua hàng</button>
                                    <a href=""> <i class="fa fa-heart-o"></i>
                                    </a>
                                </form>
                            </div>
                            <div class="info text-center">
                                <div class="rate">
                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                        class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                        class="fa fa-star"></i>
                                </div>
                                <div class="name pt-3 px-2">
                                    <a href="{$data.url}">{$data.name}</a>
                                </div>
                                <div class="price">
                                    <span class="cl-red">Giá từ {$data.price|number_format}₫</span>

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