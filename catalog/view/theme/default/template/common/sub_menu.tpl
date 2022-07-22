<?php foreach($result as $key=>$value) { ?>
	<div class="submenu-navigation-item">
	    <a href="<?php echo $value['url']; ?>">
			<div class="submenu-navigation-item_link"><?php echo html_entity_decode($value['title'][$lang_id]); ?></div>
	    </a>
	    <?php if($value['total']) { ?>
		    <div class="submenu-navigation submenu-navigation-profile js-sub-menu list_submenu">
			    <?php $this->list_submenu($value['id']); ?>
			</div>
		<?php } ?>
    </div>
<?php } ?>
