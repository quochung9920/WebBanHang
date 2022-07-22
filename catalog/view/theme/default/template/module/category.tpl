<div class="browse-products">
  <div class="tabs-content" data-tabs-content="deeplinked-tabs">
    <div class="tabs-panel is-active" id="panel1d">
      <div class="browse-products__products-list products-list row js-browse-products" data-modules="browseProducts">
        <?php foreach ($categories as $category) { ?>
        <div class="img-text-block theme-white d-flex flex-direction-column pdt-sm-10 pdt-md-10 pdbt-sm-0 ">
          <a href="<?php echo $category['href']; ?>" class="img-text-block__img pd-sm-0 d-flex">
             <picture>
                <source srcset="<?php echo $category['thumb']; ?>" media="(max-width: 991px)">
                <source srcset="<?php echo $category['thumb_desktop']; ?>">
                <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
              </picture>
          </a>
          <div class="img-text-block__content js-img-block__content  pdt-sm-10 pdt-md-10    text-sm-center  justify-content-start d-flex">
            <div class="img-text-block__description">
              <p><strong><?php echo $category['name']; ?></strong></p>
            </div>
            <div class="img-text-block__link mgt-auto">
              <a href="<?php echo $category['href']; ?>" class="cta-link-button -small"><?php echo $text_muahang; ?></a>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</div>