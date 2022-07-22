<?php if ($status == 1) { ?>
<div id="banner-grid<?php echo $module; ?>" class="banner-grid">
  <div class="row">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div class="<?php echo $perrow_id; ?> moderns"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" />
      <div class="overlay">
        <h5><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></h5>
        <p><?php echo $banner['description'];?></p>
        </p>
      </div>
    </div>
    <?php } else { ?>
    <div class="<?php echo $perrow_id; ?> moderns"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" />
      <div class="overlay">
        <h5><?php echo $banner['title']; ?></h5>
        <p><?php echo $banner['description'];?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<?php } else if ($status == 2) { ?>

<div class="mgt-sm-50 mgbt-sm-40 d-flex flex-direction-column"></div>
<?php foreach ($banners as $key => $banner) { ?>
<?php if ($key == 0) { ?>
<div class="img-text-block mgbt-sm-0 d-flex">
  <div class="img-text-block__content js-img-block__content pdbt-sm-10 pdbt-md-10 text-sm-centerjustify-content-start d-flex">
    <div class="img-text-block__title order-1 text-sm-center">
      <h2><?php echo $banner['title']; ?></h2>
    </div>
    <div class="img-text-block__description order-3">
      <div style="text-align: center; font-size: 18px;"><em><?php echo $banner['description']; ?></em></div>
    </div>
  </div>
</div>
<?php } ?>
<?php } ?>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class=" mgt-sm-0 mgbt-sm-50 d-flex flex-direction-column">
                <div class=" row mgl-sm-0 mgr-sm-0">
                  <?php foreach ($banners as $key => $banner) { ?>
                  <?php if ($key > 0) { ?>
                    <div class="grid d-flex textimageblock col-12 flex-md-1 display-mode-auto pdr-sm-0 pdl-sm-0">
                        <div class="img-text-block mg-sm-10 mg-md-20 -border pdt-sm-20 pdt-md-20 pdbt-sm-0 pdbt-md-10">
                            <div class="img-text-block__img pd-sm-0 d-flex">
                              <picture>
                                <source srcset="<?php echo $banner['image_mobile']; ?>" media="(max-width: 991px)">
                                <source srcset="<?php echo $banner['image']; ?>">
                                <img class="height-50" src="<?php echo $banner['image_mobile']; ?>" alt="<?php echo $banner['title']; ?>" />
                              </picture>
                            </div>
                            <div class="img-text-block__content js-img-block__content pdt-sm-10 pdt-md-10 pdr-sm-10 pdr-md-10 pdl-sm-10 pdl-md-10 text-sm-center justify-content-start d-flex">
                                <div class="img-text-block__description order-1">
                                    <strong><?php echo $banner['title']; ?></strong>
                                </div>
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

<?php } else if ($status == 3) { ?>


<div class="full-width video-block-nopadding img-text-block__simple-video">
  <div data-modules="video" class="img-text-block__video pd-sm-0 d-flex js-video-block" style="height:inherit;" autoplay="true">
    <?php foreach ($banners as $key => $banner) { ?>
    <?php if(strpos($banner['link'], 'youtube.com') !== false) { 
      preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $banner['link'], $matches);
        $html_video = '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/'.$matches[1].'?rel=0
" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
        $code_youtube = $matches[1];
      } else if (strpos($banner['link'], 'youtu.be') != false) {
        $matches = str_replace( 'https://youtu.be/', '', $banner['link'] );
        $html_video = '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/'.$matches.'?rel=0" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
        $code_youtube = $matches;
      } else {
        $code_youtube = $banner['link'];
        $html_video = '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/'.$banner['link'].'?rel=0" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
      } ?>
      <?php echo html_entity_decode($html_video);?>
    <?php } ?>
  </div>
</div>

<?php } else if ($status == 4) { ?>


<div class="mgt-sm-0 mgbt-sm-10 d-flex flex-direction-column">
    <div class="row mgl-sm-0 mgr-sm-0">
      <?php foreach ($banners as $key => $banner) { ?>
        <div class="grid d-flex textimageblock col-lg-6 col-md-6 col-12 displaymode-half pdr-sm-0 pdl-sm-0">
            <div class="img-bg-block height-600 mgt-sm-10 mgr-md-0">
                <img class="lazy height-600" data-src-desktop="<?php echo $banner['image']; ?>" data-src-mobile="<?php echo $banner['image']; ?>" src="image/place-holder.png" alt="<?php echo $banner['title']; ?>" width=950 height=600 />
                <div class="img-bg-block__content js-img-block__content pdt-sm-30 pdt-md-30 pdr-sm-20 pdr-md-120 pdbt-sm-30 pdbt-md-30 pdl-sm-20 pdl-md-120 text-sm-left">
                    <div class="img-bg-block__content_container  d-flex justify-content-center">
                        <div class="img-bg-block__title order-1 text-sm-left"><?php echo $banner['title']; ?></div>
                        <div class="img-bg-block__description order-3"><?php echo nl2br($banner['description']); ?></div>
                        <?php if($banner['link']) { ?>
                          <div class="img-bg-block__link order-4">
                            <a href="<?php echo $banner['link']; ?>" class="cta-link-icon"><?php if ($banner['name_link']) echo $banner['name_link']; else echo $banner['link']; ?></a>
                          </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
      <?php } ?>
    </div>
</div>


<?php } else if ($status == 5) { ?>

<?php } else if ($status == 6) { ?>

<?php } else if ($status == 7) { ?>

<?php } else if ($status == 8) { ?>

<?php } else if ($status == 9) { ?>

<?php } else if ($status == 10) { ?>

<?php } else if ($status == 11) { ?>

<?php } else if ($status == 12) { ?>

<div id="banner-grid<?php echo $module; ?>" class="banner-grid bannerhome">
  <div class="row">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div class="<?php echo $perrow_id; ?> moderns"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" />
      <div class="overlay">
        <h5><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></h5>
        <p><?php echo $banner['description'];?></p>
        </p>
      </div>
    </div>
    <?php } else { ?>
    <div class="<?php echo $perrow_id; ?> moderns"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" />
      <div class="overlay">
        <h5><?php echo $banner['title']; ?></h5>
        <p><?php echo $banner['description'];?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
  </div>
</div>

<?php } else { } ?>