<?php if (count($languages) > 1) { ?>
<div class="main-navigation__main-item-link language-selection option-right-content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
    <div class="dropbtnLink language-selection__drop-btn-link">
        <span class="language-selection__separate"></span>
        <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code) { ?>
        <div class="d-flex">
            <svg viewBox="0 0 22 22" class="inline-icon hide-for-large">
                <use xlink:href="#globe"></use>
            </svg>
            <span class="current"><?php echo $language['name']; ?></span><span class="hidden-arrow"></span>
        </div>
        <?php } ?>
        <?php } ?>
        
    </div>
    <ul class="language-dropdown">
      <?php foreach ($languages as $language) { ?>
      <?php if ($language['code'] != $code) { ?>
        <li>
            <a href="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></a>
        </li>
      <?php } ?>
      <?php } ?>
    </ul>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </form>
</div>
<?php } ?>
