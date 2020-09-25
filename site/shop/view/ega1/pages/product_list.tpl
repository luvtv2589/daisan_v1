
        <section id="banner">
            <div class="container">
                <img src="{$arg.stylesheet}images/banner.jpg" class="w-100" alt="">
            </div>
        </section>
        <section id="S-9" class="S-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-12">
                        <div class="row">
                            <div class="col-lg-6 text-left col-12 mt-2 my-lg-4">
                                Có <span class="text-danger">{$out.number}</span> sản phẩm
                            </div>
                            <div class="col-lg-4 offset-lg-2 col-12 text-right my-2 my-lg-4 ">
                                <label class="float-left float-lg-none mt-2 mt-lg-0">Sắp xếp theo:</label>
                                <select class="form-control " onchange="sortby(this)">
                                    <option value="default">Mặc định</option>
                                    <option value="price-asc" sort_by="price_min:asc">Giá tăng dần</option>
                                    <option value="price-desc" sort_by="price_min:desc">Giá giảm dần</option>
                                    <option value="alpha-asc" sort_by="name:asc">Từ A-Z</option>
                                    <option value="alpha-desc" sort_by="name:desc">Từ Z-A</option>
                                    <option value="created-desc" sort_by="created_on:desc">Mới đến cũ</option>
                                    <option value="created-asc" sort_by="created_on:asc">Cũ đến mới</option>
                                </select>
                            </div>
                            {foreach from=$result key=k item=data}
                            <div class="col-lg-3 col-6 my-2 my-lg-0 pb-3">
                                <div class="card">
                                    <a href="{$data.url}">
                                        <img src="{$data.avatar}" class="w-100" height="182">
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
                                            Giá từ {$data.price|number_format}₫
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
                    <div class="col-3 mt-4 d-none d-sm-block">
                        <div class="card">
                            <h4 class="card-title">
                                <a href="">
                                Danh mục sản phẩm
                                <i class="fa fa-angle-down float-right"></i>
                                </a>
                            </h4>
                            <div class="card-body mb-2">
                                <ul class="ml-1">
                                    {foreach from=$a_main_product_category key=k item=data}
                                    <li class="p-1">
                                        <a href="{$data.url}" class="d-block ml-3">
                                            {$data.name} 
                                        </a>
                                    </li>
                                    {/foreach}
                                   
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar">
                            <div class="title mb-3 mt-4">
                                <h2>DANH MỤC SẢN PHẨM</h2>
                            </div>
                            <ul>
                                {foreach from=$result key=k item=data}
                                <li class="mb-2 d-flex">
                                        <a href="{$data.url}">
                                            <img src="{$data.avatar}" width="65">
                                        </a>
                                    <span class="info d-block">
                                        <h3>
                                            <a href="{$data.url}">
                                                {$data.name}
                                            </a>
                                        </h3>
                                        <span class="cl pl-2">
                                            <ins>Giá từ {$data.price|number_format}₫</ins>
                                        </span>
                                    </span>
                                </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>