<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<?php $link_url = 'https://'. $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; $array_link_url = explode('?', $link_url); ?>
<link rel="canonical" href="<?php echo $array_link_url[0]; ?>" />


<meta property="og:url" content="<?php echo $link_url; ?>" />
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:image" content="<?php echo $thumb_fb; ?>">
<meta property="og:description" content="<?php echo $description; ?>">
<meta property="og:site_name" content="<?php echo $title; ?>" /> 
<meta property="og:type" content="article" />
<meta property="og:image:width" content="400">
<meta property="og:image:height" content="400">

<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/font/fonts.css" rel="stylesheet" type="text/css" />
<!-- <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet"> -->

<link href="catalog/view/theme/default/stylesheet/css/main.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/css/tab-group.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/css/custom.css" rel="stylesheet">
<!-- <link href="catalog/view/theme/default/stylesheet/css/truong.css" rel="stylesheet" type="text/css" /> -->


<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<script src="catalog/view/javascript/common_18012022.js" type="text/javascript" ></script>
<script src="catalog/view/theme/default/stylesheet/js/slick/slick.js" type="text/javascript" ></script>

<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<style>
    :root {
        --main-color: #ed3237;
        --main-coloreb: #ed3237eb;
        --main-color47: #ed323747;
        
        --second-color: #c32d31;
        --second-color99: #c32d3199;
    }
    body{
        font-size: inherit;
        background-color: transparent;
    }
    i.fa{
        font-family: FontAwesome !important;
    }

    .global-search-bar-container-mob.js-search-bar-container{
        left: 60%;
    }
    
    .theme-blue-mid .card-column, .theme-blue-rich .card-column{
        background: var(--main-coloreb);
    }
    .hero-banner-slider .slick-next, .hero-banner-slider .slick-prev{
        border: 2px solid var(--second-color);
    }
    .hero-banner-slider .slick-next:before, .hero-banner-slider .slick-prev:before{
        border-top: 2px solid var(--second-color);
        border-right: 2px solid var(--second-color);
    }
    .header .logo-link img{
        height: auto;
    }
    .main-navigation__main-item.has-submenu .expand-icon:after{
        border: solid var(--main-coloreb);
        border-width: 0 2px 2px 0;
    }
    .global-inactive-bg, .js-off-canvas-overlay{
        background: var(--second-color99);
    }
    .hero-banner-slider .slick-dots .slick-active button:before{
        border-color: var(--main-color);
    }
    .hero-banner-slider.slick-slider > div, .slick-initialized .slick-slide > div{
        height: 100%;
    }
    .hero-banner-standard.theme-blue-rich{
        height: 100%;
    }
    .hero-banner-standard .card{
        height: 100%;
    }
    .browse-products__products-list .slick-slide{
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    .main-navigation .submenu-navigation__group-title img{
        -webkit-backface-visibility: hidden;
        -ms-transform: translateZ(0);
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
    }

    .wishlist__total{
        display: none;
    }
    .header .global-search-bar-container-mob .view-all-search-icon{
        background: transparent;
    }
    .v-selectbox__options .ps-container{
        overflow-y: auto;
        margin-right: 10px;
    }
    /* width */
    .v-selectbox__options .ps-container::-webkit-scrollbar {
        width: 5px;
    }

    /* Track */
    .v-selectbox__options .ps-container::-webkit-scrollbar-track {
        background: transparent; 
        transition: all 0.5s;
    }
    /* Track on hover */
    .v-selectbox__options .ps-container::-webkit-scrollbar-track:hover {
        background: #f0f0f0; 
    }
     
    /* Handle */
    .v-selectbox__options .ps-container::-webkit-scrollbar-thumb {
        background: #ced5db; 
        transition: all 0.5s;
    }
    .v-selectbox__options .ps-container::-webkit-scrollbar-thumb:hover {
        background: #b5c0c9;
    }
    body.common-home .hero-banner-standard .card-content-wrapper .heading{
        font-size: inherit;
    }
    body.common-home .hero-banner-standard .card-content-wrapper .heading p{
        color: #fff;
        line-height: normal;
    }
    body.common-home .hero-banner-standard .card-content-wrapper .heading p *{
        line-height: normal;
    }
    
    .product-card-hover.-anchor .product-card-hover-btn-group{
        top: 50%;
        transform: translate(-50%, -50%);
    }
    .productcardblock .stock-subscription__add-to-cart-btn{
        margin: 0;
        visibility: visible;
    }
    body.active-overlay{
        position: relative;
        overflow-y: hidden;
    }

    body.common-home .flex-direction-column .textimageblock:nth-child(2n){
        padding-left: 5px;
    }
    body.common-home .flex-direction-column .textimageblock:nth-child(2n-1){
       padding-right: 5px;
    }
    .flex-direction-column .textimageblock a.cta-link-icon:hover{
        color: var(--main-color);
    }

    .main-navigation .submenu-navigation__group-title{
        min-height: 54px;
        height: auto;
    }

    .breadcrumb{
        margin: 9px auto;
        background-color: transparent;
        padding-left: 0;
        padding-right: 0;
    }
    .breadcrumb li a{
        font-weight: bold;
        font-size: 14px;
    }
    .breadcrumb li:last-child a{
        font-weight: normal;
    }
    .breadcrumb>li+li:before{
        color: var(--main-color);
        font-weight: bold;
    }
    #content > h1{
        margin: 30px 0;
    }
    .information-thread #content > h1{
        margin: 0;
    }
    #content{
        margin-bottom: 30px;
    }
    .btn-primary{
        background-color: var(--main-color);
        border-color: var(--main-color);
    }
    .btn-primary:hover,
    .btn-primary.focus,
    .btn-primary:focus{
        background-color: var(--second-color) !important;
        border-color: var(--second-color) !important;
    }
    .main-navigation .main-navigation__main-item{
        /*position: relative;*/
    }
    .main-navigation .main-navigation__main-item .list_submenu{
        left: auto;
        transform: none;
    }
    .main-navigation .main-navigation__main-item .list_submenu .submenu-navigation-item{
        position: relative;
    }
    .main-navigation .main-navigation__main-item .list_submenu .submenu-navigation-item > a{
        display: block;
        width: 100%;
    }
    
    .main-navigation .main-navigation__main-item .list_submenu .list_submenu{
        top: 0;
        left: calc(100% + 15px);
    }
    .main-navigation .main-navigation__main-item .list_submenu .list_submenu:after{
        top: 22px;
        left: 0;
    }
    .js_product-list-item_wrap-3 .col{
        position: static;
    }
    .shorting-container .d2c-shorting{
        display: block;
    }
    #input-sort{
        width: auto;
        border: 1px solid black;
        box-shadow: none;
        font-weight: bold;
        color: black;
        display: inline-block;
        min-width: auto;
        max-width: inherit;
        margin: 0 !important;
        padding: 5px 15px;
        padding-right: 25px;
        height: auto;
        font-size: 16px;
    }
    button.d2c-shorting_btn.js_d2c-shorting_btn{
        padding: 0;
    }
    button.d2c-shorting_btn.js_d2c-shorting_btn:hover{
        opacity: 1;
    }
    .product-list-item .btn-group{
        margin-top: 5px;
    }

    .bf-panel-wrapper .box.bf-check-position{
        border: 0;
    }
    .bf-panel-wrapper .box.bf-check-position .box-heading{
        text-transform: uppercase;
        position: relative;
        display: flex;
        padding: 15px;
        width: 100%;
        text-align: left;
        line-height: 26px;
        border: none;
        margin-top: 0;
        font-size: 1.25rem;
        max-width: 100%;
        border-radius: 2px;
        background: 0 0;
        bottom: 0;
        justify-content: space-between;
        padding: 0 0 15px;
        border: 0;
        font-weight: bold;
        color: var(--main-color);
    }
    .bf-attr-block-cont{
        padding: 0;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-attr-header{
        padding: 0;
        color: var(--main-color);
        font-size: .875rem !important;
        font-weight: 600;
        position: relative;
        text-transform: uppercase;
        cursor: pointer;
        font-size: 1rem;
        line-height: 17px;
        padding-right: 1.41em;
        border: 0;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-attr-header .bf-arrow{
        position: absolute;
        content: "";
        width: 14px;
        height: 2px;
        top: calc(50% - 1px);
        right: 0;
        background-color: var(--main-color);
        background-image: none;
        padding: 0;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-attr-header .bf-arrow.openq:before{
        position: absolute;
        content: "";
        width: 2px;
        height: 14px;
        top: calc(50% - 7px);
        right: 6px;
        background-color: var(--main-color);
    }
    .bf-panel-wrapper .box.bf-check-position .bf-attr-block{
        border-bottom: 1px solid #dfe7ea;
        padding: 20px 0;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-cell{
        border: 0 !important;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-cell input{
        border: 1px solid var(--main-color);
        height: 22px;
        width: 22px;
        border-radius: 2px;
        padding: 10px;
        position: relative;
        align-self: center;
        top: 0;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-cell label{
        font-weight: normal;
        padding-left: 5px;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-cell.bf-c-3{
        display: none;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-buttonclear-box{
        padding: 20px 0;
    }
    p.bf-empty-product-list-msg{
        padding: 15px;
    }
    .bf-panel-wrapper .box.bf-check-position .bf-buttonclear-box input:hover{
        opacity: .7;
    }


    .row_pagination{
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        padding: 15px 0;
    }
    .pagination{
        margin: 0;
    }
    .pagination>.active>a, 
    .pagination>.active>a:focus, 
    .pagination>.active>a:hover, 
    .pagination>.active>span, 
    .pagination>.active>span:focus, 
    .pagination>.active>span:hover{
        background-color: var(--main-color);
        border-color: var(--main-color);
    }
    .pagination>li>a, 
    .pagination>li>span{
        color: var(--main-color);
    }
    .pagination>li>a:focus, 
    .pagination>li>a:hover, 
    .pagination>li>span:focus, 
    .pagination>li>span:hover{
        color: var(--second-color);
    }
    .bf_reset_mobile{
        display: none;
    }
    
    .sticky-support-block{
        bottom: 30px;
        z-index: 9;
    }
    body.bf-non-scrollable .header{
        z-index: 9;
    }

    .text_totalproduct{
        display: none;
    }
    .shorting.row.row_pagination .text-left{
        display: none;
    }
    .shorting.row.row_pagination .text-right{
        width: 100%;
        max-width: 100%;
        flex: 0 0 100%;
        font-weight: bold;
    }
    .shorting.row.row_pagination .text-right span{
        display: none;
    }
    .shorting.row.row_pagination .text-right span.totalproduct{
        display: block;
    }
    .shorting.row.row_pagination .text-right span.totalproduct .text_totalproduct{
        display: inline-block;
        margin-left: 5px;
    }
    #reviews{
        clear: both;
        padding-top: 30px;
    }
    #reviews h2{
        padding-bottom: 15px;
    }
    #reviews .testfreaks .article{
        display: flex;
        flex-wrap: wrap;
        border: 0;
    }
    #reviews .testfreaks .read-more, .testfreaks .article .content{
        margin: 0 !important;
        width: calc(100% - 180px);
        max-width: 100% !important;
    }
    #reviews .testfreaks .tf-tabs-panel{
        border-bottom: 1px solid #eeeeee;
        padding-bottom: 15px;
    }
    #reviews tbody tr:nth-child(2n){
        background: transparent;
    }
    #form-review{
        clear: both;
    }
    .testfreaks-reviews{
        padding: 15px !important;
    }
    #tab-review{
        padding: 15px;
        padding-top: 30px;
    }
    #tab-review .form-horizontal .form-group{
        margin-bottom: 0;
    }
    #tab-review .buttons{
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-end;
    }
    #tab-review .alert{
        margin-top: 15px;
    }
    #tab-review h2{
        padding-bottom: 15px;
    }
    #d_quickcheckout label{
        padding-top: 0;
    }
    .qc-checkout-product .form-horizontal .form-group{
        display: flex;
        flex-wrap: wrap;
        align-items: center;
    }
    .qc-checkout-product .form-horizontal .input-group{
        display: flex;
        width: 100%;
    }
    .qc-checkout-product .form-horizontal .input-group input{
        width: 100%;
    }
    .qc-checkout-product .form-horizontal .input-group .input-group-btn{
        display: inline-flex;
        width: auto;
    }


    .table_checkout_cart thead tr td,
    #d_quickcheckout .qc-cart thead tr td{
      vertical-align: middle;
      font-weight: bold;
      border: 0;
      background: #f9f9f9;
    }
    .table_checkout_cart tbody tr td,
    #d_quickcheckout .qc-cart tbody tr td{
      vertical-align: middle;
      border: 0;
    }
    .table_checkout_cart tbody tr td img{
      border: 0;
    }
    .table_checkout_cart tbody tr td .block_input_quantity{
      display: flex;
      flex-wrap: wrap;
      align-items: center;
    }
    .table_checkout_cart tbody tr td .block_input_quantity .input-group-btn{
      display: flex;
      white-space: inherit;
      font-size: 15px;
    }
    .table_checkout_cart tbody tr td .block_input_quantity .input-group-btn button{
      padding: 10px 15px;
      line-height: normal !important;
    }
    .table_checkout_cart tbody tr td .input_quantity{
      margin-right: 15px;
      max-width: 100px !important;
      width: 100px !important;
    }
    #d_quickcheckout .qc-cart tbody tr,
    .table_checkout_cart tbody tr{
      border-bottom: 1px solid #ededed;
    }
    #d_quickcheckout .qc-cart tbody tr:nth-child(2n),
    .table_checkout_cart tbody tr:nth-child(2n){
      background: #f9f9f9;
    }
    #d_quickcheckout .qc-cart tbody tr:last-child,
    .table_checkout_cart tbody tr:last-child{
      border-bottom: 0;
    }
    #d_quickcheckout .qc-cart .qc-quantity .qc-product-qantity::-webkit-outer-spin-button,
    #d_quickcheckout .qc-cart .qc-quantity .qc-product-qantity::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    .form-control{
        display: block;
        box-sizing: border-box;
        width: 100%;
        max-width: 100%;
        height: 2.4375rem;
        margin: 0 0 1rem;
        padding: .5rem;
        border: 1px solid #cacaca;
        border-radius: 0;
        background-color: #fff;
        font-family: inherit;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        appearance: none;
        color: black;
    }
    .form-group.required label:after{
        content: "*";
        color: red;
    }
    .login-form h2{
        font-size: 32px;
        margin-bottom: 30px;
    }
    body.account-account h2{
        text-align: left;
    }
    .blog-listing-page__card-item-content a{
        margin-bottom: 15px;
        font-size: 18px;
    }
    .blog-listing-page.js_blog-listing-page{
        padding: 0;
    }
    .news-title{
        margin: 30px 0;
    }
    .news-title h1{
        font-size: 2rem;
    }
    .news-title .news-post-date{
        text-align: center;
        font-size: .75rem;
        margin-top: 15px;
        font-weight: bold;
    }
    #description{
        clear: both;
        position: relative;
    }
    #description .content_description{
        border: 1px solid #ddd;
        border-top: 0;
        padding: 15px;
        height: 400px;
        overflow: hidden;
        transition: 1s;
    }
    #description .content_description.full_xemthem{
        height: auto;
    }
    #description .content_description.have_padding{
        padding-bottom: 54px;
    }

    #description h1{
        font-size: 2.5rem;
    }
    #description h2{
        font-size: 2rem;
    }
    #description h3{
        font-size: 1.5rem;
    }
    #description h4{
        font-size: 1.25rem;
    }
    #description h5{
        font-size: 1rem;
    }
    #description h6{
        font-size: 0.75rem;
    }
    #description h1,
    #description h2,
    #description h3,
    #description h4,
    #description h5,
    #description h6,
    #description p{
        margin-bottom: 15px;
    }
    #description h1,
    #description h2,
    #description h3,
    #description h4,
    #description h5,
    #description h6,
    #description p,
    #description a,
    #description span,
    #description li{
        text-align: left;
        color: #333;
    }
    #description ul,
    #description ol{
        margin-left: 30px;
        margin-bottom: 15px;
    }
    #description .testfreaks ul{
        margin: 0;
    }
    #description .testfreaks ul li{
        color: var(--main-color);
    }
    #description .xemthem_description{
        cursor: pointer;
        width: 100%;
        position: absolute;
        bottom: 0;
        left: 0;
        z-index: 1;
        background-image: linear-gradient(#ffffff, #eeeeee);
        color: black;
        padding: 15px;
        text-align: center;
        transition: all 0.3s;
    }
    #description .xemthem_description:hover{
        background-image: linear-gradient(#ffffff, #eeeeee, #eeeeee);
        color: var(--main-color);;
    }
    .opacity0{
        opacity: 0;
    }

    .sale-off-sticky__sticker-ribbon--sale,
    .product-details_heading-image .sale-off-sticky__sticker-ribbon--sale{
        background: var(--main-color) !important;
    }
    .sale-off-sticky__sticker-ribbon--sale:before,
    .product-details_heading-image .sale-off-sticky__sticker-ribbon--sale:before{
        border-color: var(--main-color) var(--main-color) var(--main-color) transparent !important;
    }
    .sale-off-sticky__sticker-ribbon--sale:after,
    .product-details_heading-image .sale-off-sticky__sticker-ribbon--sale:after{
        border-color: var(--main-color) transparent var(--main-color) var(--main-color) !important;
    }

    
    @media (min-width: 769px) and (max-width: 1024px){
        .d2c-shorting.js_d2c-shorting h2.product-filter_title.js_product-filter_title{
            display: none;
        }
        .shorting-container{
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            margin-top: 30px;
        }
        .shorting-container .shorting-block{
            width: 50% !important;
        }
        .shorting.row.row_pagination .text-right{
            text-align: left;
        }
        .shorting-container .d2c-shorting{
            position: relative;
            border: 0;
            width: 50%;
        }
        .d2c-shorting.js_d2c-shorting > div{
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
        }
        .shorting.row.row_pagination{
            padding: 0;
            margin: 0;
        }
        #column-left{
            margin-top: 30px;
        }
        .add-to-cart-modal__btn-group{
            width: 100%;
        }
    }
    @media (min-width: 768px){
        .browse-products__products-list.slick-slider {
            padding-right: 0;
        }
    }
    @media (max-width: 768px){
        .global-search-bar-container-mob.js-search-bar-container{
            left: 0;
        }
        .product-card-hover .product-card-hover-btn-group{
            position: relative;
            top: 0;
            transform: none;
            left: 0;
            width: 100%;
            max-width: 100%;
            margin-top: 15px;
        }
        .add-to-cart-modal__btn-group{
            width: 100%;
        }
        body.common-home .flex-direction-column .textimageblock:nth-child(2n){
            padding-left: 0;
        }
        body.common-home .flex-direction-column .textimageblock:nth-child(2n-1){
           padding-right: 0;
        }
        .main-navigation .main-navigation__main-item .list_submenu{
            left: 0;
            transform: translateX(120%);
        }
        .main-navigation .main-navigation__main-item .list_submenu.-active{
            transform: translateX(0);
        }
        .main-navigation .main-navigation__main-item .list_submenu .submenu-navigation-item{
            flex-wrap: wrap;
            width: 100%;
        }
        .main-navigation .main-navigation__main-item .list_submenu .list_submenu{
            transform: none !important;
            left: auto;
            top: auto;
            position: relative;
            border: 0;
            z-index: 0;
        }
        .main-navigation .main-navigation__main-item .list_submenu .list_submenu .submenu-navigation-item_link:before{
            content: "";
            width: 6px;
            height: 6px;
            border: solid var(--main-color);
            padding: 1px;
            position: absolute;
            transform: translateY(0) rotate(-45deg);
            top: 21px;
            display: block;
            border-width: 0 1px 1px 0;
            left: 38px;
        }
        .row_pagination *{
            text-align: center !important;
        }
        .pagination{
            margin: 15px 0;
        }
        .d2c-shorting.js_d2c-shorting{
            display: flex;
        }
        .d2c-shorting.js_d2c-shorting #input-sort{
            position: absolute;
            right: 0;
            opacity: 0;
        }
        .d2c-shorting.js_d2c-shorting > div{
            width: 50%;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
        }
        .d2c-shorting.js_d2c-shorting .d2c-shorting_title{
            padding-right: 25px;
        }
        .bf-panel-wrapper.bf-responsive .bf-btn-show{
            position: fixed;
            top: auto !important;
            bottom: 18px;
            left: 34px !important;
            opacity: 0;
        }

        .shorting.row_pagination {
            justify-content: flex-end;
            padding: 0;
        }
        .bf-panel-wrapper.bf-responsive{
            z-index: 10;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position {
            left: 0;
            width: 100% !important;
            margin: 0;
            box-shadow: none;
            top: 100% !important;
            z-index: 9999;
            padding: 15px;
            height: 100% !important;
            max-height: 100% !important;
            transition: all 1s;
            overflow: hidden;
        }
        .bf-panel-wrapper.bf-responsive.bf-opened .box.bf-check-position{
            top: 0 !important;
        }
        body.bf-non-scrollable{
            position: relative !important;
            top: 0 !important;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .box-heading{
            background: #dfe7ea;
            margin-left: -15px;
            margin-top: -15px;
            width: calc(100% + 30px);
            max-width: inherit;
            padding: 15px;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .box-heading .closebfmobile{
            position: absolute;
            right: 15px;
            top: 17px;
            background: url(catalog/view/theme/default/stylesheet/assets/images/icons/close-icon-red.svg) 50% no-repeat;
            width: 21px;
            height: 21px;
            display: block
        }
        .bf-panel-wrapper.bf-responsive a.bf-btn-reset{
            display: none !important;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .box-heading .lang_block_title{
            display: block;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .box-heading .lang_block_title:before{
            background: url(catalog/view/theme/default/stylesheet/css/default/icons/filter-icon.svg) 50%/cover no-repeat;
            width: 24px;
            height: 24px;
            display: inline-block;
            vertical-align: middle;
            margin-right: 8px;
            content: "";
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .box-content{
            height: calc(100% - 85px) ;
            overflow-y: auto;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .bf_reset_mobile{
            position: absolute;
            bottom: 0;
            width: 100%;
            z-index: 2;
            left: 0;
            padding: 15px;
            background: #fff;
            display: flex;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .bf_reset_mobile > a{
            width: 50%;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .bf_reset_mobile > a:first-child{
            margin-right: 7.5px;
        }
        .bf-panel-wrapper.bf-responsive .box.bf-check-position .bf_reset_mobile > a:last-child{
            margin-left: 7.5px;
        }
        .d2c-shorting{
            z-index: 9 !important;
        }
        .sticky-support-block{
            bottom: 77px;
        }
        .shorting.row.row_pagination .text-right span.totalproduct{
            text-align: right !important;
        }
        #reviews .testfreaks .read-more, .testfreaks .article .content{
            width: 100%;
        }
        .testfreaks-reviews{
            padding: 0 !important;
        }
        .testfreaks-reviews .tf-header,
        .testfreaks ul.tf-tabs{
            margin: 0 !important;
        }
        .complementary-products .product-list-item{
            padding-top: 0;
        }

        body.checkout-checkout #container{
            margin-top: 0;
        }
        footer .footer-widget h2.firt{
            padding: 13px 0 !important;
        }
        .table_responsive_checkout_cart{
            margin-left: 0;
            margin-right: 0;
            width: 100%;
            overflow: inherit;
            min-height: auto;
            margin-bottom: 15px;
        }
        .table_checkout_cart{
            width: 100% !important;
            margin-bottom: 0 !important;
            min-width: auto !important;
        }
        .table_checkout_cart thead{
            display: none;
        }
        .table_checkout_cart tbody{
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }
        .table_checkout_cart tbody tr{
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }
        .table_checkout_cart tbody tr td{
            width: 100% !important;
            white-space: inherit !important;
        }
          .table_checkout_cart tbody tr td.td_don_gia{
            display: none;
        }
        .table_checkout_cart tbody tr td.td_don_gia:before{
            content: "Đơn giá: ";
        }
        .table_checkout_cart tbody tr td.td_tong_cong{
            text-align: left;
        }
        .table_checkout_cart tbody tr td.td_tong_cong:before,
        .table_checkout_cart tbody tr td.qc-total:before{
            content: "Tổng cộng: ";
        }
        .table_checkout_cart tbody tr td.qc-image {
            width: 20% !important;
        }
        .table_checkout_cart tbody tr td.qc-name {
            width: 80% !important;
        }
        .table_checkout_cart tbody tr td.qc-quantity {
            padding-top: 0;
        }
        .table_checkout_cart tbody tr td.qc-quantity .input-group-btn .btn{
            width: 20px;
            height: 20px;
            padding: 0;
            font-size: 11px;
        }
        .table_checkout_cart tbody tr td.qc-total {
            display: none
        }
        .table_checkout_cart tbody tr td .don_gia_mobile{
            margin: 0;
        }
        .table_checkout_cart tbody tr td .don_gia_mobile:before{
            content: "Đơn giá: ";
        }
        .table_checkout_cart tbody tr td.qc-model{
            display: none;
        }
        #d_quickcheckout .qc-cart .qc-quantity .qc-product-qantity {
            height: 20px;
            width: 40px;
            padding: 0 4px !important;
            -moz-appearance: textfield;
        }
        #d_quickcheckout .qc-cart .qc-quantity > .input-group {
            display: inline-flex;
            flex-wrap: wrap;
            align-items: center;
        }
        #d_quickcheckout .qc-cart .qc-quantity span.input-group-btn {
            display: inline-flex;
            flex-wrap: wrap;
            width: auto;
        }
        #d_quickcheckout .qc-cart .qc-quantity span.input-group-btn button{
            margin: 0;
        }
        #d_quickcheckout .qc-cart .qc-name .qc-name-price small{
            font-size: 14px;
        }
        .blog-listing-page.js_blog-listing-page .js_blog-listing-page__card-item-wrapper{
            padding: 0;
        }
        #description .xemthem_description{
            left: 15px;
            width: calc(100% - 30px);
        }
    }
