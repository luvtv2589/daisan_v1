<section id="S-9" class="S-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="filler">
                    <div class="tit">
                        <h3>Danh mục nhóm<i class="fa fa-minus float-right"></i> </h3>
                    </div>
                    <div class="filler-box">
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
                    </div>
                </div>
                <div class="filler">
                    <div class="tit">
                        <h3>Sản phẩm liên quan<i class="fa fa-minus float-right"></i> </h3>
                    </div>
                    <div class="filler-box">
                        <ul>
                            {foreach from=$result key=k item=data}
                            <li>
                                <a href="{$data.url}" class="d-flex">
                                    <img src="{$data.avatar}" width="80" height="80">
                                    <span class="pl-2 d-block">
                                        <span class="name d-block">{$data.name}</span>
                                        <span class="text-secondary">Giá từ {$data.price} đ</span>
                                    </span>
                                </a>

                        </li>
                        {/foreach}
                      
                        </ul>
                    </div>
                </div>
                
            </div>
            <div class="col-lg-9">
                <div class="row">
                    <div class="col-12">
                        <h3 >Danh mục sản phẩm</h3>
                    </div>
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-4 my-3 col-6">
                        <div class="item">
                            <a href="{$data.url}" class="d-block avt">
                            <img src="{$data.avatar}" class="w-100" height="200">
                            <button class="btn btn-success">Xem nhanh</button>
                            </a>
                            <div class="sale">-21%</div>
                            <h3 class="name pt-2">
                                <a href="{$data.url}">{$data.name}</a>
                            </h3>
                            <span class="price">Giá từ {$data.price} đ</span>
                            
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