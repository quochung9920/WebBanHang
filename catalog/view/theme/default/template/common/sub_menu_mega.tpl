<div class="submenu-navigation js-sub-menu">
    <a class="menu-item-link hide-for-large js-sub-menu-title" href="#">...</a>
    <?php foreach($result as $key=> $value) { ?>
    <div class="submenu-navigation__group" role="menu">
        <?php $this->listSubWithoutUl($value['id'], $key+1);?>
    </div>
    <?php } ?>
</div>