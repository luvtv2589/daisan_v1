<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="application/xhtml+xml">
<base href="{$arg.domain}">
<title>{$metadata.title|default:$page.name}</title>
<meta name="keywords" content="{$metadata.keyword|default:$page.name}" />
<meta name="description" content="{$metadata.description|default:$page.name}" />
<meta name="robots" content="INDEX,FOLLOW"/>
<meta name="revisit-after" content="1 days" />
<meta property="og:image" content="{$metadata.image|default:''}" />

<!-- Bootstrap -->
<link href="{$arg.stylesheet}css/bootstrap.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/font-awesome.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/pnotify.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/animate.min.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/custom.css" rel="stylesheet">
<link href="{$arg.stylesheet}css/style.css" rel="stylesheet">
<link href="{$arg.stylesheet}/css/owl.carousel.min.css"  rel="stylesheet">
<link href="{$arg.stylesheet}css/owl.theme.default.min.css"  rel="stylesheet">

<link href="{$page.logo_img}" rel="shortcut icon" type="image/x-icon">
<script src="{$arg.stylesheet}js/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/popper.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/bootstrap.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/pnotify.min.js" type="text/javascript"></script>
<script src="{$arg.stylesheet}js/owl.carousel.min.js"></script>
<script>
var arg = '{$js_arg}';
var router = "{$out.router|default:'search'}";
</script>
<script src="{$arg.stylesheet}js/custom.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	{include file='../includes/header.tpl'}
	<section>
		{include file=$content}
	</section>

	{include file='../includes/footer.tpl'}

</body>
</html>
<script>
    $(document).ready(function(){
        $('#S-1 .owl-carousel').owlCarousel({
            loop:true,
            margin:10,
            nav:false,
            dots:false,
            responsive:{
                0:{
                    items:3
                },
                600:{
                    items:3
                },
                1000:{
                    items:4
                }
            }
        });
        
         
           $('#S-6 .owl-carousel').owlCarousel({
            loop:true,
            margin:10,
            nav:true,
            navText:["<i class='fa fa-caret-left'></i>","<i class='fa fa-caret-right'></i>"],
            navClass:['owl-prev','owl-next'],
            dots:false,
            responsive:{
                0:{
                    items:1
                },
                600:{
                    items:1
                },
                1000:{
                    items:1
                }
            }
        });
           
        var height = $("header").height();
        $(window).scroll(function() {
          if($(window).scrollTop() >  height){
            $("#bot").addClass('fixed-top').addClass('border-bottom');
          }
          else{
            $("#bot").removeClass('fixed-top').removeClass('border-bottom');
          }
        });
        var height2 = $("header").height() + $("#carouselExampleIndicators").height() +$("#S-1").height()+$("#S-2").height()+$("#S-3").height()+$("#S-4").height();
        console.log(height2);
        var height3 = $("header").height() + $("#carouselExampleIndicators").height() +$("#S-1").height()+$("#S-2").height()+$("#S-3").height()+$("#S-4").height() +$("#S-5").height() ;
        console.log(height3);
         $(window).scroll(function() {
          if($(window).scrollTop() <  height2){
            $("#S-5 .icon").removeClass('fade-in');
          }
          else if($(window).scrollTop() >  height3){
            $("#S-5 .icon").removeClass('fade-in');
          }
          else{
            $("#S-5 .icon").addClass('fade-in');
          }
        });
    });
</script>