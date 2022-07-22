<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div id="tf-panel-user" class="tf-tabs-panel">
  <div>
    <div lang="vi" class="article review translate-section customer-review">
      <div class="header notranslate">
        <div class="score hcol">
          <div class="tf-stars tf-stars-svg"><span style="width: <?php echo $review['rating']*100/5; ?>%;" class="tf-stars-svg"></span></div>
        </div>
        <div class="author hcol"><?php echo $review['author']; ?></div><time datetime="<?php echo $review['date_added']; ?>" class="date hcol not-xs"><?php echo $review['date_added']; ?></time>
      </div>
      <div class="content">
        <div class="extract">
          <p class="formatted"><?php echo $review['text']; ?></p>
          </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>
<div><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>