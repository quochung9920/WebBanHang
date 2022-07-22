<?php echo $header; ?>
<link href="catalog/view/theme/default/stylesheet/css/blog-listing-page.css" rel="stylesheet">
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="item"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a></li>
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
      <?php if (strip_tags($description) != '') { ?>
        <div class="box-content row"> <?php echo $description; ?> </div>
      <?php }?>
      


      <div class="blog-listing-page js_blog-listing-page d-flex container " paging-pagesize="6" paging-pagenumber="1" paging-totalitem="10" paging-hasmore="True" block-listing-id="99467">
          <div class="js_blog-listing-page__block mgt-sm-50 mgr-md-minus-10  mgl-md-minus-10 d-flex flex-direction-column">
              <div class="js_blog-listing-page__container row mgl-sm-0 mgr-sm-0">

                <?php foreach ($posts as $post) { ?>
                  <div class="js_blog-listing-page__card-item-wrapper grid d-flex textimageblock col-lg-4 col-md-4 col-12 displaymode-one-third mgbt-sm-40">
                      <div data-modules="blogListing" class="blog-listing-page__card-item img-text-block d-flex flex-direction-column">
                          <div class="img-text-block__img blog-listing-page__card-item-img-wrapper pd-sm-0 d-flex">
                              <a href="<?php echo $post['href']; ?>" target="">
                                  <img class="js_img__preload w-100-percent" src="<?php echo $post['image']; ?>" alt="<?php echo $post['title']; ?>" width="999" height="666">
                              </a>
                          </div>
                          <div class="img-text-block__content blog-listing-page__card-item-content js-img-block__content d-flex mgt-sm-10">
                              <a href="<?php echo $post['href']; ?>" target="" class="img-text-block__title text-sm-left blog-listing-page__card-item-title"><?php echo $post['title']; ?></a>
                          </div>
                          <div class="img-text-block__description blog-listing-page__card-item-description js_blog-listing-page__card-item-description"><?php echo $post['short_description']; ?></div>
                          <div class="img-text-block__link mgt-sm-10">
                              <a href="<?php echo $post['href']; ?>" target="" class="cta-link-button "><?php echo $text_see_more; ?></a>
                          </div>
                      </div>
                  </div>
                <?php } ?>

              </div>
          </div>
      </div>


      <div class="col-sm-12 text-left" style="text-align: center;"><?php echo $pagination; ?></div>
      <div class="row"> </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 