</style>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        
        // Hover menu desktop
        $('.js-menu-item').hover(
          function() {
            if($(window).width() >= 767){
                if($(this).find('.js-sub-menu').length !== 0) {
                    $(this).addClass("-active");
                    $(this).find('.js-sub-menu').addClass("-active");
                }
            }
          }, function() {
            if($(window).width() >= 767){
                $(this).removeClass("-active");
                $(this).find('.js-sub-menu').removeClass("-active");
            }
          }
        );
        // Hover menu desktop
        
        // Xử lý load ảnh
        $('body').find('img').each(function(index, el) {
            if($(this).attr('data-src')){
                $(this).attr('src', $(this).attr('data-src'));
                $(this).attr('io-loaded', 'true');
            }
            if($(window).width() < 767){
                if($(this).attr('data-src-mobile')){
                    $(this).attr('src', $(this).attr('data-src-mobile'));
                    $(this).attr('io-loaded', 'true');
                    $(this).closest('.img-bg-block').attr('style','background-image: url('+$(this).attr('data-src-mobile')+');background-position: center center;');
                }
            }else{
                if($(this).attr('data-src-desktop')){
                    $(this).attr('src', $(this).attr('data-src-desktop'));
                    $(this).attr('io-loaded', 'true');
                    $(this).closest('.img-bg-block').attr('style','background-image: url('+$(this).attr('data-src-desktop')+');background-position: center center;');
                }
            }
        });
        // Xử lý load ảnh

        // Xử lý sự kiện click
        window.onload = function(){
            document.onclick = function(e){
                console.log($(event.target).attr('class'));
                if($(event.target).attr('class')){

                    // Nút tìm kiếm
                    if(!$(event.target).attr('class').includes('js-search-input')) {
                        var divToHide = $('.js-search-bar-container');
                        if(divToHide.css('display') == 'block'){
                            divToHide.css('display','none');
                            if($(window).width() < 767){
                                $('.js-inactive-bg').addClass('hide');
                            }
                        }
                        if($(event.target).attr('class').includes('js-search-toggler') || $(event.target).closest('.js-search-toggler').length !== 0 || $(event.target).closest('.js-search-toggler-mobile').length !== 0){
                            //console.log(234);
                            divToHide.css('display','block');
                            if($(window).width() < 767){
                                $('.js-inactive-bg').removeClass('hide');
                            }
                        }
                    }
                    // Nút tìm kiếm


                    // Nút ngôn ngữ
                    if(!$(event.target).attr('class').includes('language-dropdown')) {
                        var divToHide = $('.language-dropdown');
                        if(divToHide.hasClass('show')){
                            divToHide.removeClass('show');
                            divToHide.closest('.language-selection').find('.language-selection__drop-btn-link').removeClass('show');
                            divToHide.closest('.language-selection').find('.hidden-arrow').removeClass('rotate180');
                        }
                        if($(event.target).attr('class').includes('language-selection') || $(event.target).closest('.language-selection').length !== 0){
                            //console.log(234);
                            divToHide.addClass('show');
                            divToHide.closest('.language-selection').find('.language-selection__drop-btn-link').addClass('show');
                            divToHide.closest('.language-selection').find('.hidden-arrow').addClass('rotate180');
                        }
                    }
                    // Nút ngôn ngữ


                    // Xử lý chọn khu vực
                    // Click vào menu xổ (Tỉnh/thành hoặc Quận/huyện)
                    if(!$(event.target).attr('class').includes('v-selectbox__selected')) {
                        $('.v-selectbox').removeClass('show');
                        $('.v-selectbox').find('.v-selectbox__options-container').removeClass('show').attr('style','');
                        $('.v-selectbox').find('.v-selectbox__options-container').find('.ps-container').removeClass('ps--active-y').attr('style','');
                    }
                    // Click vào menu xổ (Tỉnh/thành hoặc Quận/huyện)

                    // Click vào input search (Tỉnh/thành hoặc Quận/huyện)
                    if($(event.target).closest('.v-selectbox').length !== 0){
                        $('.v-selectbox').removeClass('show');
                        $('.v-selectbox').find('.v-selectbox__options-container').removeClass('show').attr('style','');
                        $('.v-selectbox').find('.v-selectbox__options-container').find('.ps-container').removeClass('ps--active-y').attr('style','');
                        var divToHide = $(event.target).closest('.v-selectbox');
                        if(divToHide.hasClass('show')){
                            divToHide.removeClass('show');
                            divToHide.find('.v-selectbox__options-container').removeClass('show').attr('style','');
                            divToHide.find('.v-selectbox__options-container').find('.ps-container').removeClass('ps--active-y').attr('style','');
                            $('body').attr('style','overflow: hidden; padding-right: 17px;');

                        }else{
                            var height_v_selectbox__options_container = $(window).height()*34/100;
                            var height_ps_container = height_v_selectbox__options_container-$('.v-selectbox__search-input').outerHeight();
                            divToHide.addClass('show');
                            divToHide.find('.v-selectbox__options-container').addClass('show').attr('style','height:'+height_v_selectbox__options_container+'px');
                            divToHide.find('.v-selectbox__options-container').find('.ps-container').addClass('ps--active-y').attr('style','height:'+height_ps_container+'px');
                            // divToHide.find('.v-selectbox__search-input').focus();
                        }
                    }
                    // Click vào input search (Tỉnh/thành hoặc Quận/huyện)

                    // Click chọn option (Tỉnh/thành hoặc Quận/huyện)
                    if($(event.target).attr('class').includes('v-selectbox__option')){
                        var value = $(event.target).html();

                        // data_value là id Tỉnh/thành
                        if($(event.target).closest('.js_option_country').length !== 0){
                            var data_value = $(event.target).attr('data-value');
                        }else{
                            var data_value = $('.js_option_country').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
                        }

                        // data_value_zone là id Quận/huyện
                        if($(event.target).closest('.js_option_zone').length !== 0){
                            var data_value_zone = $(event.target).attr('data-value');
                        }else{
                            data_value_zone = $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
                        }
                        //console.log(data_value);

                        // Xử lý các HTML/CSS
                        $('.v-selectbox__option').removeClass('selected');
                        $(event.target).addClass('selected');
                        $(event.target).closest('.v-selectbox').removeClass('error');
                        $(event.target).closest('.v-selectbox').find('.v-selectbox__error').remove();
                        $(event.target).closest('.v-selectbox').find('.v-selectbox__selected').html(value).attr('data-value', data_value);
                        $(event.target).closest('.v-selectbox').find('.v-selectbox__search-input').val('');
                        js_search_input_country($(event.target).closest('.v-selectbox').find('.v-selectbox__search-input'));
                        $('.v-selectbox').removeClass('show');
                        $('.v-selectbox').find('.v-selectbox__options-container').removeClass('show').attr('style','');
                        $('.v-selectbox').find('.v-selectbox__options-container').find('.ps-container').removeClass('ps--active-y').attr('style','');
                        // Xử lý các HTML/CSS

                        // Gọi các option Quận/huyện phù hợp với Tỉnh/thành vừa chọn
                        var action = 'index.php?route=common/footer/v_selectbox__option';
                        $.ajax({
                            url: action,
                            type: 'POST',
                            data: {
                                'country_id': data_value,
                            },
                            dataType: 'json',
                            success: function(json) {
                                //console.log(json);
                                $('.v-selectbox__options').find('.js_option_zone').html('');
                                var html = '';
                                var flag_luachonquanhuyen = 0;
                                var zone_name_selected = '';
                                $.each( json, function( key, value ) {
                                    if(value['zone_id'] == data_value_zone){
                                        html += '<div data-value="'+value['zone_id']+'" class="v-selectbox__option selected">'+value['name']+'</div>';
                                        flag_luachonquanhuyen = 1;
                                        zone_name_selected = value['name'];
                                    }else{
                                        html += '<div data-value="'+value['zone_id']+'" class="v-selectbox__option">'+value['name']+'</div>';
                                    }
                                });
                                $('.v-selectbox__options').find('.js_option_zone').html(html);
                                if(flag_luachonquanhuyen == 1){
                                    $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value', data_value_zone).html(zone_name_selected);
                                }else{
                                    $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value', '').html('<?php echo $text_luachonquanhuyen; ?>');
                                }
                                
                            },
                            error: function(xhr, status, error){
                                console.log(error);
                            },
                        });
                        // Gọi các option Quận/huyện phù hợp với Tỉnh/thành vừa chọn

                        // Gán class selected lại cho option Tỉnh/thành
                        $('.js_option_country').find('.v-selectbox__option').each(function(index, el) {
                            if($(this).attr('data-value') == data_value){
                                $(this).addClass('selected');
                            }
                        });
                        // Gán class selected lại cho option Tỉnh/thành
                    }
                    // Click chọn option (Tỉnh/thành hoặc Quận/huyện)
                    // Xử lý chọn khu vực
                }
            };
        };
        // Xử lý sự kiện click

        // $('.js-search-toggler').click(function(event) {
        //     $('.js-search-bar-container').css('display','block');
        // });

        // Xử lý menu mobile
        $('.js-mobile-menu').click(function(event) {
            $(this).closest('.js-navigation-wrapper').find('.js-mobile-menu-close').removeClass('hide');
            $(this).closest('.js-navigation-wrapper').find('.js-menu-container').addClass('-active');
            $(this).closest('.js-navigation-wrapper').find('.js-off-canvas-overlay').addClass('is-visible').addClass('is-closable');
            $('.js-off-canvas-overlay').addClass('is-visible').addClass('is-closable');
            $('body').addClass('active-overlay');
        });

        $('.js-mobile-menu-close').click(function(event) {
            $(this).addClass('hide');
            $(this).closest('.js-navigation-wrapper').find('.js-menu-container').removeClass('-active');
            $(this).closest('.js-navigation-wrapper').find('.js-off-canvas-overlay').removeClass('is-visible').removeClass('is-closable');
            $('body').removeClass('active-overlay');
        });

        $('.js-off-canvas-overlay').click(function(event) {
            $(this).closest('.js-navigation-wrapper').find('.js-mobile-menu-close').addClass('hide');
            $(this).closest('.js-navigation-wrapper').find('.js-menu-container').removeClass('-active');
            $(this).removeClass('is-visible').removeClass('is-closable');
            $('body').removeClass('active-overlay');
        });

        $('.js-menu-item .expand-icon').click(function(event) {
            $(this).closest('.js-menu-item').find('.js-sub-menu').addClass('-active');
        });
        $('.js-menu-item a.main-navigation__main-item-link').click(function(event) {
            if($(this).closest('.js-menu-item').find('.js-sub-menu').length !== 0){
                $(this).closest('.js-menu-item').find('.js-sub-menu').addClass('-active');
                return false;
            }
        });

        $('.js-sub-menu-title').click(function(event) {
            $(this).closest('.js-sub-menu').removeClass('-active');
        });
        // Xử lý menu mobile


        // Xử lý tab
        $('.js-tab-group-title').click(function(event) {
            var tab_target = $(this).attr('tab-target');
            $(this).closest('.js-tab-group').find('.js-tab-group-title').removeClass('-active');
            $(this).closest('.js-tab-group').find('.js-tab-item').addClass('overflow-y-hidden').addClass('height-0');
            $(this).addClass('-active');
            $(this).closest('.js-tab-group').find('.'+tab_target).removeClass('overflow-y-hidden').removeClass('height-0');
        });
        // Xử lý tab

        // Xử lý menu footer
        $('.accordion-item-mobile a').click(function(event) {
            if($(this).parent('').find('.menu-group').find('li').length !== 0){
                if($(this).closest('.accordion-item-mobile').hasClass('is-active')){
                    $(this).closest('.accordion-item-mobile').removeClass('is-active');
                }else{
                    $(this).closest('.accordion-item-mobile').addClass('is-active');
                }
                $(this).closest('.accordion-item-mobile').find('.accordion-content-mobile').slideToggle();
                return false;
            }
        });
        // Xử lý menu footer


        // Xử lý chọn khu vực
        $('.js_select-location').click(function(event) {
            $('.select-location-modal').attr('style', '');
            $('body').attr('style','overflow: hidden; padding-right: 17px;');
        });
        $('.v-modal__backdrop').click(function(event) {
            $(this).closest('.v-modal').attr('style', 'display:none;');
            $('body').attr('style','');
        });
        $('.v-modal__close-btn').click(function(event) {
            $(this).closest('.v-modal').attr('style', 'display:none;');
            $('body').attr('style','');
        });
        $('.add-to-cart-modal__continue-shopping').click(function(event) {
            $(this).closest('.v-modal').attr('style', 'display:none;');
            $('body').attr('style','');
        });

        // Submit chọn khu vực
        $('.select-location-modal__form-submit-btn').click(function(event) {
            $('.v-selectbox__error').remove();
            flag_error = 0;
            var input_js_option_country = $('.js_option_country').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
            if(!input_js_option_country){
                $('.js_option_country').closest('.v-selectbox').addClass('error').find('.v-selectbox__selected').after('<div class="v-selectbox__error"><?php echo $text_batbuocnhap; ?></div>');
                flag_error = 1;
            }
            var input_js_option_zone = $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
            if(!input_js_option_zone){
                $('.js_option_zone').closest('.v-selectbox').addClass('error').find('.v-selectbox__selected').after('<div class="v-selectbox__error"><?php echo $text_batbuocnhap; ?></div>');
                flag_error = 1;
            }
            if(flag_error == 0){
                // alert('ok');
                setCookie('select_country',input_js_option_country,(30*24*60*60*1000));
                setCookie('select_zone',input_js_option_zone,(30*24*60*60*1000));
                location.reload();
            }
            return false;
        });
        // Submit chọn khu vực

        // Xử lý gọi khu vực khi đã có cookie
        if(!empty(getCookie('select_country')) && !empty(getCookie('select_zone'))) {
            $('.js_option_country').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value', getCookie('select_country'));
            $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value', getCookie('select_zone'));
            js_search_input_country($('.js_option_country').closest('.v-selectbox').find('.v-selectbox__search-input'));
            js_search_input_zone($('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__search-input'));

            $(window).load(function() {
                var value_name_country = '';
                var value_name_zone = ''; 

                // setTimeout cho mobile
                setTimeout(function() {
                    $('.js_option_country').find('.v-selectbox__option').each(function(index, el) {
                        if($(this).attr('data-value') == getCookie('select_country')){
                            value_name_country = $(this).html();
                        }
                    });
                    $('.js_option_country').closest('.v-selectbox').find('.v-selectbox__selected').html(value_name_country);

                    $('.js_option_zone').find('.v-selectbox__option').each(function(index, el) {
                        if($(this).attr('data-value') == getCookie('select_zone')){
                            value_name_zone = $(this).html();
                        }
                    });
                    $('.js_option_zone').closest('.v-selectbox').find('.v-selectbox__selected').html(value_name_zone);

                    $('.js-head-nav__select-location-text').html(value_name_country + '/' + value_name_zone).closest('.js_select-location').removeClass('d-none');
                    
                }, 100);
                // setTimeout cho mobile
            });
            
        }else{
            $('.js-head-nav__select-location-text').html('<?php echo $text_chonvitricuaban; ?>').closest('.js_select-location').removeClass('d-none');
        }
        // Xử lý gọi khu vực khi đã có cookie
        // Xử lý chọn khu vực

        // Hover product card
        $('.js-product-card-hover').hover(
          function() {
            if($(window).width() >= 767){
                $(this).addClass('-anchor');
                if($(this).find('.js-product-card-hove-btn-group').length !== 0) {
                    $(this).find('.js-product-card-hove-btn-group').removeClass("hide-for-large");
                }
            }
          }, function() {
            if($(window).width() >= 767){
                $(this).removeClass('-anchor');
                if($(this).find('.js-product-card-hove-btn-group').length !== 0) {
                    $(this).find('.js-product-card-hove-btn-group').addClass("hide-for-large");
                }
            }
          }
        );
        // Hover product card


        // Xử lý wishlist
        <?php if($get_wishlist) { ?>
        var array_get_wishlist = [];
        <?php foreach ($get_wishlist as $key_get_wishlist => $value_get_wishlist) { ?>
            array_get_wishlist.push('<?php echo $value_get_wishlist['product_id']; ?>');
        <?php } ?>
        $('body').find('.js_product_chung').each(function(index, el) {
            var product_id_wishlist = $(this).find('.js_wishlist__btn').attr('data-product-code');
            if (array_get_wishlist.includes(product_id_wishlist)) {
                $(this).find('.js_wishlist__btn').addClass('added');
            }
        });
        <?php } ?>
        // Xử lý wishlist

        // Nút close Brainy Filter Mobile
        $('.bf-responsive .box.bf-check-position .box-heading .closebfmobile').click(function(event) {
            $(this).closest('.bf-responsive').removeClass('bf-opened');
            $('body').removeClass('bf-non-scrollable');
        });
        $('.bf-responsive .box.bf-check-position .js_product-filter_btn-apply').click(function(event) {
            $(this).closest('.bf-responsive').removeClass('bf-opened');
            $('body').removeClass('bf-non-scrollable');
        });
        // Nút close Brainy Filter Mobile


        // Slide module slideshow
        $('.hero-banner-slider-js').slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 9000,
            loop: false,
        }).on('setPosition', function (event, slick) {
            slick.$slides.css('height', slick.$slideTrack.height() + 'px');
        });
        // Slide module slideshow


        // Slide module category
        $('.js-browse-products').slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 9000,
            loop: false,
            slidesToShow: 7,
            slidesToScroll: 7,
            responsive: [
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
            ]
        });
        // Slide module category
    }); 
    





    // Hàm tìm kiếm Tỉnh/Thành
    function js_search_input_country($this){
        var data_value = $this.closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
        var action = 'index.php?route=common/footer/js_search_input_country';
        var value_name = '';
        $.ajax({
            url: action,
            type: 'POST',
            data: {
                'filter_name': $this.val(),
            },
            dataType: 'json',
            success: function(json) {
                //console.log(json);
                $this.closest('.v-selectbox__options').find('.js_option_country').html('');
                var html = '';
                $.each( json, function( key, value ) {
                    if(value['country_id'] == data_value){
                        html += '<div data-value="'+value['country_id']+'" class="v-selectbox__option selected">'+value['name']+'</div>';
                        value_name = value['name'];
                    }else{
                        html += '<div data-value="'+value['country_id']+'" class="v-selectbox__option">'+value['name']+'</div>';
                    }
                });
                $this.closest('.v-selectbox__options').find('.js_option_country').html(html);
                
            },
            error: function(xhr, status, error){
                console.log(error);
            },
        });
    }
     // Hàm tìm kiếm Tỉnh/Thành

    // Hàm tìm kiếm Quận/Huyện
    function js_search_input_zone($this){
        var data_value = $this.closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
        var data_value_country = $('.js_search_input_country').closest('.v-selectbox').find('.v-selectbox__selected').attr('data-value');
        var action = 'index.php?route=common/footer/js_search_input_zone';
        var value_name = '';
        $.ajax({
            url: action,
            type: 'POST',
            data: {
                'filter_name': $this.val(),
                'filter_country_id': data_value_country,
            },
            dataType: 'json',
            success: function(json) {
                //console.log(json);
                $this.closest('.v-selectbox__options').find('.js_option_zone').html('');
                var html = '';
                $.each( json, function( key, value ) {
                    if(value['zone_id'] == data_value){
                        html += '<div data-value="'+value['zone_id']+'" class="v-selectbox__option selected">'+value['name']+'</div>';
                        value_name = value['name'];
                    }else{
                        html += '<div data-value="'+value['zone_id']+'" class="v-selectbox__option">'+value['name']+'</div>';
                    }
                });
                $this.closest('.v-selectbox__options').find('.js_option_zone').html(html);
                
            },
            error: function(xhr, status, error){
                console.log(error);
            },
        });
    }
    // Hàm tìm kiếm Quận/Huyện

    // Hàm set cookie
    function setCookie(cname, cvalue, extimes) {
      var d = new Date();
      d.setTime(d.getTime() + (extimes));
      var expires = "expires="+d.toUTCString();
      var path = "path=/";
      document.cookie = cname + "=" + cvalue + "; " + expires + "; " + path;
    }
    // Hàm set cookie

    // Hàm get cookie
    function getCookie(cname) {
      var name = cname + "=";
      var ca = document.cookie.split(';');
      for(var i=0; i<ca.length; i++) {
          var c = ca[i];
          while (c.charAt(0)==' ') c = c.substring(1);
          if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
      }
      return "";
    }
    // Hàm get cookie

    // Hàm empty cookie
    function empty(e) {
      switch(e) {
      case "":
        return true;
      case null:
        return true;
      case false:
        return true;
      case typeof this == "undefined":
        return true;
      default : return false;
      }
    }
    // Hàm empty cookie


    // Hàm xử lý Wishlist
    function js_wishlist__btn($this){
        var product_id_wishlist = $this.attr('data-product-code');
        if($this.hasClass('added')){
            $this.removeClass('added');
            wishlist.remove(product_id_wishlist);
        }else{
            $this.addClass('added');
            wishlist.add(product_id_wishlist);
        }
    }
    // Hàm xử lý Wishlist


    // Hàm xử lý thêm vào giỏ
    function js_addtocart__btn($this){
        var product_id_addtocart = $this.attr('data-product-code');
        var product_minimum_addtocart = $this.attr('data-product-minimum');
        cart.add(product_id_addtocart, product_minimum_addtocart);
        $('.add-to-cart-modal').attr('style','');
    }
    // Hàm xử lý thêm vào giỏ

    // Hàm scroll to div
    function goToByScroll(id) {
        id = id.replace("link", "");
        $('html,body').animate({
            scrollTop: $("#" + id).offset().top - 150
        }, 'slow');
    }
    // Hàm scroll to div
