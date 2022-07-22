<?php $lang_id = $this->registry->get('config')->get('config_language_id'); ?>
<?php foreach ($menus_root as $menu) { ?>
<?php $title = json_decode(base64_decode($menu['title']), true); ?>
<div class="main-navigation__main-item has-submenu js-menu-expand-icon js-menu-item hide-for-small-only" role="menuitem" aria-haspopup="true" aria-label="<?php echo html_entity_decode(html_entity_decode($title[$lang_id])) ?>">
  <a href="<?php echo $menu['url']; ?>" class="main-navigation__main-item-link click-disable"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])) ?></a>
  <span class="expand-icon hide-for-large"></span>
  <?php
    if($menu['activemega'] == 1)
      $proMegaMenuModel->list_submenu_mega($menu['id']);
    else { ?>
      <?php if ($menu['total']) { ?>
        <div class="submenu-navigation submenu-navigation-profile js-sub-menu list_submenu">
          <?php $proMegaMenuModel->list_submenu($menu['id']); ?>
        </div>
      <?php } ?>
    <?php } ?>
</div>
<?php } ?>



<?php foreach ($menus_root as $menu) { 
  if($menu['activemega'] == 1)
    $proMegaMenuModel->list_submenu_mega_mobile($menu['id']);
  else {
    ?>
    <?php $title = json_decode(base64_decode($menu['title']), true); ?>
      <div class="main-navigation__main-item has-submenu js-menu-item hide-for-large js-menu-expand-icon">
        <a href="<?php echo $menu['url']; ?>" class="main-navigation__main-item-link click-disable"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])) ?></a>
        <?php if ($menu['total']) { ?>
          <span class="expand-icon hide-for-large"></span>
          <div class="submenu-navigation submenu-navigation-profile js-sub-menu list_submenu">
            <a class="menu-item-link hide-for-large js-sub-menu-title" href="javascript:void(0)"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])) ?></a>
            <?php $proMegaMenuModel->list_submenu($menu['id']); ?>
          </div>
        <?php } ?>
      </div>
  <?php }
} ?>