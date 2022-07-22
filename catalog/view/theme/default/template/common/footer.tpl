    </div>
</div>


<footer role="group" class="footer">
    <!--Desktop menu-->
    <div class="content-container row accordion-mobile hide-for-small">
        <?php echo $megamenu_footer; ?>
        <div class="columns col-12 col-md-2 accordion-item-mobile">
            <div class="row accordion-content-mobile">
                <ul class="menu-group">
                    <li><a class="group-tag" href="javascript:void(0)"><?php echo $text_information; ?></a></li>
                    <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>

    <!--Mobile Menu-->
    <div class="content-container row accordion-mobile hide-for-large" data-allow-all-closed="true" data-accordion>
        <?php echo $megamenu_footer_mobile; ?>
        <div class="columns col-12 col-md-2 accordion-item-mobile" data-accordion-item>
            <a class="group-tag" href="javascript:void(0)"><?php echo $text_information; ?></a>
            <div class="row accordion-content-mobile" data-tab-content>
                <ul class="menu-group">
                    <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>

    <div class="footer-info">
        <div class="content-container">
            <div class="social-share col-12 col-md-12 pdl-sm-0 pdr-sm-0">
                <ul role="menu">
                    <?php if($facebook){ ?>
                        <li role="menuitem" class="icons"><a href="<?php echo $facebook; ?>" target="_blank"><img class="preview" data-src="image/social-icon/facebook.svg" src="image/place-holder.png" alt="<?php echo $store_name; ?> Facebook" width=100 height=100></a></li>
                    <?php } ?>
                    <?php if($youtube){ ?>
                        <li role="menuitem" class="icons"><a href="<?php echo $youtube; ?>" target="_blank"><img class="preview" data-src="image/social-icon/youtube.svg" src="image/place-holder.png" alt="<?php echo $store_name; ?> YouTube" width=100 height=100></a></li>
                    <?php } ?>
                    <?php if($twitter){ ?>
                        <li role="menuitem" class="icons"><a href="<?php echo $twitter; ?>" target="_blank"><img class="preview" data-src="image/social-icon/twitter.svg" src="image/place-holder.png" alt="<?php echo $store_name; ?> Twitter" width=100 height=100></a></li>
                    <?php } ?>
                    <?php if($pinterest){ ?>
                        <li role="menuitem" class="icons"><a href="<?php echo $pinterest; ?>" target="_blank"><img class="preview" data-src="image/social-icon/pinterest.svg" src="image/place-holder.png" alt="<?php echo $store_name; ?> Pinterest" width=100 height=100></a></li>
                    <?php } ?>
                    <?php if($instagram){ ?>
                        <li role="menuitem" class="icons"><a href="<?php echo $instagram; ?>" target="_blank"><img class="preview" data-src="image/social-icon/instagram.svg" src="image/place-holder.png" alt="<?php echo $store_name; ?> Instagram" width=100 height=100></a></li>
                    <?php } ?>
                </ul>
                <!-- <div class="copyright">
                    <div class="content-container">
                        <span><a href="" rel="noreferrer noopener nofollow"><?php echo $store_name; ?></a></span>
                    </div>
                </div> -->
            </div>
        </div>

        <div class="copyright">
            <div class="content-container">
                <div class="col-12 col-lg-6 pdl-sm-0">
                    <p><?php echo $about_us; ?></p>
                    <div class="mgbt-sm-50 mgbt-md-0">&nbsp;</div>
                </div>
                <div class="col-12 col-lg-6 menu-footer">
                    <?php foreach ($informations2 as $key => $information) { ?>
                    <span><a href="<?php echo $information['href']; ?>" rel="noreferrer noopener nofollow" title="<?php echo $information['title']; ?>"><?php echo $information['title']; ?></a> <span> | </span></span>
                    <?php } ?>
                    <span>
                        <a href="<?php echo $sitemap; ?>" rel="noreferrer noopener nofollow" title="<?php echo $text_sitemap; ?>"><?php echo $text_sitemap; ?></a>
                    </span>
                    <div class="menu-footer-license hidden">
                        <div class="full-text-module w-100-percent">
                            <div class="content-container ">
                                <a class="text-md-right text-left w-100-percent" href="#"><img src="image/bocongthuong.png" alt="web lisence" width="182" height="69" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>


<style>
    .interest-rate__shape {
        width: 47px
    }

    .interest-rate__percentage,
    .interest-rate__text {
        left: 5px
    }

    @media (max-width: 320px) {
        .interest-rate__shape {
            width: 45px
        }
    }

    @media (min-width: 1025px) {
        .interest-rate__shape {
            width: 60px
        }
    }
</style>

