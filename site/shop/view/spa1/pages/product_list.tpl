<section id="S-5" class="my-4">
        <div class="container">
            <div class="row">
                <aside class="col-lg-3 col-md-3 d-md-none d-lg-block" >
                    <div class="sidebar-category mb-4">
                        <div class="aside-title">
                            <h2>Danh mục</h2>
                            <div class="line text-right">
                                <span class=" bg-white pl-1">
                                    <i class="fa fa-asterisk"></i>
                                </span>
                            </div>
                        </div>
                        <div class="aside-content mt-1">
                            <div class="nav-category navbar-toggleable-md">
                                <ul class="nav navbar-pills">
                                    {foreach from=$a_main_product_category item=data}
                                    <li class="nav-item w-100">
                                        <i class="fa fa-check-circle"></i>
                                        <a class="nav-link" href="/collections/all">{$data.name}</a>
                                    </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="list-product-mini mt-5">
                        <div class="aside-title pb-3">
                            <h2>San pham noi bat</h2>
                            <div class="line text-right">
                                <span class=" bg-white pl-1">
                                    <i class="fa fa-asterisk"></i>
                                </span>
                            </div>
                        </div>
                        <div class="aside-content text-center  d-none d-sm-block">
                            <div class="row">
                                {foreach from=$result key=k item=data}
                                <div class="col-sm-12 py-3">
                                    <div class="bdb-1 pb-3">
                                        <a href="{$data.url}" class="product-img">
                                            <img class="w-100" src="{$data.avatar}" alt="{$data.name}">
                                        </a>
                                        <div class="product-info ">
                                            <h3>
                                                <a href="{$data.url}">{$data.name}</a>
                                            </h3>
                                            <div class="rate">
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div class="price">Giá từ {$data.price|number_format}₫</div>
                                        </div>
                                    </div>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </aside>
                <div class="col-lg-9 col-md-12">
                    <div class="row">
                        {foreach from=$result key=k item=data}
                        <div class="col-lg-4 col-md-6 col-12 mb-3">
                            <div class="card text-center">
                                <a href="{$data.url}">
                                    <img src="{$data.avatar}" class="w-100" alt="{$data.name}">
                                </a>
                                <div class="name">
                                    {$data.name}
                                </div>
                                <div class="price pt-3">
                                    Giá từ {$data.price|number_format}₫
                                </div>
                                <div class="action mb-4">
                                    <form action="">
                                        <button class="btn">
                                            <i class="fa fa-cart-plus"></i>
                                        </button>
                                        <button class="btn btn-cart">
                                            <i class="fa fa-heart"></i>
                                        </button>
                                    </form>
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