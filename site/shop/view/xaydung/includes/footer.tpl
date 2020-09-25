1<footer class="pt-5 S-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 box-1 text-center py-3">
                        <div class="title-1 text-warning font-weight-bold text-uppercase">{$page.name}</div>
                        <p class="text-white text-left fz-12">{$page.description}</p>
                        <a href="{$a_main_menu.company_information}" class="btn btn-outline-warning rounded-0 text-white">Xem thêm</a>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-4">
                                <h3 class="title font-weight-bold text-uppercase">Địa chỉ trụ sở :</h3>
                                <ul class="list-unstyled">
                                    <li class="text-white fz-14 py-1">{$page.address}</li>
                                    <li class="text-white fz-14 py-1">Hotline: <span class="font-weight-bold">{$page.phone}</span></li>
                                    <li class="text-white fz-14 py-1">Email: {$page.email}</li>
                                    <li class="text-white fz-14 py-1">Phản ánh dịch vụ: {$page.phone}</li>
                                </ul>
                            </div>
                            <div class="col-lg-4">
                                <h3 class="title font-weight-bold text-uppercase">Danh mục sản phẩm :</h3>
                                <ul class="list-unstyled">
                                    {foreach from=$a_main_product_category key=k item=data}
                                    <li class="fz-14 py-1">
                                        <a class="text-white" href="{$data.url}">{$data.name}</a>
                                    </li>
                                    {/foreach}
                                   
                                </ul>
                            </div>
                            <div class="col-lg-4">
                                <h3 class="title font-weight-bold text-uppercase">Địa chỉ trụ sở :</h3>
                                <ul class="list-unstyled">
                                    <li class="text-white fz-14 py-1">
                                        <a class="text-white" href="">Chính sách chất lượng</a>
                                    </li>
                                    <li class="text-white fz-14 py-1">
                                        <a class="text-white" href="">Chính sách bảo hành</a>
                                    </li>
                                    <li class="text-white fz-14 py-1">
                                        <a class="text-white" href="">Chính sách bảo mật</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-12 mb-3">
                                <div id="histats_counter">&nbsp;<div id="histats_counter_8394" style="display: block;"><a href="http://www.histats.com/viewstats/?sid=3959898&amp;ccid=509" target="_blank"></a></div></div>
                                <script type="text/javascript">var _Hasync= _Hasync|| [];
                                _Hasync.push(['Histats.start', '1,3959898,4,509,72,18,00010000']);
                                _Hasync.push(['Histats.fasi', '1']);
                                _Hasync.push(['Histats.track_hits', '']);
                                (function() {
                                var hs = document.createElement('script'); hs.type = 'text/javascript'; hs.async = true;
                                hs.src = ('//s10.histats.com/js15_as.js');
                                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(hs);
                                })();</script>
                            </div>  
                            <div class="col-lg-12 ml-4 ">
                                {if $page.url_facebook}
                                <a class="mxh d-inline-block" href="{$page.url_facebook}">
                                    <img src="{$arg.stylesheet}images/ic-fb.png">
                                </a>
                                {/if}
                                {if $page.url_google}
                                <a class="mxh d-inline-block" href="{$page.url_facebook}">
                                    <img src="{$arg.stylesheet}images/ic-g+.png">
                                </a>
                                {/if}
                                {if $page.url_youtube}
                                <a class="mxh d-inline-block" href="{$page.url_youtube}">
                                    <img src="{$arg.stylesheet}images/ic-you.png">
                                </a>
                                {/if}
                                <!-- {if $page.url_gmail}
                                <a class="mxh d-inline-block" href="{$page.url_mail}">
                                    <img src="{$arg.stylesheet}images/ic-gmail.png">
                                </a>
                                {/if} -->
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-1 mt-4 border-top  border-light py-3 text-center font-weight-bold text-uppercase text-warning">{$page.name} - MST : {$page.code} ĐĂNG KÝ NGÀY {$page.date_start} DO SKHĐT, TP - HÀ NỘI</div>
        </footer>