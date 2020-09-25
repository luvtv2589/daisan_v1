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
      <div class="py-5">
         <div class="row">
            <div class="col-lg-4 justify-content-center text-center">
               <span>
                  <img src="{$arg.stylesheet}images/home_.png">
               </span>
               <h4 class="py-3">Giờ mờ cửa</h4>
               <div>
                  Thứ 2-6: <span>{$page.time_open|default:''}-{$page.time_close|default:''}</span>
               </div>
            </div>
            <div class="col-lg-4 justify-content-center text-center">
               <span>
                  <img src="{$arg.stylesheet}images/email_.png">
               </span>
               <h4 class="py-3">Thông tin liên hệ</h4>
               <div>
                  {$page.address}
               </div>
               <div>
                  Hotline :<span>{$page.phone}</span>
               </div>
               <div>
                  Email :<span>{$page.email}</span>
               </div>
            </div>
            <div class="col-lg-4 justify-content-center text-center">
               <span>
                  <img src="{$arg.stylesheet}images/connect_.png">
               </span>
               <h4 class="py-3">Hỗ trợ thanh toán</h4>
               <img alt="payment" src="{$arg.stylesheet}images/payment.png">
            </div>
         </div>
      </div>
   </div>
</footer>

<section id="helptool" class="d-none">
   <ul>
      <li><a href="">Hodine</a></li>
   </ul>
   <a></a>
</section>