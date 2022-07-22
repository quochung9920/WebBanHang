<div class="tab-group-block js-tab-group" data-modules="tabGroup">
  <div class="tab-group-module-title text-center"><?php echo $heading_title; ?></div>
  <div class="tab-group-title-container d-flex">
      <div class="tab-group-title js-tab-group-title -active text-sm-center" tab-target="js-tab-item-content-0"><?php echo $title; ?></div>
      <div class="tab-group-title js-tab-group-title  text-sm-center" tab-target="js-tab-item-content-1"><?php echo $title2; ?></div>
      <div class="tab-group-title js-tab-group-title  text-sm-center" tab-target="js-tab-item-content-2"><?php echo $title3; ?></div>
  </div>
  <div class="tab-group-content-container">
    <div class="tab-group-item-content js-tab-item js-tab-item-content-0 ">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class=" mgbt-sm-20 d-flex flex-direction-column">
              <div class=" row mgl-sm-0 mgr-sm-0">
                <?php foreach ($products as $key => $product) { ?>
                <?php if ($key == 0) { ?>
                <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="product-card-hover js-product-card-hover js_product_chung">
                    <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                      <?php if($product['special']) { ?>
                        <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                          <div class="sale-off-sticky__badge-container">
                            <!-- <div class="sale-off-sticky__badges">
                                <div class="sale-off-sticky__badge">MỚI 2022</div>
                            </div> -->
                            <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                            <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                          </div>
                        </div>
                      <?php } ?>
                        <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                        <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                          <div class="wishlist__icon"></div>
                        </div>
                    </div>

                    <div class="product-card-hover-info mgt-sm-20">
                      <div class="product-card-hover__wishlist-wrapper">
                          <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                              <div class="wishlist__icon"></div>
                          </div>
                      </div>
                      <!-- <div class="rating js_rating d-flex ab-hide" elux-prod-url="/thiet-bi/may-giat/ewf1141r9sb/">
                          <div class="rating_item-content">
                              <div title="5.0 / 5" class="ratings">
                                  <div class="rating_stars rating_stars-svg">
                                      <div style="width: 100%" class="rating_stars-svg--marked">
                                          <svg viewBox="0 0 95 15" class="icon-stars">
                                              <use xlink:href="#stars"></use>
                                          </svg>
                                      </div>
                                      <svg viewBox="0 0 95 15" class="icon-stars">
                                          <use xlink:href="#stars"></use>
                                      </svg>
                                  </div>
                                  <div class="rating_based">
                                      <div class="rating_count">(1)</div>
                                  </div>
                              </div>
                          </div>
                      </div> -->
                      <div>
                        <?php if($product['special']) { ?>
                          <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                          <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                        <?php } else { ?>
                          <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </div>
                    </div>
                      <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                        <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                        <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                      </div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <div class="grid d-flex gridblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="  d-flex flex-direction-column">
                    <div class=" row mgl-sm-0 mgr-sm-0">
                      <?php foreach ($products as $key => $product) { ?>
                      <?php if ($key > 0) { ?>
                        <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-6 displaymode-half-device-half-mobile  pdr-sm-0 pdl-sm-0">
                          <div class="product-card-hover js-product-card-hover js_product_chung">
                            <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                                <?php if($product['special']) { ?>
                                  <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                                    <div class="sale-off-sticky__badge-container">
                                      <!-- <div class="sale-off-sticky__badges">
                                          <div class="sale-off-sticky__badge">MỚI 2022</div>
                                      </div> -->
                                      <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                                      <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                                    </div>
                                  </div>
                                <?php } ?>
                                <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                  <div class="wishlist__icon"></div>
                                </div>
                            </div>
                            <div class="product-card-hover-info mgt-sm-20">
                              <div class="product-card-hover__wishlist-wrapper">
                                <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                    <div class="wishlist__icon"></div>
                                </div>
                              </div>
                              <div>
                                <?php if($product['special']) { ?>
                                  <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                                  <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                                <?php } else { ?>
                                  <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                                <?php } ?>
                              </div>
                            </div>
                            <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                              <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                              <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                            </div>
                          </div>
                        </div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="tab-group-item-content js-tab-item js-tab-item-content-1 overflow-y-hidden height-0">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class=" mgbt-sm-20 d-flex flex-direction-column">
              <div class=" row mgl-sm-0 mgr-sm-0">
                <?php foreach ($products2 as $key => $product) { ?>
                <?php if ($key == 0) { ?>
                <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="product-card-hover js-product-card-hover js_product_chung">
                    <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                      <?php if($product['special']) { ?>
                        <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                          <div class="sale-off-sticky__badge-container">
                            <!-- <div class="sale-off-sticky__badges">
                                <div class="sale-off-sticky__badge">MỚI 2022</div>
                            </div> -->
                            <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                            <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                          </div>
                        </div>
                      <?php } ?>
                        <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                        <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                          <div class="wishlist__icon"></div>
                        </div>
                    </div>

                    <div class="product-card-hover-info mgt-sm-20">
                      <div class="product-card-hover__wishlist-wrapper">
                          <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                              <div class="wishlist__icon"></div>
                          </div>
                      </div>
                      <!-- <div class="rating js_rating d-flex ab-hide" elux-prod-url="/thiet-bi/may-giat/ewf1141r9sb/">
                          <div class="rating_item-content">
                              <div title="5.0 / 5" class="ratings">
                                  <div class="rating_stars rating_stars-svg">
                                      <div style="width: 100%" class="rating_stars-svg--marked">
                                          <svg viewBox="0 0 95 15" class="icon-stars">
                                              <use xlink:href="#stars"></use>
                                          </svg>
                                      </div>
                                      <svg viewBox="0 0 95 15" class="icon-stars">
                                          <use xlink:href="#stars"></use>
                                      </svg>
                                  </div>
                                  <div class="rating_based">
                                      <div class="rating_count">(1)</div>
                                  </div>
                              </div>
                          </div>
                      </div> -->
                      <div>
                        <?php if($product['special']) { ?>
                          <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                          <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                        <?php } else { ?>
                          <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </div>
                    </div>
                      <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                        <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                        <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                      </div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <div class="grid d-flex gridblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="  d-flex flex-direction-column">
                    <div class=" row mgl-sm-0 mgr-sm-0">
                      <?php foreach ($products2 as $key => $product) { ?>
                      <?php if ($key > 0) { ?>
                        <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-6 displaymode-half-device-half-mobile pdr-sm-0 pdl-sm-0">
                          <div class="product-card-hover js-product-card-hover js_product_chung">
                            <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                                <?php if($product['special']) { ?>
                                  <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                                    <div class="sale-off-sticky__badge-container">
                                      <!-- <div class="sale-off-sticky__badges">
                                          <div class="sale-off-sticky__badge">MỚI 2022</div>
                                      </div> -->
                                      <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                                      <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                                    </div>
                                  </div>
                                <?php } ?>
                                <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                  <div class="wishlist__icon"></div>
                                </div>
                            </div>
                            <div class="product-card-hover-info mgt-sm-20">
                              <div class="product-card-hover__wishlist-wrapper">
                                <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                    <div class="wishlist__icon"></div>
                                </div>
                              </div>
                              <div>
                                <?php if($product['special']) { ?>
                                  <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                                  <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                                <?php } else { ?>
                                  <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                                <?php } ?>
                              </div>
                            </div>
                            <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                              <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                              <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                            </div>
                          </div>
                        </div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>       
        </div>
      </div>
    </div>

    <div class="tab-group-item-content js-tab-item js-tab-item-content-2 overflow-y-hidden height-0">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class=" mgbt-sm-20 d-flex flex-direction-column">
              <div class=" row mgl-sm-0 mgr-sm-0">
                <?php foreach ($products3 as $key => $product) { ?>
                <?php if ($key == 0) { ?>
                <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="product-card-hover js-product-card-hover js_product_chung">
                    <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                      <?php if($product['special']) { ?>
                        <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                          <div class="sale-off-sticky__badge-container">
                            <!-- <div class="sale-off-sticky__badges">
                                <div class="sale-off-sticky__badge">MỚI 2022</div>
                            </div> -->
                            <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                            <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                          </div>
                        </div>
                      <?php } ?>
                        <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                        <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                          <div class="wishlist__icon"></div>
                        </div>
                    </div>

                    <div class="product-card-hover-info mgt-sm-20">
                      <div class="product-card-hover__wishlist-wrapper">
                          <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                              <div class="wishlist__icon"></div>
                          </div>
                      </div>
                      <!-- <div class="rating js_rating d-flex ab-hide" elux-prod-url="/thiet-bi/may-giat/ewf1141r9sb/">
                          <div class="rating_item-content">
                              <div title="5.0 / 5" class="ratings">
                                  <div class="rating_stars rating_stars-svg">
                                      <div style="width: 100%" class="rating_stars-svg--marked">
                                          <svg viewBox="0 0 95 15" class="icon-stars">
                                              <use xlink:href="#stars"></use>
                                          </svg>
                                      </div>
                                      <svg viewBox="0 0 95 15" class="icon-stars">
                                          <use xlink:href="#stars"></use>
                                      </svg>
                                  </div>
                                  <div class="rating_based">
                                      <div class="rating_count">(1)</div>
                                  </div>
                              </div>
                          </div>
                      </div> -->
                      <div>
                        <?php if($product['special']) { ?>
                          <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                          <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                        <?php } else { ?>
                          <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </div>
                    </div>
                      <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                        <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                        <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                      </div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <div class="grid d-flex gridblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
                  <div class="  d-flex flex-direction-column">
                    <div class=" row mgl-sm-0 mgr-sm-0">
                      <?php foreach ($products3 as $key => $product) { ?>
                      <?php if ($key > 0) { ?>
                        <div class="grid d-flex productcardblock col-lg-6 col-md-6 col-6 displaymode-half-device-half-mobile pdr-sm-0 pdl-sm-0">
                          <div class="product-card-hover js-product-card-hover js_product_chung">
                            <div class="product-card-hover-img sale-off-sticky__container js-product-card-hover js_product_chung-img">
                                <?php if($product['special']) { ?>
                                  <div class="sale-off-sticky__wrapper js_product-card-hover_sale-off-sticky">
                                    <div class="sale-off-sticky__badge-container">
                                      <!-- <div class="sale-off-sticky__badges">
                                          <div class="sale-off-sticky__badge">MỚI 2022</div>
                                      </div> -->
                                      <!-- <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--bundle fw-600">Combo hấp dẫn</div> -->
                                      <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                                    </div>
                                  </div>
                                <?php } ?>
                                <img class="preview w-100-percent" data-src="<?php echo $product['thumb']; ?>" src="image/place-holder.png" alt="<?php echo $product['name']; ?>" width="500" height="500" />
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-block show hidden-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                  <div class="wishlist__icon"></div>
                                </div>
                            </div>
                            <div class="product-card-hover-info mgt-sm-20">
                              <div class="product-card-hover__wishlist-wrapper">
                                <a class="product-card-hover-info-code" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div class="product-card-hover__wishlist-icon js_wishlist__btn wishlist__btn d-md-none show visible-xs" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>">
                                    <div class="wishlist__icon"></div>
                                </div>
                              </div>
                              <div>
                                <?php if($product['special']) { ?>
                                  <del class="item-price-before-discount"><?php echo $product['price']; ?></del>
                                  <span class="product-card-hover-info-price"><?php echo $product['special']; ?></span>
                                <?php } else { ?>
                                  <span class="product-card-hover-info-price"><?php echo $product['price']; ?></span>
                                <?php } ?>
                              </div>
                            </div>
                            <div class="product-card-hover-btn-group js-product-card-hove-btn-group hide-for-large mgt-auto">
                              <div class="cta-link-button mgt-sm-20 text-center js_product-item_add-to-card js_product-list-item__add-to-cart-btn stock-subscription__add-to-cart-btn js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product['product_id']; ?>" data-product-minimum="<?php echo $product['minimum']; ?>" data-product-name="<?php echo $product['name']; ?>"><?php echo $button_cart; ?></div>
                              <a class="cta-link-button -secondary -no-hover no-transition mgt-sm-10 text-center full-width" href="<?php echo $product['href']; ?>"><?php echo $text_timhieuthem; ?></a>
                            </div>
                          </div>
                        </div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>