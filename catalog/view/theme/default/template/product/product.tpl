<?php echo $header; global $session;?>
<link rel='stylesheet' href='catalog/view/theme/default/stylesheet/css/product.css'/>
<link rel='stylesheet' href='catalog/view/theme/default/stylesheet/css/product-detail.css' as="style" media="none" />
<link rel='stylesheet' href='catalog/view/theme/default/stylesheet/css/recommended-product.css' as="style" media="none" />
<link rel='stylesheet' href='catalog/view/theme/default/stylesheet/css/product-rating-18012022.css'/>
<script src="catalog/view/theme/default/stylesheet/js/drift-main/Drift.js" type="text/javascript" ></script>
<script src="catalog/view/theme/default/stylesheet/js/pinchzoom/pinchzoom.js" type="text/javascript" ></script>


<div class="container">
  <ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="item"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
</div>

<div data-modules="productDetail">
<div class="hero-product">
<div class="content-container hero-product-container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div itemscope itemtype="http://schema.org/Product">
        <div class="col-12 col-md-6 columns text-right product-details_image-section product-details_heading-image js_product-details_heading-image">
          <div id="productImageStickyContainer" class="p-relative">
            <div class="js_product-sliderbar-inner p-relative">
              <?php if($special) { ?>
                <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
              <?php } ?>
                <div class="product-image-detail-slider has-slider has-2-row-thumbnail js-product-detail-slider  js-product-detail-slider-D2C" data-back-text="Back" data-tap-text="Double-tap to zoom" style="<?php if (!$images) echo 'padding-bottom: 0;'; else if (count($images) <= 4) echo 'padding-bottom: 70px'; ?>">
                  <?php if ($thumb) { ?>
                    <div class="js_product__img js_product__img0 stock-subscription__img-wrapper">
                        <picture class="product-sub-image center-image">
                            <source srcset="<?php echo $popup; ?>" media="(min-width: 991px)">
                            <img class="show js-image-zoom js-image-zoom0" data-lazy="<?php echo $popup; ?>" data-zoom="<?php echo $popup; ?>" data-thumbnail="<?php echo $popup; ?>" src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>" width="400" height="400">
                        </picture>
                    </div>
                  <?php } ?>
                  <?php if ($images) { ?>
                    <?php foreach ($images as $key => $image) { ?>
                      <div class="js_product__img js_product__img<?php echo $key+1; ?> stock-subscription__img-wrapper">
                        <img class="js-image-zoom js-image-zoom<?php echo $key+1; ?>" data-lazy="<?php echo $image['popup']; ?>" data-zoom="<?php echo $image['popup']; ?>" data-thumbnail="<?php echo $image['popup']; ?>" src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>" width="400" height="400">
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
                <div class="js_zoom-container"></div>
            </div>
          </div>
        </div>

        <script type="text/javascript">
          jQuery(document).ready(function($) {
            //console.log(document.querySelector(".js-image-zoom"));
            if($(window).width() > 767 ){
              $('.js-product-detail-slider').find('.js-image-zoom').each(function(index, el) {
                //console.log($(this).attr('class'));
                new Drift(document.querySelector(".js-image-zoom"+index), {
                  paneContainer: document.querySelector(".js_zoom-container"),
                  inlinePane: 900,
                  inlineOffsetY: -85,
                  containInline: true,
                  hoverBoundingBox: true,
                });
              });
            }else{
              $('.js-product-detail-slider').find('.js_product__img').each(function(index, el) {
                var el = document.querySelector('.js_product__img'+index);
                new PinchZoom(el, {});
              });
              
            }
            

            $('.js_product-sliderbar-inner .js-product-detail-slider').slick({
              dots: true,
              autoplay: false,
              loop: false,
              customPaging: function(slider, i) {
                var thumb = $(slider.$slides[i]).find('img').attr('data-thumbnail');
                return '<a><img width="40" src="' + thumb + '"></a>';
              },
            });
            
          });
        </script>

        <div class="col-12 col-md-6 columns product-details_heading-info pdl-md-50">
          <div class="product-details product-details_heading_content-wrapper" data-modules="productCompatibility">
            <!-- <div class="sale-off-sticky__badges">
              <div class="sale-off-sticky__badge">MỚI 2022</div>
            </div> -->
            <div class="product-details_heading__wishlist-wrapper">
              <h1 class="product-details_heading_product-name has-badge"><?php echo $heading_title; ?></h1>
              <div class="product-details_heading__wishlist-icon wishlist__btn js_wishlist__btn show <?php if(in_array($product_id, $session->data['wishlist'])) echo 'added'; ?>" onclick="js_wishlist__btn($(this));" data-product-code="<?php echo $product_id; ?>">
                <div class="wishlist__icon"></div>
              </div>
            </div>
            <div class="d-flex product-details_heading_rating-content">
              <div class="product-details_heading_nav-list ">
                <ul>
                  <li class="selected"><?php echo $model; ?></li>
                </ul>
              </div>
              <div class="product-details_heading_rating">
                <div id="BVRRInlineRating-<?php echo $model; ?>" class="hidden"></div>
                <div class="rating js_rating">
                  <div class="rating_item-content">
                    <div title="<?php echo $rating; ?> / 5" class="ratings">
                      <div class="rating_stars rating_stars-svg">
                        <div style="width: <?php echo $rating*100/5; ?>%;" class="rating_stars-svg--marked js_rating_stars-svg">
                          <svg viewBox="0 0 95 15" class="icon-stars">
                            <use xlink:href="#stars"></use>
                          </svg>
                        </div>
                        <svg viewBox="0 0 95 15" class="icon-stars">
                          <use xlink:href="#stars"></use>
                        </svg>
                      </div>
                      <div class="rating_based">
                        <div class="rating_count" onclick="goToByScroll('reviews');"><?php echo $rating; ?></div>
                        <div class="rating_rating" onclick="goToByScroll('reviews');">(<?php echo $reviews; ?>)</div>
                        <div class="rating_rating" onclick="goToByScroll('tab-review');"><?php echo $text_write; ?></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="product-details_heading_short-description">
              <?php echo $description; ?>
            </div>
            <div class="product-details_heading_pricing">
              <?php if($special) { ?>
                <span class="product-details_heading_pricing-before-discount mgr-sm-10"><?php echo $price; ?></span>
                <strong class="product-details_heading_pricing-number mgr-sm-10"><?php echo $special; ?></strong>
              <?php } else { ?>
                <strong class="product-details_heading_pricing-number mgr-sm-10"><?php echo $price; ?></strong>
              <?php } ?>
            </div>

          </div>
          <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          <button class="cta-link-button product-details_heading_addToCard js_product-item_add-to-card fw-600 stock-subscription__add-to-cart-btn js_product-list-item__add-to-cart-btn show js_addtocart__btn" onclick="js_addtocart__btn($(this));" data-product-code="<?php echo $product_id; ?>" data-product-minimum="<?php echo $minimum; ?>" data-product-name="<?php echo $heading_title; ?>"><?php echo $button_cart; ?></button>
        </div>

        <?php if ($description2) { ?>
        <div id="description">
          <div class="content-container">
            <div class="testfreaks">
              <ul class="tf-tabs">
                <li id="tf-tab-user" class="tf-tabs-selected"><?php echo $tab_description; ?></li>
              </ul>
            </div>
            <div class="content_description full_xemthem">
              <?php echo $description2; ?>
            </div>
            <div class="xemthem_description opacity0"><?php echo $text_xemthem; ?></div>
          </div>
          <script type="text/javascript">
            jQuery(document).ready(function($) {
              $('.xemthem_description').click(function(event) {
                if($('.xemthem_description').hasClass('full_xemthem')){
                  $(this).removeClass('full_xemthem');
                  $(this).closest('#description').find('.content_description').removeClass('full_xemthem');
                  $(this).html('<?php echo $text_xemthem; ?>');
                  goToByScroll('description');
                }else{
                  $(this).addClass('full_xemthem');
                  $(this).closest('#description').find('.content_description').addClass('full_xemthem');
                  $(this).html('<?php echo $text_thugon; ?>');
                }
              });
              if($('.content_description').outerHeight() <= 400){
                $('.xemthem_description').addClass('hidden');
              }else{
                $('.content_description').removeClass('full_xemthem');
                $('.content_description').addClass('have_padding');
              }
              $(window).load(function () {
                $('.xemthem_description').removeClass('opacity0');
              });
            });
          </script>
        </div>
        <?php } ?>

        <?php if ($review_status) { ?>
        <div id="reviews" class="review-container js_load-script viewed">
          <div class="content-container">
            <?php if($rating) { ?>
              <h2><?php echo $text_review; ?></h2>
            <?php } ?>
            <div class="products-support container_12">
              <div id="BVRRContainer">
                <div class="testfreaks-reviews">
                  <div class="testfreaks">
                    <?php if($rating) { ?>
                    <div class="tf-header">
                      <div class="tf-score">
                        <div class="tf-rating"><?php echo $rating; ?></div>
                        <div class="tf-stars tf-stars-svg"><span style="width: <?php echo $rating*100/5; ?>%;" class="tf-stars-svg"></span></div>
                        <div class="tf-based"><?php echo $reviews; ?></div>
                      </div>
                      <div class="tf-distributions tf-dists-user">
                        <div class="tf-distribution tf-dist-user">
                          <table>
                            <tbody>
                              <tr>
                                <td class="range">5</td>
                                <td class="sym">☆</td>
                                <td title="<?php echo $rating5; ?>/<?php echo $reviews2; ?> (<?php if($reviews2) echo round($rating5*100/$reviews2,2); else echo 0; ?>%)" class="bar">
                                  <div style="width:<?php if($reviews2) echo round($rating5*100/$reviews2,2); else echo 0; ?>%;" class="bin bin0"></div>
                                </td>
                              </tr>
                              <tr>
                                <td class="range">4</td>
                                <td class="sym">☆</td>
                                <td title="<?php echo $rating4; ?>/<?php echo $reviews2; ?> (<?php if($reviews2) echo round($rating4*100/$reviews2,2); else echo 0; ?>%)" class="bar">
                                  <div style="width:<?php if($reviews2) echo round($rating4*100/$reviews2,2); else echo 0; ?>%;" class="bin bin1"></div>
                                </td>
                              </tr>
                              <tr>
                                <td class="range">3</td>
                                <td class="sym">☆</td>
                                <td title="<?php echo $rating3; ?>/<?php echo $reviews2; ?> (<?php if($reviews2) echo round($rating3*100/$reviews2,2); else echo 0; ?>%)" class="bar">
                                  <div style="width:<?php if($reviews2) echo round($rating3*100/$reviews2,2); else echo 0; ?>%;" class="bin bin2"></div>
                                </td>
                              </tr>
                              <tr>
                                <td class="range">2</td>
                                <td class="sym">☆</td>
                                <td title="<?php echo $rating2; ?>/<?php echo $reviews2; ?> (<?php if($reviews2) echo round($rating2*100/$reviews2,2); else echo 0; ?>%)" class="bar">
                                  <div style="width:<?php if($reviews2) echo round($rating2*100/$reviews2,2); else echo 0; ?>%;" class="bin bin3"></div>
                                </td>
                              </tr>
                              <tr>
                                <td class="range">1</td>
                                <td class="sym">☆</td>
                                <td title="<?php echo $rating1; ?>/<?php echo $reviews2; ?> (<?php if($reviews2) echo round($rating1*100/$reviews2,2); else echo 0; ?>%)" class="bar">
                                  <div style="width:<?php if($reviews2) echo round($rating1*100/$reviews2,2); else echo 0; ?>%;" class="bin bin4"></div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                    <?php } ?>
                    <ul class="tf-tabs">
                      <li id="tf-tab-user" class="tf-tabs-selected"><?php echo $text_review; ?> (<?php echo $reviews2; ?>)</li>
                    </ul>
                    <div id="review" class="tf-tabs-panels"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tab-review">
          <form class="form-horizontal" id="form-review">
            <h2><?php echo $text_write; ?></h2>
            <?php if ($review_guest) { ?>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                  <div class="col-sm-12">
                      <label class="control-label"><?php echo $entry_rating; ?></label>

                      <div class="rating set-rating">
                          <i class="fa fa-star-o" data-value="1"></i>
                          <i class="fa fa-star-o" data-value="2"></i>
                          <i class="fa fa-star-o" data-value="3"></i>
                          <i class="fa fa-star-o" data-value="4"></i>
                          <i class="fa fa-star-o" data-value="5"></i>
                      </div>
                      <script type="text/javascript">
                          $(document).ready(function() {
                              $('.set-rating i').hover(function() {
                                  var rate = $(this).data('value');
                                  var i = 0;
                                  $('.set-rating i').each(function() {
                                      i++;
                                      if (i <= rate) {
                                          $(this).attr("class","");
                                          $(this).addClass('fa fa-star');
                                      } else {
                                          $(this).attr("class","");
                                          $(this).addClass('fa fa-star-o');
                                      }
                                  })
                              })

                              $('.set-rating i').mouseleave(function() {
                                  var rate = $('input[name="rating"]:checked').val();
                                  rate = parseInt(rate);
                                  i = 0;
                                  $('.set-rating i').each(function() {
                                      i++;
                                      if (i <= rate) {
                                          $(this).attr("class","");
                                          $(this).addClass('fa fa-star');
                                      } else {
                                          $(this).attr("class","");
                                          $(this).addClass('fa fa-star-o');
                                      }
                                  })
                              })

                              $('.set-rating i').click(function() {
                                  $('input[name="rating"]:nth(' + ($(this).data('value') - 1) + ')').prop('checked', true);
                              });
                          });
                      </script>
                      <div class="hidden">
                          &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                          <input type="radio" name="rating" value="1" />
                          &nbsp;
                          <input type="radio" name="rating" value="2" />
                          &nbsp;
                          <input type="radio" name="rating" value="3" />
                          &nbsp;
                          <input type="radio" name="rating" value="4" />
                          &nbsp;
                          <input type="radio" name="rating" value="5" />
                          &nbsp;<?php echo $entry_good; ?>
                        </div>
                  </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                  <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                </div>
              </div>
              <?php echo $captcha; ?>
              <div class="buttons">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                </div>
              </div>
            <?php } else { ?>
              <?php echo $text_login; ?>
            <?php } ?>
          </form>
        </div>
        <?php } ?>
        
        
        <?php if ($products) { ?>
        <div id="complementary" class="complementary-module">
            <div class="complementary-products product-list-container mgt-sm-50">
                <h2><?php echo $text_related; ?></h2>
                <div class="content-container complementary-products-block pdt-sm-20 pdbt-sm-20">
                    <div class="complementary-products-block-slide arrow-icon-1x slick-slider--small">
                      <?php foreach ($products as $product) { ?>
                        <div class="product-list-item js_product_chung">
                            <div class="product-list-item_wrap">
                                <div class="product-list-item_wrap-1 sale-off-sticky__container ">
                                    <?php if($product['special']) { ?>
                                      <div class="sale-off-sticky__badge-container">
                                          <!-- <div class="sale-off-sticky__badges">
                                              <div class="sale-off-sticky__badge">MỚI 2022</div>
                                          </div> -->
                                          <div class="sale-off-sticky__sticker sale-off-sticky__sticker-ribbon sale-off-sticky__sticker-ribbon--sale fw-600"><?php echo $text_sale; ?></div>
                                      </div>
                                    <?php } ?>
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
                                </div>
                            </div>
                        </div>
                      <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
</div>

<script type="text/javascript"><!--

jQuery(document).ready(function($) {
  $('.complementary-products-block-slide').slick({
    dots: true,
    autoplay: false,
    loop: false,
    slidesToShow: 3,
    slidesToScroll: 3,
    responsive: [
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      },
    ]
  });
});


$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#tab-review .buttons').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#tab-review .buttons').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
//--></script> 
<?php echo $footer; ?>