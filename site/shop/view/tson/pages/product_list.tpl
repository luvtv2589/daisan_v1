 <section>
    <div class="mt-40 mb-20">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-12">
                    <div class="sortPagiBar mb-4">
                        <div class="row">
                             <div class="col-lg-12 mb-3
                                <a href="" class="img-1 d-block">
                                <img src="{$arg.stylesheet}images/banner.jpg" class="w-100">
                                </a>
                            </div>
                            <div class="col-5 col-sm-7 col-lg-8 d-none d-md-block">
                                <div class="title  inline-block">
                                    Tất cả sản phẩm
                                </div>
                                <div class="des hidden-sm hidden-xs inline-block">
                                    <span class="hidden-sm hidden-xs">
                                    ({$out.number} sản phẩm)
                                    </span>
                                </div>
                            </div>
                            <div class="col-12 col-sm-5 col-lg-2 offset-lg-2 text-xs-left text-sm-right">
                                <div id="sort-by" class="text-left">
                                    <label for="" class="hidden hidden-xs"></label>
                                    <ul class="title-sort-by">
                                        <li>
                                            <span>Sắp xếp theo</span>
                                            <ul class="sub-sort-by">
                                                <li><a href="javascript:;" onclick="sortby('default')">Mặc định</a></li>
                                                <li><a href="javascript:;" onclick="sortby('alpha-asc')">A → Z</a></li>
                                                <li><a href="javascript:;" onclick="sortby('alpha-desc')">Z → A</a></li>
                                                <li><a href="javascript:;" onclick="sortby('price-asc')">Giá tăng dần</a></li>
                                                <li><a href="javascript:;" onclick="sortby('price-desc')">Giá giảm dần</a></li>
                                                <li><a href="javascript:;" onclick="sortby('created-desc')">Hàng mới nhất</a></li>
                                                <li><a href="javascript:;" onclick="sortby('created-asc')">Hàng cũ nhất</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec-content">
                        <div class="row">

                        	{foreach from=$result key=k item=data}
                            <div class="col-lg-4 col-6">
                                <div class="wrapper">
                                    <div class="product-avt">
                                        <a href="{$data.url}" alt="{$data.name}">
                                        <img src="{$data.avatar}" alt="" class="w-100 p-lg-3 height="280">
                                        </a>
                                        <div class="product-action text-center">
                                            <form action="">
                                                <button class="btn-circle">
                                                <i class="fa fa-shopping-basket"></i>
                                                </button>
                                                <a href="" class="btn-circle">
                                                <i class="fa fa-search-plus"></i>
                                                </a>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="product-info text-center mt-3">
                                        <h3 class="product-name mb-2">
                                            <a href="{$data.url}" alt="{$data.name}">{$data.name}</a>
                                        </h3>
                                        <span class="product-price">Giá từ {$data.price|number_format}đ</span>
                                    </div>
                                    <div class="text-center pb-3">
                                        <a href="{$data.url}" class="btn btn-warning text-white btn-sm rounded-0 font-weight-bold">Chi tiết >></a>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="d-inline-block float-right text-right">{$paging}</div>
                </div>
                <aside class="col-lg-3 col-md-3 d-none d-md-block">
                            <div class="sidebar-category mb-4">
                                <div class="aside-title">
                                    <h2>Danh mục</h2>
                                </div>
                                <div class="aside-content mt-1">
                                    <div class="nav-category navbar-toggleable-md">
                                        <ul class="nav navbar-pills">
                                            {foreach from=$a_main_product_category  key=k item=data}
                                            <li class="nav-item w-100">
                                                <i class="fa fa-folder-o"></i>
                                                <a class="nav-link" href="{$data.url}">{$data.name} </a>
                                            </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-product-mini mt-5">
                                <div class="aside-title pb-3">
                                    <h2>Sản phẩm liên quan</h2>
                                </div>
                                <div class="aside-content">
                                    <div class="row">
                                        {foreach from=$result key=k item=data}
                                        <div class="col-sm-12 py-3">
                                            <div class="bdb-1 pb-3 d-flex">
                                                <a href="{$data.url}" class="product-img">
                                                <img src="{$data.avatar}" alt="{$data.name}" width="100">
                                                </a>
                                                <div class="product-info">
                                                    <h3>
                                                        <a href="{$data.url}">{$data.name}</a>
                                                    </h3>
                                                    <div class="price">Giá từ {$data.price|number_format}đ</div>
                                                </div>
                                            </div>
                                        </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                            
                        </aside>
            </div>
        </div>
    </div>
</section>