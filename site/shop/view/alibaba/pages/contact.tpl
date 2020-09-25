<section class="S-2" id="S-99">
   <div class="container">
      <div class="title fz-22 border border-bottom-0 px-3 py-1">
         Thông tin liên hệ
      </div>
      <div class="border">
         <div class="row p-40">
            <div class="col-lg-4 col-12 border-right text-center">
               <div class="mb-2 text-center">
                  <img class="d-inline-block" height=80" src="{$page.logo_custom_img}">
               </div>
               <div class="fz-16 pb-1">
                  <h3 class="fz-16">{$page.name}</h3>
                  <p>{if $info_page_location}{$info_page_location.name}{/if}</p>
               </div>
            </div>
            <div class="col-md-8 col-12">
               <table class="w-100">
                    <tr class="d-flex py-1">
                     <td class="d-flex-2 text-right text-muted fz-12">Điện thoại :</td>
                     <td class="d-flex-8 fz-12 pl-2">{if $page.isphone eq 1}{$option.contact.phone}{else if $info_page_location}{$info_page_location.phone}{else}{$page.phone}{/if}</td>
                  </tr>
                    <tr class="d-flex py-1">
                     <td class="d-flex-2 text-right text-muted fz-12">Email :</td>
                     <td class="d-flex-8 fz-12 pl-2">{if $page.isphone eq 1}{$option.contact.email}{else if $info_page_location}{$info_page_location.email}{else}{$page.email}{/if}</td>
                  </tr>
                  <tr class="d-flex py-1">
                     <td class="d-flex-2 text-right text-muted fz-12">Địa chỉ :</td>
                     <td class="d-flex-8 fz-12 pl-2">{if $info_page_location}{$info_page_location.address}{else}{$page.address}{/if}</td>
                  </tr>
                  <tr class="d-flex py-1">
                     <td class="d-flex-2 text-right text-muted fz-12">Quốc gia / khu vực:</td>
                     <td class="d-flex-8 fz-12 pl-2">{if $page.nation_id eq 0}Việt Nam{else}{$page.nation}{/if}</td>
                  </tr>
                  {if $page.nation_id eq 0}
                   <tr class="d-flex py-1">
                     <td class="d-flex-2 text-right text-muted fz-12">Thành phố:</td>
                     <td class="d-flex-8 fz-12 pl-2">{if $info_page_location}{$info_page_location.province}{else}{$page.province}{/if}</td>
                  </tr>
                  {/if}
               </table>
               <div class="pt-4 pl-4">
                  <a class="btn btn-custom text-white" href="{$page.page_contact}"><i class="fa fa-envelope pr-1"></i>Liên hệ nhà cung cấp</a>
                  <a class="btn btn-custom-1 px-4" href="{$a_main_menu.product_list}">Đặt hàng</a>
                   <a class="btn btn-warning px-4 font-weight-bold" href="{if $page.isphone eq 1}{$option.contact.phone}{else}{$page.phone}{/if}" style="color:#000"><i class="fa fa-phone fa-fw"></i>{if $page.isphone eq 1}{$option.contact.phone}{else}{$page.phone}{/if}</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<section class="S-2 mt-4">
   <div class="container">
      <div class="title fz-22 border border-bottom-0 px-3 py-1">
         Thông tin liên hệ công ty
      </div>
      <div class="border">
         <div class="row p-40">
            <div class="col-12">
               <table class="w-100">
                  <tr class="d-flex py-1">
                     <td class="d-flex-2 pr-4 text-right text-muted fz-12 font-weight-bold"><img src="{$arg.stylesheet}images/ic-22.png" class="align-top pr-1">Tên công ty:</td>
                     <td class="d-flex-8 fz-12">{$page.name}{if $info_page_location}({$info_page_location.name}){/if}</td>
                  </tr>
                 <tr class="d-flex py-1">
                     <td class="d-flex-2 pr-4 text-right text-muted fz-12 font-weight-bold"><img src="{$arg.stylesheet}images/ic-22.png" class="align-top pr-1">Địa chỉ:</td>
                     <td class="d-flex-8 fz-12">{if $info_page_location}{$info_page_location.address}{else}{$page.address}{/if}</td>
                  </tr>
                  <tr class="d-flex py-1">
                     <td class="d-flex-2 pr-4 text-right text-muted fz-12 font-weight-bold">Website:</td>
                     <td class="d-flex-8 fz-12">{$page.website}</td>
                  </tr>
                  <tr class="d-flex py-1">
                     <td class="d-flex-2 pr-4 text-right text-muted fz-12 font-weight-bold">Website on DaiSan :</td>
                     <td class="d-flex-8 fz-12"></td>
                  </tr>
               
               </table>
            </div>
         </div>
      </div>
   </div>
</section>