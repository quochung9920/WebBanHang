<?php echo $header; global $session;?>
<link href="catalog/view/theme/default/stylesheet/css/category.css" rel="stylesheet">
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="item"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
</div>

<div class="hero-banner-slider hero-banner-slider-js" data-slide-dots-text="False" data-slide-infinite="False" data-slide-autoplay-speed="7000">
  <div class="hero-banner-standard theme-blue-rich small-banner" role="banner">
    <div class="card col-12">
      <div class="card-section feature-img " data-imagizer="">
        <picture>
          <source srcset="<?php echo $thumb_banner_mobile; ?>" media="(max-width: 991px)">
          <source srcset="<?php echo $thumb_banner; ?>">
          <img src="<?php echo $thumb_banner_mobile; ?>" alt="<?php echo $heading_title; ?>">
        </picture>
      </div>
      <div class="card-section content card-section_content row">
        <div class="card-column">
          <div class="card-content-wrapper card-column__content">
            <h1 class="heading "><?php echo $heading_title; ?></h1>
            <div class="card-content__description mgt-sm-20"><?php echo $description; ?></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="js_product-listing-wrapper product-listing-wrapper">
  <div id="productListingContainer" class="product-listing-container js_product-listing-container">
    <?php if($categories) { ?>
    <div class="browse-filter-blocks js_browse-filter-blocks">
      <div class="container" data-sticky-browse-filter-blocks="">
        <span class="browse-filter_title"><?php echo $text_phanloai; ?>:</span>
        <div class="browse-filter__buttons">
          <button class="btn js-filter-product-btn active">
            <strong class="js_browse-filter-display-text"><?php echo $text_tatca; ?></strong>
          </button>
          <?php foreach ($categories as $key_category => $value_category) { ?>
            <a href="<?php echo $value_category['href']; ?>" class="btn js-filter-product-btn">
              <strong class="js_browse-filter-display-text"><?php echo $value_category['name']; ?></strong>
            </a>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>

    <div class="container js_product-container product-container">
    <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($products) { ?>
        <div class="shorting-container">
          <div class="shorting-block">
              <div class="container">
                  <div class="shorting row row_pagination">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                  </div>
              </div>
          </div>
          <div class="d2c-shorting js_d2c-shorting">
              <h2 class="product-filter_title js_product-filter_title">
                  <span class="product-filter_title-icon hide-for-large"></span>
                  <span class="d-flex align-items-center"><?php echo $text_boloc; ?></span>
              </h2>
              <div>
                <button class="d2c-shorting_btn js_d2c-shorting_btn">
                    <span class="d2c-shorting_title"><?php echo $text_sort; ?></span>
                </button>
                <select id="input-sort" class="form-control" onchange="location = this.value;">
                  <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
          </div>
        </div>
      
      <ul class="row product-list-container product-list-wrapper list-style-type-none">
        <?php foreach ($products as $product) { ?>
        <li class="col-12 col-md-4">
          <div class="product-list-item js_product_chung">
              <div class="product-list-item_wrap">
                  <div class="product-list-item_wrap-1 sale-off-sticky__container ">
                      <div class="product-list-item_title"></div>
                      <div class="sale-off-sticky__wrapper js_sale-off-sticky__wrapper">
                        <?php if($product['special']) { ?>
                          <div class="sale-off-sticky__badge-container">
                              <!-- <div class="sale-off-sticky__badges">
                                  <div class="sale-off-sticky__badge">MỚI 2022</div>
                              </div> -->
                              <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                          </div>
                        <?php } ?>
                      </div>
                      <div class="row js_product-list-item_wrap-3 product-list-item_wrap-3">
                          <div class="col col-5 col-md-12">
                              <div class="product-list-item_img-container d-flex mgbt-md-10">
                                  <div class="product-list-item__wishlist-icon js_wishlist__btn wishlist__btn show <?php if(in_array($product['product_id'], $session->data['wishlist'])) echo 'added'; ?>" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                      <div class="wishlist__icon"></div>
                                  </div>
                                  <a href="<?php echo $product['href']; ?>" class="product-list-item_img product-360-icon__container js_search-page-click-track">
                                    <div class="js_product__img stock-subscription__img-wrapper">
                                      <img class="preview" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="210" height="210" io-loaded="true">
                                    </div>
                                  </a>
                                  <div class="product-list-item__image-badges">
                                  </div>
                              </div>
                          </div>
                          <div class="col col-7 col-md-12">
                              <p class="product-list-item_no">
                                  <a href="<?php echo $product['href']; ?>" class="js_search-page-click-track"><?php echo $product['model']; ?></a>
                              </p>
                              <h2 class="product-list-item_name mg-sm-0">
                                  <a href="<?php echo $product['href']; ?>" class="js_search-page-click-track" gtm-initialized-click-product="true"><?php echo $product['name']; ?></a>
                              </h2>
                              <div class="rating js_rating">
                                <div class="rating_item-content">
                                  <div title="<?php echo $product['rating']; ?> / 5" class="ratings">
                                    <div class="rating_stars rating_stars-svg">
                                      <div style="width: <?php echo $product['rating']*100/5; ?>%" class="rating_stars-svg--marked">
                                        <svg viewBox="0 0 95 15" class="icon-stars">
                                          <use xlink:href="#stars"></use>
                                        </svg>
                                      </div>
                                      <svg viewBox="0 0 95 15" class="icon-stars">
                                        <use xlink:href="#stars"></use>
                                      </svg>
                                    </div>
                                    <div class="rating_based">
                                      <div class="rating_count">(<?php echo $product['reviews']; ?>)</div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </div>
                      </div>
                      <p class="item-price mgbt-sm-15 mgbt-md-15 hide-for-large">
                        <?php if($product['special']) { ?>
                          <strong class="item-price-number mgr-sm-10"><?php echo $product['special']; ?></strong>
                          <span class="item-price-before-discount"><?php echo $product['price']; ?></span>
                        <?php } else { ?>
                          <strong class="item-price-number mgr-sm-10"><?php echo $product['price']; ?></strong>
                        <?php } ?>
                      </p>
                  </div>
                  <div class="product-list-item_wrap-2">
                      <p class="item-price mgbt-sm-15 mgbt-md-15 hide-for-small">
                        <?php if($product['special']) { ?>
                          <span class="item-price-before-discount"><?php echo $product['price']; ?></span>
                          <strong class="item-price-number mgr-sm-10"><?php echo $product['special']; ?></strong>
                        <?php } else { ?>
                          <strong class="item-price-number mgr-sm-10"><?php echo $product['price']; ?></strong>
                         <?php } ?>
                      </p>
                      <div class="btn-group">
                          <button class="cta-link-button product-list-item__add-to-cart-btn js_product-list-item__add-to-cart-btn js_product-item_add-to-card order-md-1 stock-subscription__add-to-cart-btn btn--add-to-cart show js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></button>
                          <a class="view-detail-btn mgr-md-10 js_search-page-click-track" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                      </div>
                      <!-- <div class="add-to-compare" data-productid="EWF1141R9SB" data-catalogid="1073744457__CatalogContent">
                          <label class="checkbox">
                              <input id="compare-EWF1141R9SB" type="checkbox" aria-label="Add to compare" class="checkbox__input">
                              <span class="checkbox__checkmark"></span>
                              <label for="compare-EWF1141R9SB" class="add-to-compare-title checkbox__label" data-added="Thêm vào" data-start-compare="Bắt đầu so sánh" data-add-to-compare="Đưa vào so sánh">Đưa vào so sánh</label>
                          </label>
                      </div> -->
                  </div>
              </div>
          </div>
        </li>
        <?php } ?>
      </ul>
      <div class="row row_pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
  </div>
</div>
</div>
<?php echo $footer; ?>
