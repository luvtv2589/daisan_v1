    <section id="sort">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <h3>Danh mục sản phẩm
                        <span>({$out.number})</span></h3>
                </div>
                <div class="col-6 text-left d-flex text-right justify-content-end">
                    <span class="pr-4 no-wrap">Sắp xếp</span>
                    <form class="sort-by" method="get" >
                        <select name="orderby" class="orderby">
                            <option value="menu_order" selected="selected">Thứ tự mặc định</option>
                            <option value="popularity">Thứ tự theo mức độ phổ biến</option>
                            <option value="rating">Thứ tự theo điểm đánh giá</option>
                            <option value="date">Thứ tự theo sản phẩm mới</option>
                            <option value="price">Thứ tự theo giá: thấp đến cao</option>
                            <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <section id="S-1 " class="my-3 S-1">
        <div class="container">
            <div class="sec-content">
                <div class="row">
                    {foreach from=$result key=k item=data}
                    <div class="col-lg-3 col-6 pt-3">
                        <div class="card w-100">
                            <img class="card-img-top w-100 zoom-in" height="200" src="{$data.avatar}" alt="{$data.name}">
                            <div class="card-body text-center">
                                <h3 class="card-title">{$data.name}</h3>
                                <p>Giá từ {$data.price|number_format}₫</p>
                                <a href="{$data.url}" class="btn cl-red">Chi tiết sản phẩm</a>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <div class="col-12 text-center mt-3">
                        <div class="d-inline-block text-right">{$paging}</div>
                    </div>
                </div>
            </div>
        </div>
    </section>