</script>


</head>


<body class="<?php echo $class; ?> body home-page progressive" data-sessionId="nak02y4gbmwjzar25mvv4x22" datalayer-login-type="">
    
<div style="display: none;"><?php echo $svg; ?></div>
    
<div class="body-wrapper">
    <div class="body-container-wrapper">
        <div donut-hole-on="Home Page" donut-hole-timestamp="02:33:54"></div>
        <div class="global-inactive-bg js-inactive-bg hide"></div>
        <header class="header is-dark show-head-nav ">
            <nav class="navigation-wrapper js-navigation-wrapper">
                <div class="head-nav">
                    <div class="navigation">
                        <a class="head-nav__select-location-link js_select-location d-none" data-select-location-label="Chọn vị trí của bạn" data-select-location-reload="False" href="javascript:void(0)">
                            <svg viewBox="0 0 10 15" class="head-nav__select-location-icon">
                                <use xlink:href="#navi_pin"></use>
                            </svg>
                            <span class="head-nav__select-location-text js-head-nav__select-location-text"></span>
                        </a>
                    </div>
                </div>
                <div class="main-navigation__close hide js-mobile-menu-close">
                    <button class="close-icon" type="button" data-open="offCanvasRight" aria-expanded="true" aria-controls="offCanvasRight" aria-label="Close icon" aria-hidden="true"></button>
                </div>
                <div class="main-navigation js-menu-container" id="offCanvasRight" data-off-canvas="" data-transition="push">
                    <div class="options opt-left hide-for-small">
                        <div class="navigation-logo">
                            <input type="hidden" id="hidHomePath" value="/" />
                            <a href="" class="logo-link tracking-link" data-track-location-id="header">
                                <img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" width="144" height="35">
                            </a>
                        </div>
                    </div>

                    <div class="main-navigation__menu js-dropdown-menu" data-modules="topMenu" data-closing-time="200" role="menubar">
                        <?php echo $megamenu; ?>
                        <div class="main-navigation__main-item -last hide-for-large">
                            <a href="<?php echo $wishlist; ?>" class="main-navigation__main-item-link main-navigation__wishlist-link" aria-label="go to wishlist page"><svg viewBox="0 0 26 24" class="inline-icon"><use xlink:href="#Heart"></use></svg><?php echo $text_wishlist; ?><div class="wishlist__total js_wishlist__total" style="<?php if ($total_wishlist) echo 'display: flex;'; ?>"><?php echo $total_wishlist; ?></div></a>
                        </div>
                        <div class="main-navigation__main-item navigation-icon js-search-toggler hide-for-small-only" title="">
                            <svg viewBox="0 0 25 25" class="inline-icon">
                                <use xlink:href="#search"></use>
                            </svg>
                        </div>
                        <div class="main-navigation__main-item navigation-icon hide-for-small-only">
                            <a href="<?php echo $wishlist; ?>" class="p-relative" aria-label="go to wishlist page">
                                <svg viewBox="0 0 26 24" class="inline-icon">
                                    <use xlink:href="#Heart1"></use>
                                </svg>
                                <div class="wishlist__total js_wishlist__total" style="<?php if ($total_wishlist) echo 'display: flex;'; ?>"><?php echo $total_wishlist; ?></div>
                            </a>
                        </div>
                        <div class="main-navigation__main-item has-submenu -profile navigation-icon js-menu-item js-menu-expand-icon">
                            <div class="main-navigation__main-item-link profile-button js-profile-button">
                                <svg class="hide-for-large inline-icon" viewBox="0 0 16 20">
                                    <use xlink:href="#Profile-mobile"></use>
                                </svg>
                                <span class="hide-for-large"><?php if ($logged) echo $text_account; else echo $text_login; ?></span>
                                <svg class="hide-for-small inline-icon" viewBox="0 0 25 25">
                                    <use xlink:href="#Profile"></use>
                                </svg>
                            </div>
                            <span class="expand-icon hide-for-large"></span>
                            <div class="submenu-navigation submenu-navigation-profile js-sub-menu">
                                <div class="menu-item-link js-sub-menu-title hide-for-large"><?php echo $text_account; ?></div>
                                <?php if ($logged) { ?>
                                <a class="submenu-navigation-item" href="<?php echo $account; ?>" rel="IDS_Login nofollow">
                                    <svg class="inline-icon" viewBox="0 0 26 26">
                                        <use xlink:href="#Profile"></use>
                                    </svg>
                                    <div class="submenu-navigation-item_link"><?php echo $text_account; ?></div>
                                </a>   
                                <a class="submenu-navigation-item" href="<?php echo $logout; ?>" rel="IDS_Login nofollow">
                                    <svg class="inline-icon" viewBox="0 0 26 26">
                                        <use xlink:href="#Log-out-icon"></use>
                                    </svg>
                                    <div class="submenu-navigation-item_link"><?php echo $text_logout; ?></div>
                                </a>
                                <?php } else { ?>
                                <a class="submenu-navigation-item" href="<?php echo $login; ?>" rel="IDS_Login nofollow">
                                    <svg class="inline-icon submenu-navigation__sign-in-icon" viewBox="0 0 19 20">
                                        <use xlink:href="#sign-in-icon"></use>
                                    </svg>
                                    <div class="submenu-navigation-item_link"><?php echo $text_login; ?></div>
                                </a>
                                <a class="submenu-navigation-item" href="<?php echo $register; ?>" rel="IDS_Login nofollow">
                                    <svg class="inline-icon" viewBox="0 0 26 26">
                                        <use xlink:href="#sign-up-icon"></use>
                                    </svg>
                                    <div class="submenu-navigation-item_link"><?php echo $text_register; ?></div>
                                </a>
                                <?php } ?>
                            </div>
                        </div>
                        <?php echo $cart; ?>
                        <?php echo $language; ?>
                    </div>
                </div>
                <div class="js-off-canvas-overlay is-overlay-fixed"></div>
                <div class="main-nav off-canvas-content header-mobile" data-off-canvas-content="">
                    <div class="hide-for-large mobile-menu js-mobile-menu" data-toggle="offCanvas">
                        <svg viewBox="-1 -5 25 25" class="inline-icon">
                            <use xlink:href="#hamburger"></use>
                        </svg>
                    </div>
                    <div class="header-mobile-logo " role="menu">
                        <div class="navigation-logo" role="menuitem">
                            <a href="" class="logo-link tracking-link" data-track-location-id="header">
                                <img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" width="144" height="35">
                            </a>
                        </div>
                    </div>
                    <div class="global-search-icon js-search-toggler-mobile option-right-content">
                        <svg viewBox="0 0 25 25" class="inline-icon">
                            <use xlink:href="#search"></use>
                        </svg>
                    </div>
                    <a href="<?php echo $checkout; ?>" class="header-mobile-cart p-relative js-cart-icon" aria-label="MobileMinicart">
                        <svg class="hide-for-large inline-icon" viewBox="0 0 25 25">
                            <use xlink:href="#Cart"></use>
                        </svg>
                    </a>
                    <div class="close-search-bar option-right-content hide click-disable">
                        <img class="preview" src="image/place-holder.png" data-src="catalog/view/theme/default/stylesheet/css/icons/cross.png" alt="close" width="1" height="1" />
                    </div>
                </div>
                <?php echo $search; ?>
            </nav>
        </header>