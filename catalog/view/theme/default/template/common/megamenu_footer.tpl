<?php $lang_id = $this->registry->get('config')->get('config_language_id'); ?>
<?php foreach ($menus_root as $menu) { ?>
<?php $title = json_decode(base64_decode($menu['title']), true); ?>
<?php
  if($menu['activemega'] == 1)
    $proMegaMenuModel->list_submenu_mega_footer($menu['id']);
?>
<?php } ?>