<div data-modules="heroBannerSlider" class="hero-banner-slider hero-banner-slider-js" data-slide-dots-text="False" data-slide-infinite="False" data-slide-autoplay-speed="<?php echo $time*1000; ?>">
	<?php foreach ($banners as $banner) { ?>
    <div class="hero-banner-standard theme-blue-rich" role="banner">
        <div class="card col-12">
            <div class="card-section feature-img " data-imagizer>
                <picture>
                    <source srcset="<?php echo $banner['image_mobile']; ?>" media="(max-width: 991px)">
                    <source srcset="<?php echo $banner['image']; ?>">
                    <img src="<?php echo $banner['image_mobile']; ?>" alt="<?php echo trim(html_entity_decode(strip_tags(html_entity_decode($banner['html'], ENT_QUOTES, 'UTF-8')))); ?>" />
                </picture>
            </div>
            <div class="card-section content card-section_content row">
                <div class="card-column">
                    <div class="card-content-wrapper card-column__content">
                        <div class="heading"><?php echo html_entity_decode($banner['html']); ?></div>
                        <?php if($banner['link']) { ?>
                        	<a class="cta-link-button mgt-sm-30 w-md-auto" href="<?php echo $banner['link']; ?>" filter-key=""><?php echo $banner['name_link']; ?></a>
                      	<?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
