<?php echo $header; ?>
<div class="container">
  <style>
    #content{
      background: #fff;
      padding: 0 15px;
      margin-bottom: 30px;
    }
    #content h1{
      margin-bottom: 20px;
    }
    #button-confirm{
      display: none;
    }
    @media(max-width: 767px){
      #content{
        padding: 15px;
      }
      #content h1{
        font-size: 25px;
      }
      .payment_html h2{
        font-size: 25px;
      }
    }
  </style>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <?php if (isset($array_products)) { ?>
      <?php if ($array_products) { ?>
      <div class="table-responsive">
          <table class="table table-bordered">
              <thead>
              <tr>
                <th><?php echo $text_tensanpham ;?></th>
                <th><?php echo $text_masanpham ;?></th>
                <th><?php echo $text_thuonghieu ;?></th>
                <th><?php echo $text_soluong ;?></th>
                <th><?php echo $text_dongia ;?></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($array_products as $product) { ?>
              <tr>
                <td class="text-left"><?php echo $product['name']; ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><?php echo $product['manufacturer']; ?></td>
                <td class="text-center"><?php echo $product['quantity']; ?></td>
                <td class="text-center"><?php echo number_format($product['price'], 0, ',', '.'); ?>₫</td>
              </tr>
              <?php } ?>
              <?php if($coupons_info) { ?>
              <tr>
                <td colspan="4" class="text-right"><?php echo $text_tongtien ;?></td>
                <td class="text-center"><?php echo number_format($total, 0, ',', '.'); ?>₫</td>
              </tr>
              <?php foreach ($coupons_info as $key => $coupon_info) { ?>
                <tr>
                  <td colspan="4" class="text-right"><?php echo $text_phieuquatang ;?> (<?php echo $coupon_info['coupon_name']; ?>)</td>
                  <td class="text-center">-<?php echo number_format($coupon_info['discount_coupon'], 0, ',', '.') //str_replace('.0000', '', $coupon_info['discount_coupon']); ?>₫</td>
                </tr>
              <?php } ?>
              
              <?php } ?>


              <?php if($esteemgift) { ?>
                <tr>
                  <td colspan="4" class="text-right">Esteem Gift</td>
                  <td class="text-center">-<?php echo number_format($esteemgift, 0, ',', '.'); ?>₫</td>
                </tr>
              <?php } ?>

              <tr>
                <td colspan="4" class="text-right"><?php echo $text_tongcong ;?></td>
                <td class="text-center"><?php echo number_format($total_total-$esteemgift, 0, ',', '.'); ?>₫</td>
              </tr>
            </tbody>
          </table>
        </div>
      <?php } ?>
      <?php } ?>
      <?php if (isset($payment)) { ?>
      <?php if ($payment) { ?>
        <div class="payment_html">
          <?php echo $payment; ?>
        </div>
      <?php } ?>
      <?php } ?>

      
      
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>



<?php echo $footer; ?>