<div class="main-navigation__main-item navigation-icon hide-for-small-only" title="">
  <a href="<?php echo $checkout; ?>" class="d-flex p-relative js-cart-icon" aria-label="go to cart page">
    <span class="d-none">Go to cart page</span>
    <svg class="hide-for-small inline-icon" viewBox="0 0 25 25">
        <use xlink:href="#Cart"></use>
    </svg>
    <?php if($text_items) { ?>
      <div class="cart-icon-count js_cart-count"><?php echo $text_items; ?></div>
    <?php } ?>
  </a>
</div>