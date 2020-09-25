
<section id="S-7">
    <div class="container">
        <h1>
            <i class="fa fa-tags"></i>
            Danh sách sản phẩm
        </h1>
    </div>
</section>
<section id="S-6" class="S-2 py-4">
    <div class="container">
        <div class="row">
            {foreach from=$result key=k item=data}
            <div class="col-lg-3 col-md-6 pt-4 pt-lg-0">
                <div class="list-pro">
                    <div class="wrapper">
                        <div class="avt">
                            <a href="{$data.url}">
                            <img src="{$data.avatar}" alt="" class="w-100">
                            </a>
                            <div class="sup text-center">
                                <a href="{$data.url}">
                                <i class="fa fa-search-plus"></i>
                                </a>
                                <a href="{$data.url}">
                                <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="info">
                            <div class="icon">
                                <a href="">
                                <i class="fa fa-asterisk"></i>
                                </a>
                            </div>
                            <h2>
                                <svg width="100%" height="100%">
                                    <line class="top" x1="0" y1="0" x2="600" y2="0"></line>
                                    <line class="left" x1="0" y1="200" x2="0" y2="-400"></line>
                                    <line class="bottom" x1="100%" y1="100%" x2="-700" y2="100%"></line>
                                    <line class="right" x1="100%" y1="0" x2="100%" y2="1000"></line>
                                </svg>
                                <a href="{$data.url}" class="cl-red">{$data.name}</a>
                            </h2>
                            <div class="price text-center card d-inline-block mt-4 p-2">
                                Giá từ {$data.price|number_format}₫
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}
            <div class="col-12 text-center mt-3">
                <div class="d-inline-block text-right">{$paging}</div>
            </div>
        </div>
    </div>
</section>