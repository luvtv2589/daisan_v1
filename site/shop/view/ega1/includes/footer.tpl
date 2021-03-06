<section id="contact" class="my-3">
   <div class="container">
      <div class="card rounded-0">
         <div class="card-header">
            <h4 class="mb-0"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ tới chúng tôi</h4>
         </div>
         <div class="card-body">
            <div class="form-group row">
               <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
               <div class="col-sm-10">
                  <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
               </div>
            </div>
            <div class="form-group row">
               <label for="inputPassword" class="col-sm-2 col-form-label">Nội dung</label>
               <div class="col-sm-7">
                  <input type="hidden" name="product_id" value="{$info.id|default:0}">
                  <textarea class="form-control rounded-0" rows="5" name="message"></textarea>
                  <small>Nhập nội dung liên hệ từ 30 tới 1000 ký tự</small>
               </div>
               <div class="col-sm-3">
                  <div class="card rounded-0">
                     <div class="p-2">
                        <h5>Liên hệ khi</h5>
                        <p class="mb-2">- Cần giải đáp thắc mắc</p>
                        <p>- Có yêu cầu đặc biệt</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="form-group row">
               <label for="inputPassword" class="col-sm-2 col-form-label"></label>
               <div class="col-sm-7">
                  <button type="button" onclick="SendContact();" class="btn btn-success"><i class="fa fa-fw fa-envelope-o"></i> Gửi liên hệ</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<footer>
   <div class="container">
      <div class="row">
         <div class="col-lg-3 align-self-center">
            <img src="{$page.logo_custom_img}" class="w-100">
         </div>
         <div class="col-12 col-lg-3">
         	<h4 class="title mt-5">
               <a href="" class="text-danger">Liên hệ</a>
            </h4>
            <ul class="list-menu">
               <li>
                  <a href=""> <i class="fa fa-map-marker pr-3 text-danger"></i>Địa chỉ: {$page.address}</a>
               </li>
               <li>
                  <a href=""> <i class="fa fa-phone pr-3 text-danger"></i>Điện thoại: {$page.phone}</a>
               </li>
               <li>
                  <a href=""><i class="pr-3 fa fa-envelope text-danger"></i>Email: {$page.email}</a>
               </li>
            </ul>
         </div>
         <div class="col-12 col-lg-3">
            <h4 class="title mt-5">
               <a href="" class="text-danger">Thông tin</a>
            </h4>
            <ul class="list-menu pl-2">
               <li><a href="{$a_main_menu.home}"><i class="fa fa-angle-right pr-2 text-danger"></i>Trang chủ</a></li>
               <li><a href="{$a_main_menu.company_information}"><i class="fa fa-angle-right pr-2 text-danger"></i>Về chúng tôi</a></li>
               <li><a href=""><i class="fa fa-angle-right pr-2 text-danger"></i>Tất cả dịch vụ</a></li>
               <li><a href=""><i class="fa fa-angle-right pr-2 text-danger"></i>Tuyển dụng</a></li>
               <li><a href="{$a_main_menu.contact}"><i class="fa fa-angle-right pr-2 text-danger"></i>Liên hệ</a></li>
            </ul>
         </div>
         <div class="col-12 col-lg-3">
            <h4 class="title mt-5">
               <a href="" class="text-danger mb-3">Hỗ trợ thanh toán</a>
            </h4>
            <img alt="payment" src="{$arg.stylesheet}images/payment.png">
         </div>
      </div>
      <div class="text-center pb-2" id="foot-btn">
         <h5 class="mt-3 text-center"><a href="http://hodine.com/" class="text-white">Hodine Page</a> Copyright © 2017 Vietsmart Tech Co.,Ltd All Rights Reserved</h5>
         <p class="text-center">Website <a href="http://vietsmart.net" class="text-white">vietsmart.net</a> | Hotline: 0975.700.836 | Email: info.vietsmart@gmail.com</p>
      </div>
   </div>
</footer>
<section id="helptool" class="d-none">
   <ul>
      <li><a href="">Hodine</a></li>
   </ul>
   <a></a>
</section>