<div class="sticky-support-block js_sticky-support-block">
    <a class="call-to-support js_call-to-support" href="tel:<?php echo $telephone; ?>" title="<?php echo $telephone; ?>">
        <svg viewBox="0 0 57 57" class="icon-call">
            <use xlink:href="#call-icon"></use>
        </svg>
    </a>
    <span class="call-to-support-number-div">
            <p class="call-to-support-number">
                <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
            </p>
        </span>
</div>


<div class="v-modal add-to-cart-modal" style="display: none;">
    <div class="v-modal__content-wrapper">
        <div class="v-modal__content-header"><svg viewBox="0 0 48 48" class="v-modal__close-btn">
                <use xlink:href="#close-icon"></use>
            </svg></div>
        <div class="v-modal__content">
            <div class="add-to-cart-modal__success-icon"></div>
            <p class="text-center mgt-md-20 mgt-sm-20"><?php echo $text_sanphamdaduocthemvaogio; ?></p>
            <div class="add-to-cart-modal__btn-group btn-group mgt-md-30 mgt-sm-30"><a href="<?php echo $checkout; ?>" class="button primary"><?php echo $button_checkout; ?></a><span class="add-to-cart-modal__continue-shopping text-center fw-600"><?php echo $text_tieptucmuasam; ?></span></div>
            <!---->
        </div>
    </div>
    <div class="v-modal__backdrop"></div>
</div>


<div class="v-modal select-location-modal v-modal--no-padding" style="display: none;">
    <div class="v-modal__content-wrapper">
        <div class="v-modal__content-header"><svg viewBox="0 0 48 48" class="v-modal__close-btn">
                <use xlink:href="#close-icon"></use>
            </svg></div>
        <div class="v-modal__content">
            <div class="select-location-modal__content-wrapper" style="">
                <div class="select-location-modal__img-wrap" style="background: url(image/select-location.jpg) center center no-repeat;"></div>
                <div class="select-location-modal__content">
                    <div class="select-location-modal__title"><?php echo $text_khuvuccuaban; ?></div>
                    <div class="select-location-modal__text"><?php echo $text_luachonkhuvuc; ?></div>
                    <div class="select-location-modal__form">
                        <form>
                            <div class="select-location-modal__form-field">
                                <div class="select-location-modal__form-field-label"><?php echo $text_tinhthanh; ?></div>
                                <div class="v-selectbox__wrapper"><input type="submit" class="v-selectbox__input">
                                    <div class="v-form-field__label">
                                        <!---->
                                    </div>
                                    <div class="v-selectbox--container pos-relative">
                                        <div tabindex="0" class="v-selectbox">
                                            <div class="v-selectbox__selected placeholder"><?php echo $text_luachontinhthanh; ?></div>
                                            <!---->
                                            <!---->
                                            <div class="v-selectbox__options-container">
                                                <div class="v-selectbox__options"><input tabindex="-1" placeholder="<?php echo $text_luachontinhthanh; ?>" class="v-selectbox__search-input js_search_input_country" oninput="js_search_input_country($(this))">
                                                    <section class="ps-container perfect-scroll-bar scroll-area ps" scrolltop="0" tabindex="-1">
                                                        <div class="js_option_country">
                                                            <?php foreach ($countries as $key_country => $value_country) { ?>
                                                                <div data-value="<?php echo $value_country['country_id']; ?>" class="v-selectbox__option"><?php echo $value_country['name']; ?></div>
                                                            <?php } ?>
                                                        </div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="select-location-modal__form-field">
                                <div class="select-location-modal__form-field-label"><?php echo $text_quanhuyen; ?></div>
                                <div class="v-selectbox__wrapper"><input type="submit" class="v-selectbox__input">
                                    <div class="v-form-field__label">
                                        <!---->
                                    </div>
                                    <div class="v-selectbox--container pos-relative">
                                        <div tabindex="0" class="v-selectbox">
                                            <div class="v-selectbox__selected placeholder"><?php echo $text_luachonquanhuyen; ?></div>
                                            <!---->
                                            <!---->
                                            <div class="v-selectbox__options-container">
                                                <div class="v-selectbox__options"><input tabindex="-1" placeholder="<?php echo $text_luachonquanhuyen; ?>" class="v-selectbox__search-input js_search_input_zone" oninput="js_search_input_zone($(this))">
                                                    <section class="ps-container perfect-scroll-bar scroll-area ps" scrolltop="0" tabindex="-1">
                                                        <div class="js_option_zone"></div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><button class="cta-link-button select-location-modal__form-submit-btn">OK</button>
                        </form>
                    </div>
                </div>
            </div>
            <!---->
        </div>
    </div>
    <div class="v-modal__backdrop"></div>
</div>


</body>
</html>