<?php echo $header; ?>
<?php if (!$page_content) { ?>
  <div class="body-container" timestamp=" 02:01:54"=styleInline=dataCategory>
    <?php echo $column_left; ?>
    <?php echo $content_top; ?>
    <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
  </div>
<?php } else { ?>
  <?php echo $page_content; ?>
<?php } ?>
<?php echo $footer; ?>