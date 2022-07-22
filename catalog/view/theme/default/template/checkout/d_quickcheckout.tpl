<?php echo $header; ?>
<style>
    #d_quickcheckout{
      margin-top: 15px;
    }
    .panel-default>.panel-heading{
      color: #fff;
      background-color: var(--main-color);
      border: 0;
    }
    #shipping_method_form label,
    #payment_method_list label{
      padding: 0;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      line-height: normal;
    }
    #payment_method_list label img{
      display: none;
    }
    #shipping_method_form label input,
    #payment_method_list label input{
      margin-right: 5px;
      position: absolute;
      opacity: 0;
      cursor: pointer;
    }
    #shipping_method_form label input:checked ~ .radiobtn,
    #payment_method_list label input:checked ~ .radiobtn{
      background-color: var(--main-color);
    }
    .radiobtn {
      position: absolute;
      top: 0;
      left: 0;
      height: 20px;
      width: 20px;
      background-color: #eee;
      border-radius: 50%;
    }
    .radiobtn:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 6px;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: white;
    }
    #shipping_method_form label input:checked ~ .radiobtn:after,
    #payment_method_list label input:checked ~ .radiobtn:after {
      display: block;
    }
    #shipping_method_form label span.text,
    #payment_method_list label span.text{
      padding-left: 25px;
    }
    #shipping_method_form label span.price,
    #payment_method_list label span.price{
      margin-left: 15px;
    }
    #shipping_method_form label span.price:not(:empty):before,
    #payment_method_list label span.price:not(:empty):before{
      content: "(";
    }
    #shipping_method_form label span.price:not(:empty):after,
    #payment_method_list label span.price:not(:empty):after{
      content: ")";
    }
    .radio+.radio{
      margin-top: 0;
    }
    input::placeholder,
    textarea::placeholder{
      color: #878787 !important;
      font-style: italic;
    }
    input[type="text"], input[type="search"], input[type="password"], input[type="email"], input[type="file"], input[type="number"], input[type="tel"], textarea, select{
      padding: 0 15px !important;
      border-radius: 4px !important;
      box-shadow: none !important;
    }
    textarea{
      padding: 15px !important;
    }
    #payment_address input#payment_address_shipping_address_tmp:checked ~ .checkmark,
    #label_esteemgift input#esteemgift_tmp:checked ~ .checkmark{
      background-color: var(--main-color);
    }
    .checkmark {
      position: absolute;
      top: 0;
      left: 0;
      height: 20px;
      width: 20px;
      background-color: #eee;
      border-radius: 50%;
    }
    .checkmark:after {
      content: "";
      position: absolute;
      display: none;
      left: 7px;
      top: 3px;
      width: 7px;
      height: 11px;
      border: solid white;
      border-width: 0 3px 3px 0;
      -webkit-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      transform: rotate(45deg);
    }
    #payment_address input#payment_address_shipping_address_tmp:checked ~ .checkmark:after,
    #label_esteemgift input#esteemgift_tmp:checked ~ .checkmark:after{
      display: block;
    }
    #payment_address #label_payment_address_shipping_address,
    #label_esteemgift{
      padding: 0;
    }
    #payment_address #label_payment_address_shipping_address span.text,
    #label_esteemgift span.text{
      padding-left: 25px;
      line-height: 22px;
    }
    .button_go_back{
      border: 0;
      background: 0;
      padding: 0;
      height: auto;
      display: flex;
      flex-wrap: wrap;
      font-size: 21px;
      transition: all 0.3s;
      position: absolute;
      top: 34px;
      transform: translate(-60px, 0);
      color: #75af4a;
    }
    .button_go_back:hover{
      color: var(--main-color);
    }
    .radio{
      margin-top: 0;
    }
    #payment_address_form{
      display: flex;
      flex-wrap: wrap;
      width: 100%;
    }
    #payment_address_form .form-group{
      width: 100%;
      margin-left: 0;
      margin-right: 0;
      padding: 0;
    }
    #shipping_method_list,
    #payment_method_list{
      margin-top: 15px;
    }

    #d_quickcheckout #cart_view .form-horizontal.qc-totals .row:nth-child(1){
      display: none;
    }
    #d_quickcheckout #cart_view .form-horizontal.qc-totals .row{
      display: flex;
      flex-wrap: wrap;
      align-items: center;
    }
    #d_quickcheckout #cart_view .form-horizontal.qc-totals .row:last-child{
      margin-top: 0;
    }
    #d_quickcheckout #cart_view .form-horizontal.qc-totals .row label{
      margin: 0;
      padding: 0;
    }
    .header_have_fixed .alert{
      top: 0;
    }
    .qc_information{
      display: flex;
      flex-wrap: wrap;
    }
    #payment_view{
      display: none;
    }
    #payment_address .panel-body{
      padding-left: 0;
      padding-right: 0;
      padding-bottom: 0;
    }
    .qc-totals .row .text-right{
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: flex-end;
    }
    #d_quickcheckout .qc-totals .row:last-child div, #d_quickcheckout .qc-totals .row:last-child label{
      font-size: inherit;
    }
    #d_quickcheckout .preloader{
      display: none !important;
    }
    
    @media (max-width: 767px){
      #d_quickcheckout{
        margin-top: 0;
      }
      .button_go_back{
        top: 37px;
        transform: none;
      }
      .cart_temp_desktop #cart_view{
        display: none;
      }
      .qc-totals .row label{
        padding: 0 15px !important;
        width: 60%;
      }
      .qc-totals .row .text-right{
        width: 40%;
      }
    }
  </style>
<div class="container" id="container">
  <ul class="breadcrumb qc-breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a class="invert-color-1" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

<!-- Quick Checkout v4.0 by Dreamvention.com checkout/quickcheckout.tpl -->
  <?php echo $d_quickcheckout; ?>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>