<div class="container">
   <div class="row row-sm">
      <div class="col-md-9 col-12">
         <div class="card-group">
            <div class="card rounded-0" style="flex-grow: 0.75" id="productimg">
               <div class="card-body">
                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                     <ol class="carousel-indicators showimg">
                        {foreach from=$info.a_images key=k item=data}
                        <li data-target="#carouselExampleIndicators" data-slide-to="{$k}" class="{if $k eq 0}active{/if}">
                           <img class="d-block w-100" src="{$data}">
                        </li>
                        {/foreach}
                     </ol>
                     <div class="carousel-inner">
                        {foreach from=$info.a_images key=k item=data}
                        <div class="carousel-item {if $k eq 0}active{/if}">
                           <img class="d-block w-100" src="{$data}">
                        </div>
                        {/foreach}
                     </div>
                     <a class="carousel-control-prev" href="#carouselExampleIndicators" data-slide="prev"> 
                     <span class="carousel-control-prev-icon"></span> 
                     <span class="sr-only">Previous</span>
                     </a> 
                     <a class="carousel-control-next" href="#carouselExampleIndicators" data-slide="next">
                     <span class="carousel-control-next-icon"></span>
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
                  <div class="mt-3">
                     <button class="btn btn-sm" onclick="SetFavorites({$info.id});"><i class="fa fa-fw fa-heart-o"></i> Favorites</button>
                  </div>
               </div>
            </div>
            <d class="card rounded-0">
            <div class="card-body d-none d-md-block">
               <h3 class="mb-0">{$info.name}</h3>
            </div>
            <div class="card-header d-none d-md-block fz-14"><b>Giá bán sản phẩm</b>, <a href="{$arg.thislink}#price" class="text-info1">xem bảng giá chi tiết</a></div>
            <div class="card-body info-mobile text-center">
               <h3 class="mb-0 d-block d-md-none">{$info.name}</h3>
               <h5><b class="d-block d-md-inline-block">{$info.price}</b> <span class="d-none d-md-inline-block">|</span> <small>{$info.minorder} {$info.unit} (Min. Order)</small></h5>
            </div>
            <div class="card-header">
               <p class="mb-1 d-none d-md-block">Xử lý đơn hàng: <b>{$info.ordertime|default:''}</b></p>
               <p class="mb-2 d-none d-md-block">Khả năng cung cấp: <b>{$info.ability|default:''}</b></p>
               <div class="mt-3">
                  <a class="btn btn-custom mb-2 font-weight-bold text-white fz-14" href="{$info.url_contact}">
                  <i class="fa fa-fw fa-envelope-open-o fz-14"></i> Liên Hệ Nhà Cung Cấp
                  </a>
                  {if $info.order}
                  <a class="order btn btn-custom-1 col-white mb-2 fz-14" href="{$info.url_addcart}">
                  <i class="fa fa-fw fa-shopping-cart d-none d-md-inline-block"></i> Đặt Hàng Ngay
                  </a>
                  {/if}
                  <a class="btn btn-custom-1 col-white mb-2 d-inline-block d-md-none fz-14" href="{$info.url_addcart}">
                  CHAT NOW ON APP
                  </a>
               </div>
            </div>
            <div class="card-body cb-1 fz-14">
               <p class="mb-1"><i class="fa fa-bookmark text-warning"></i> Thông tin sản phẩm</p>
               <div class="d-none d-md-block">
                  <p class="mb-1">
                     <span class="col-gray">Mã:</span> {$info.code}  <span class="col-gray">Thương hiệu:</span> {$info.trademark}
                  </p>
                  <p>{$info.keyword|default:''}</p>
                  <p class="mb-1 d-flex">
                     <span class="col-gray pr-1">Seller Support:</span>
                     <span> 
                     <i class="fa fa-address-card text-warning"></i> Trade Assurance
                     <small class="text-muted d-block">-- To protect your orders from payment to delivery</small>
                     </span>
                  </p>
                  <p class="mb-1">
                     <span class="col-gray pr-custom align-top">Payment:</span>
                     <span class="payment-item visa"></span>
                     <span class="payment-item mastercard"></span>
                     <span class="payment-item tt"></span>
                     <span class="payment-item e-checking"></span>
                  </p>
                  <p class="mb-1 d-flex">
                     <span class="col-gray pr-custom align-top">Shipping:</span>
                     <span>
                     Less than Container Load (LCL) Service to US
                     <span class="d-block">
                     <a href="" class="text-info1">Get shipping quote</a>
                     </span>
                     <span class="d-block">
                     <span class="text-muted pr-4 fz-12 d-block"><i class="fa fa-circle fz-4 pr-2"></i>Transparent and fair price</span>
                     <span class="text-muted pr-4 fz-12 d-block"><i class="fa fa-circle fz-4 pr-2"></i>24/7 online support</span>
                     <span class="text-muted pr-4 fz-12 d-block"><i class="fa fa-circle fz-4 pr-2"></i>Online tracking</span>
                     </span>
                     </span>
                  </p>
               </div>
               <div class="d-block d-md-none">
                  <!-- <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Mô tả sản phẩm:</span>
                     <span class="w-50 d-inline-block">{$info.description|nl2br}</span>
                  </p> -->
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Khả năng cung cấp:</span> 
                     <span class="w-50 d-inline-block">{$info.ability|default:''}</span>
                  </p>
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Thương hiệu:</span> 
                     <span class="w-50 d-inline-block">{$info.trademark}</span>
                  </p>
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Thánh toán:</span> 
                     <span class="w-50 d-inline-block">{$info.package|nl2br}</span>
                  </p>
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Payment:</span> 
                     <span class="w-50 d-inline-block">
                     <span class="payment-item visa"></span>
                     <span class="payment-item mastercard"></span>
                     <span class="payment-item tt"></span>
                     <span class="payment-item e-checking"></span>
                     </span>
                  </p>
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Quy cách đóng gói:</span> 
                     <span class="w-50 d-inline-block">{$info.package|nl2br}</span>
                  </p>
                  <p class="mb-2 d-flex">
                     <span class="col-gray w-50 d-inline-block">Xử lý đơn hàng:</span>
                     <span class="w-50 d-inline-block">{$info.ordertime|default:''}</span>
                  </p>
                  <p class="mt-3">
            <button class="btn border-top d-block text-center text-uppercase pt-2 cl-orange open-detail w-100 btn-link">Xem chi tiết</button>
         </p>
               </div>
            </div>
         </div>
         <div class="card mt-2 mb-3 rounded border-0 bg-transparent d-none d-md-block">
            <ul class="nav nav-tabs bg-transparent" id="myTab" role="tablist">
               <li class="nav-item mr-3">
                  <a class="nav-link font-weight-bold active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Thông tin thêm về sản phẩm</a>
               </li>
               <li class="nav-item mr-3 border-bottom-0">
                  <a class="nav-link font-weight-bold " id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Thông tin công ty</a>
               </li>
            </ul>
            <div class="tab-content bg-white border border-top-0" id="myTabContent">
               <div class="tab-pane fade show active fz-14" id="home" role="tabpanel" aria-labelledby="home-tab">
                  <div class="card-body">
                     <h5>Thông tin thêm về sản phẩm</h5>
                     <table class="table table-bordered mb-0">
                        {foreach from=$info.metas item=data}
                        <tr>
                           <td width="40%">{$data.meta_key}</td>
                           <td>{$data.meta_value}</td>
                        </tr>
                        {/foreach}
                     </table>
                     <h5 class="mt-4" id="price">Bảng giá chi tiết</h5>
                     <table class="table table-bordered">
                        {foreach from=$info.prices item=data}
                        <tr>
                           <td width="40%">{$data.version}</td>
                           <td class="text-right">{$data.price|number_format}đ</td>
                        </tr>
                        {/foreach}
                     </table>
                     <h5 class="mt-4 d-none d-md-block">Mô tả sản phẩm</h5>
                     <div class="pl-3 d-none d-md-block">{$info.description}</div>
                     <h5 class="mt-4 d-none d-md-block">Quy cách đóng gói</h5>
                     <div class="pl-3 d-none d-md-block">{$info.package|nl2br}</div>
                     <h5 class="mt-4">Câu hỏi thường gặp</h5>
                     <div class="pl-3">{$info.qa|nl2br}</div>
                  </div>
               </div>
               <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <div class="card-body p-0 fz-14">
                     <ul id="list-custom" class="px-2 list-custom">
                        <li class="d-inline-block">
                           <a href="{$smarty.server.REQUEST_URI}#scroll-1" class="font-weight-bold py-4 px-2 d-inline-block active">Basic Information</a>
                        </li>
                        <li class="d-inline-block">
                           <a href="{$smarty.server.REQUEST_URI}#scroll-2" class="font-weight-bold py-4 px-2 d-inline-block ">Basic Information</a>
                        </li>
                        <li class="d-inline-block">
                           <a href="{$smarty.server.REQUEST_URI}#scroll-3" class="font-weight-bold py-4 px-2 d-inline-block ">Basic Information</a>
                        </li>
                     </ul>
                     <div class="px-3" data-spy="scroll" data-target="#list-custom" data-offset="0">
                        <h3 id="scroll-1" class="font-weight-bold border-bottom">Thông tin cơ bản</h3>
                        <div class="row">
                           <div class="p-3 col-12 col-md-6">
                              <table>
                                 <tbody>
                                    <tr>
                                       <td class="title">Business Type:</td>
                                       <td>  Manufacturer, Trading Company</td>
                                       <td class="d-flex text-warning"><i class="fa fa-check text-warning"></i>Verified</td>
                                    </tr>
                                    <tr>
                                       <td class="title">Main Products:</td>
                                       <td><a href="" class="text-info1">
                                          Food Machinery,Regrigerant Equipent,Mobile Food Cart,Meat Equipment                    </a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="title">Total Annual Revenue:</td>
                                       <td>  Below US$1 Million</td>
                                    </tr>
                                    <tr>
                                       <td class="title">Top 3 Markets:</td>
                                       <td>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <div class="p-3 c-left col-12 col-md-6">
                              <table>
                                 <tbody>
                                    <tr>
                                       <td class="title">Business Type:</td>
                                       <td>  Manufacturer, Trading Company</td>
                                    </tr>
                                    <tr>
                                       <td class="title">Main Products:</td>
                                       <td><a href="" class="text-info1">
                                          Food Machinery,Regrigerant Equipent,Mobile Food Cart,Meat Equipment                    </a>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="title">Total Annual Revenue:</td>
                                       <td>  Below US$1 Million</td>
                                    </tr>
                                    <tr>
                                       <td class="title">Top 3 Markets:</td>
                                       <td>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                          <a href="" class="text-info1 d-block">Africa 24.39%</a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        <div class="px-3">
                           <p class="mt-5">Company Video and Photos</p>
                           <a href="" class="d-inline-block border py-3">
                           <img src="{$arg.stylesheet}images/slider1.jpg" width="120" height="90">
                           </a>
                        </div>
                        <h3 id="scroll-2" class="font-weight-bold border-bottom mt-5">Thông tin cơ bản 2</h3>
                        <div class="px-3">
                           <p class="mt-3">Production Certification ( 3 )</p>
                           <table class="table">
                              <thead class="thead-dark">
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                 </tr>
                              </tbody>
                           </table>
                           <table class="table">
                              <thead class="thead-light">
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <h3 id="scroll-3" class="font-weight-bold border-bottom mt-5">Thông tin cơ bản 3</h3>
                        <div class="px-3">
                           <p class="mt-3">Production Certification ( 3 )</p>
                           <table class="table">
                              <thead class="thead-dark">
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                 </tr>
                              </tbody>
                           </table>
                           <table class="table">
                              <thead class="thead-light">
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                 </tr>
                                 <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="col-md-3 col-12">
         <div class="card mb-3 rounded-0 ml-md-4">
            <div class="card-header p-2 border-bottom-0 font-weight-bold">
               <h5 class="mb-0">Thông tin giao dịch</h5>
            </div>
            <div class="p-3 col-gray">
               <p class="text-b mb-1"><a href="{$page.url}" class="text-info1 font-weight-bold"><i class="fa fa-diamond text-warning"></i> {$page.name}</a></p>
               <p class="text-sm fz-12">{$page.address}</p>
               <hr>
               <p class="mb-1 font-weight-bold">Năng lực</p>
               <p class="mb-1 fz-12"><span class="col-gray">Nhân viên:</span> {$page.number_mem_show}</p>
               <p class="mb-1 fz-12"><span class="col-gray">Doanh thu:</span> {$page.revenue}</p>
               <hr>
               <p class="mb-1 text-center">
                  <a href="{$page.url}" class="text-info1">Xem trang</a> &nbsp;|&nbsp;
                  <a href="{$page.pagelink.contact}" class="text-info1">Liên hệ</a>
               </p>
            </div>
         </div>
         {if $other}
         <div class="card mb-3 rounded-0 ml-md-4">
            <div class="card-header p-2">
               <h5 class="mb-0">Sản phẩm khác</h5>
            </div>
            <div class="row m-0">
               {foreach from=$other item=data}
               <div class="col-md-12 col-6 py-2 border-bottom">
                  <a href="{$data.url}">
                  <img alt="{$data.name}" src="{$data.avatar}" width="100%">
                  </a>
                  <div class="px-lg-3 text-center">
                     <h6 class="cuatom-1"><a href="{$data.url}" class="text-custom">{$data.name}</a></h6>
                     <p class="mb-0 mt-2 text-danger">{$data.price|number_format}đ</p>
                  </div>
               </div>
               {/foreach}
            </div>
         </div>
         {/if}
      </div>
   </div>
   <div id="m-12" class="m-12 border mb-3 p-3 d-flex d-block d-md-none bg-white">
      <img class="align-self-center" src="{$arg.stylesheet}images/ic-26.png" width="25" height="25">
      <div class="pl-2">
         2122 nhà cung cấp hiện đang cung cấp sản phẩm này
         <span class="text-uppercase d-block">NHẬN QUẢNG CÁO NGAY BÂY GIỜ</span>
      </div>
      <i class="fa fa-angle-right col-gray float-right"></i>
   </div>
   <div class="m-12 border mb-3 cb-1 d-block d-md-none bg-white">
      <p class="mb-1"><i class="fa fa-bookmark text-warning pr-2"></i>Hồ sơ công ty</p>
      <div class="fz-14">
         <p class="mb-1">{$page.name}</p>
         <p class="mb-1 col-gray">Việt Nam | Manufacturer</p>
         <p class="mb-2 d-block d-md-none d-flex">
            <span class="w-50 d-inline-block">
            <span class="year">
            <span><img src="{$arg.stylesheet}images/ic-27.png" width="16" height="16"></span>
            <span class="num">{$page.yearexp}</span>
            </span>
            <span class="fz-12 text-capitalize col-gray">nhà cung cấp vàng</span>
            </span>
            <span class="w-50 d-inline-block">
            <i class="bicon"></i>
            <span class="fz-12 text-capitalize col-gray">Kiểm tra tại chỗ</span>
            </span>
         </p>
         <p class="mb-2 d-block d-md-none d-flex">
            <span class="d-inline-block w-33">
            <span class="fz-12 col-gray">Thời gian đáp ứng</span>
            <span class="d-block">24h-48h</span>
            </span>
            <span class="d-inline-block w-33">
            <span class="fz-12 col-gray">Tỷ lệ phản hồi</span>
            <span class="d-block">84%</span>
            </span>
            <span class="d-inline-block w-33">
            <span class="fz-12 col-gray">Giao dịch</span>
            <span class="d-block">29++</span>
            </span>
         </p>
         <p class="mb-1">
            <span class="col-gray fz-12">
            Supplier's local time is 11:50</span>
         </p>
         <p class="mt-3">
            <a class="border-top d-block text-center text-uppercase pt-2 cl-orange" href="">Truy cập vào Minisite</a>
         </p>
      </div>
   </div>
   <div id="detail" class="bg-white">
            <div class="container">
               <div class="row row-1">
                  <div class="col-2 align-self-center text-center close-detail">
                     <i class="fa fa-arrow-left"></i>
                  </div>
                  <div class="col-8">
                     <span class="title">Item Details</span>
                  </div>
                  <div class="col-2 align-self-center">
                     <i class="fa fa-ellipsis-v"></i>
                  </div>
               </div>
               <div class="p-4">
                  <table>
                     <tbody>
                        <tr>
                           <td width="40%" class="text-muted">Tên sản phẩm:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                        <tr>
                           <td width="40%" class="text-muted">Hải cảng:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                        <tr>
                           <td width="40%" class="text-muted">Khả năng cung cấp:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                        <tr>
                           <td width="40%" class="text-muted">Điều khoản thanh toán:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                        <tr>
                           <td width="40%" class="text-muted">Chi tiết đóng gói:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                        <tr>
                           <td width="40%" class="text-muted">Chi tiết giao hàng:</td>
                           <td>200-400TC cotton 100% hotel bed sheet ,Duvet cover ,Pillowcase</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="p-0 border-bottom pb-2 mt-4 mx-1">
                  <span class="btn rounded-0 btn-secondary mx-1 p-2 font-weight-bold btn-sm d-inline-block">Mô tả Sản phẩm</span>
               </div>
               <div class="p-1 mt-3">
                  <span class="mx-1 d-block">
                  <img src="{$arg.stylesheet}images/img-test.jpg" class="w-100">
                  </span>
                  <p class="font-weight-bold fz-16 py-3">custom 5 axis cheap cnc machining parts /cnc prototypes </p>
                  <p class="font-weight-bold fz-16 m-0">Surface: nature anodizing</p>
                  <p class="font-weight-bold fz-16 m-0">method: 5 axis CNC machining</p>
                  <p class="font-weight-bold fz-16 m-0">Tolerance: +-0.05mm</p>
                  <p class="font-weight-bold fz-16 m-0">application: aeronautical parts </p>
                  <h3 class="font-weight-bold fz-14 mt-4 mb-3">Sức chứa</h3>
                  <table class="table table-bordered fz-10">
                     <tbody>
                        <tr>
                           <td>CNC Turning</td>
                           <td>φ0.5 - φ300 * 750 mm</td>
                           <td>+/-0.005 mm</td>
                        </tr>
                        <tr>
                           <td>CNC Turning</td>
                           <td>φ0.5 - φ300 * 750 mm</td>
                           <td>+/-0.005 mm</td>
                        </tr>
                        <tr>
                           <td>CNC Turning</td>
                           <td>φ0.5 - φ300 * 750 mm</td>
                           <td>+/-0.005 mm</td>
                        </tr>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td colspan="2">IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td colspan="2">IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                     </tbody>
                  </table>
                  <h3 class="font-weight-bold fz-14 mt-4 mb-3">Sức chứa</h3>
                  <table class="table table-bordered fz-10">
                     <tbody>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                     </tbody>
                  </table>
                  <h3 class="font-weight-bold fz-14 mt-4 mb-3">Sức chứa</h3>
                  <table class="table table-bordered fz-10">
                     <thead>
                        <tr>
                           <th>Aluminum parts</th>
                           <th>Stainless Steel parts</th>
                           <th>Steel</th>
                           <th>Plastic</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Vẽ định dạng</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                        <tr>
                           <td>Thiết bị kiểm tra</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                           <td>IGS,STP,X_T ,DXF,DWG , Pro/E, PDF</td>
                        </tr>
                     </tbody>
                  </table>
                  <span class="mx-1 d-block">
                  <img src="{$arg.stylesheet}images/img.jpg" class="w-100">
                  </span>
                  <span class="mx-1 d-block">
                  <img src="{$arg.stylesheet}images/img.jpg" class="w-100">
                  </span>
                  <span class="mx-1 d-block">
                  <img src="{$arg.stylesheet}images/img.jpg" class="w-100">
                  </span>
                  <span class="mx-1 d-block">
                  <img src="{$arg.stylesheet}images/img.jpg" class="w-100">
                  </span>
               </div>
               <div class="p-0 border-right-0 border-bottom pb-2 mt-4 mx-1">
                  <span class="btn rounded-0 b btn-secondary mx-1 p-2 font-weight-bold btn-sm d-inline-block">Câu hỏi thường gặp</span>
               </div>
                <div class="mx-1">
                     <p class="pb-2 pt-3">Q1:Where can I get product&price information?</p>
                     <p>A1:Send us inquiry e-mail , we will contact you as we receive your mail. </p>
                  </div>
            </div>
         </div>
   
   <div class="m-12 border mb-3 cb-1 d-block d-md-none bg-white">
      <p class="mb-1"><i class="fa fa-bookmark text-warning pr-2"></i>Bảo vệ người mua</p>
      <div class="fz-14">
         <p class="pb-2">
            <img src="{$arg.stylesheet}images/ic-8.png" width="16" height="16" class="mr-3 d-inline-block">
            Đảm bảo thương mại bảo vệ đơn đặt hàng của bạn
         </p>
         <p class="mb-1 col-gray"><i class="fa fa-check-circle text-success pr-2"></i>Nhiều tùy chọn thanh toán an toàn</p>
         <p class="mb-1 col-gray"><i class="fa fa-check-circle text-success pr-2"></i>Vận chuyển & chất lượng không lo lắng</p>
         <p class="mb-1 col-gray"><i class="fa fa-check-circle text-success pr-2"></i>Xây dựng uy tín của bạn</p>
         <p class="mt-3 text-center">
            <a href="" class="btn btn-sm btn-outline-secondary">Gửi yêu cầu đặt hàng</a>
         </p>
      </div>
   </div>
   <div id="S-1-1-1" class="m-12 border mb-3 d-block d-md-none p-3 bg-white">
      <span class="d-block col-gray">Các Tìm kiếm Liên quan::  <i class="fa fa-1 fa-angle-down float-right open-s-1 fz-14"></i></span>
      <div class="mt-2">
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
      </div>
       <span class="d-block col-gray mt-3">Tìm kiếm Trung Quốc: </span>
      <div class="mt-2">
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
      </div>
       <span class="d-block col-gray mt-3">Categories:</span>
      <div class="mt-2">
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Home</a>
          <span>></span>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <span>></span>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
          <span>></span>
          <a href="" class="btn btn-sm btn-outline-secondary fz-12 d-inline-block mb-1 mr-1">Gửi yêu cầu đặt hàng</a>
      </div>
   </div>
</div>
<script type="text/javascript">
   function SetFavorites(product_id){
     if(arg.login==0){
        noticeMsg('System Message', 'Vui lòng đăng nhập trước khi thực hiện chức năng.');
        return false;
     }
     var data = {};
     data['id'] = product_id;
     data['ajax_action'] = 'set_product_favorite';
     loading();
     $.post('?mod=product&site=ajax_handle', data).done(function(e){
        data = JSON.parse(e);
        if(data.code==1){
           noticeMsg('System Message', data.msg, 'success');
        }else noticeMsg('System Message', data.msg, 'error');
        
        endloading();
     });
   }
    $(document).ready(function(){
        $(".open-s-1").click(function(){
            $("#S-1-1-1").css("height","auto");
            $("#S-1-1-1 i.fa-1").css("transform","rotate(180deg)");
        });
         $(".open-detail").click(function(){
            $("#detail").show();
        });
         $(".close-detail").click(function(){
            $("#detail").hide();
        });
    });
</script>