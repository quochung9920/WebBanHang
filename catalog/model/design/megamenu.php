<?php
class ModelDesignMegamenu extends Model {

	public function listSubWithoutUl($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<div class="submenu-navigation__group-title js-group-title" role="menuitem" target-group="js-menu-group-<?php echo $key_parent; ?>">
				<?php if($value['image']) { ?>
                	<img class="preview" data-src="image/<?php echo $value['image']; ?>" src="image/place-holder.png" alt="<?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?>" width=100 height=100 />
            	<?php } ?>
                <span><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></span>
            </div>
					<?php
					$this->listSubWithoutUl2($value['id'], $key_parent);
			endforeach ;
		}
	}
	public function listSubWithoutUl2($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<div role="menuitem" class="submenu-navigation__group-item js-menu-group-<?php echo $key_parent; ?>">
                <a href="<?php echo $value['url']; ?>"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
            </div>
					<?php
					$this->listSubWithoutUl2($value['id'], $key_parent);
			endforeach ;
		}
	}

	public function listSubWithoutUl_Mobile($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$query_parent = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$id_parent_next = 0;
		if($query_parent->row){
			$query_parent_parents = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$query_parent->row['parent_id']."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
			//print_r($query_parent_parents);
			if($query_parent_parents->rows){
				foreach ($query_parent_parents->rows as $key_query_parent_parents => $value_query_parent_parents) {
					if($value_query_parent_parents['id'] == $query_parent->row['id']){
						if(isset($query_parent_parents->rows[$key_query_parent_parents+1])){
							$id_parent_next = $query_parent_parents->rows[$key_query_parent_parents+1]['id'];
						}
					}
				}
			}
		}
		$query_child_nexts=array();
		if($id_parent_next){
			$query_parent_nexts = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$id_parent_next."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
			if($query_parent_nexts->row){
				$title_next = json_decode(base64_decode($query_parent_nexts->row['title']), true);
				if(!html_entity_decode(html_entity_decode($title_next[$lang_id]))) {
					// $query_child_nexts = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$query_parent_nexts->row['id']."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
					$query_child_nexts = $query_parent_nexts->row['id'];
				}
			}
		}
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<?php if (html_entity_decode(html_entity_decode($title[$lang_id]))) { ?>
			<div class="main-navigation__main-item has-submenu js-menu-item hide-for-large js-menu-expand-icon">
			    <a href="javascript:void(0)" class="main-navigation__main-item-link click-disable"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
			    <span class="expand-icon hide-for-large"></span>
			    <div class="submenu-navigation js-sub-menu">
			    	<a class="menu-item-link hide-for-large js-sub-menu-title" href="javascript:void(0)"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
					<?php
						$this->listSubWithoutUl2_Mobile($value['id'], $key_parent); 
						// $title_next = json_decode(base64_decode($result[$key+1]['title']), true);
						// if (!html_entity_decode(html_entity_decode($title_next[$lang_id]))) {
						//  	$this->listSubWithoutUl2_Mobile($result[$key+1]['id'], $key_parent); 
						// }
						if($query_child_nexts){
							$this->listSubWithoutUl2_Mobile($query_child_nexts, $key_parent); 
						}
					?>
				</div>
			</div> 
			<?php } ?>
		<?php endforeach ;
		}
	}

	
	public function listSubWithoutUl2_Mobile($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<div class="submenu-navigation-item">
	            <a class="submenu-navigation-item_link" href="<?php echo $value['url']; ?>"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
	        </div>
					<?php
					$this->listSubWithoutUl2_Mobile($value['id'], $key_parent);
			endforeach ;
		}
	}

	public function listSubWithoutUl_Footer($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
					<?php if($key>0) { ?>
						<li><span class="group-tag">&nbsp;</span></li>
					<?php } ?>
					<li>
		                <a class="group-tag" href="<?php echo $value['url']; ?>"><?php if(html_entity_decode(html_entity_decode($title[$lang_id]))) echo html_entity_decode(html_entity_decode($title[$lang_id])); else echo ' '; ?></a>
		            </li>
					<?php
					$this->listSubWithoutUl2_Footer($value['id'], $key_parent);
			endforeach ;
		}
	}

	public function listSubWithoutUl2_Footer($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<li>
                <a href="<?php echo $value['url']; ?>"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
            </li>

					<?php
					$this->listSubWithoutUl2_Footer($value['id'], $key_parent);
			endforeach ;
		}
	}

	public function listSubWithoutUl_FooterMobile($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$query_parent = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$id_parent_next = 0;
		if($query_parent->row){
			$query_parent_parents = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$query_parent->row['parent_id']."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
			//print_r($query_parent_parents);
			if($query_parent_parents->rows){
				foreach ($query_parent_parents->rows as $key_query_parent_parents => $value_query_parent_parents) {
					if($value_query_parent_parents['id'] == $query_parent->row['id']){
						if(isset($query_parent_parents->rows[$key_query_parent_parents+1])){
							$id_parent_next = $query_parent_parents->rows[$key_query_parent_parents+1]['id'];
						}
					}
				}
			}
		}
		$query_child_nexts=array();
		if($id_parent_next){
			$query_parent_nexts = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$id_parent_next."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
			if($query_parent_nexts->row){
				$title_next = json_decode(base64_decode($query_parent_nexts->row['title']), true);
				if(!html_entity_decode(html_entity_decode($title_next[$lang_id]))) {
					// $query_child_nexts = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$query_parent_nexts->row['id']."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
					$query_child_nexts = $query_parent_nexts->row['id'];
				}
			}
		}
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
			<?php if (html_entity_decode(html_entity_decode($title[$lang_id]))) { ?>
			<div class="columns col-12 col-md-2 accordion-item-mobile" data-accordion-item>
	            <a class="group-tag" href="javascript:void(0)"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
	            <div class="row accordion-content-mobile" data-tab-content>
	                <ul class="menu-group">
	                	<?php
							$this->listSubWithoutUl2_FooterMobile($value['id'], $key_parent); 
							if($query_child_nexts){
								$this->listSubWithoutUl2_FooterMobile($query_child_nexts, $key_parent); 
							}
						?>
	                </ul>
	            </div>
	        </div>
			<?php } ?>
		<?php endforeach ;
		}
	}

	public function listSubWithoutUl2_FooterMobile($parent_id, $key_parent) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode(base64_decode($value['title']), true);
				if($value['type']=='page')
					$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
				if($value['type']=='category')
					$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
				if($value['type']=='thread')
					$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
				if($value['type']=='infomation')
					$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
				if($value['type']=='manufacturer')
					$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					?>
					<li role="footer-menuitem">
                        <a href="<?php echo $value['url']; ?>"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a>
                    </li>
					<?php
					$this->listSubWithoutUl2_FooterMobile($value['id'], $key_parent);
			endforeach ;
		}
	}
	
	public function list_submenu_mega($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."'");
		
		$parent_info = $query->row;
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		
		$result=array();
		foreach ($query->rows as $value) {
			if($value['type']=='page')
				$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
			if($value['type']=='category')
				$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
			if($value['type']=='thread')
				$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
			if($value['type']=='infomation')
				$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
			if($value['type']=='manufacturer')
				$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
			
			$value['title'] = json_decode(base64_decode($value['title']), true);
			
			$result[] = $value;
		}
		
		$content = json_decode(base64_decode($parent_info['subcontent']), true);
		
		if (isset($content[$lang_id])) {
			$content = html_entity_decode(html_entity_decode($content[$lang_id]));
		} else {
			$$content = '';
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_menu_mega.tpl');
		}

	}

	public function list_submenu_mega_mobile($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."'");
		
		$parent_info = $query->row;
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		
		$result=array();
		foreach ($query->rows as $value) {
			if($value['type']=='page')
				$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
			if($value['type']=='category')
				$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
			if($value['type']=='thread')
				$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
			if($value['type']=='infomation')
				$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
			if($value['type']=='manufacturer')
				$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
			
			$value['title'] = json_decode(base64_decode($value['title']), true);
			
			$result[] = $value;
		}
		
		$content = json_decode(base64_decode($parent_info['subcontent']), true);
		
		if (isset($content[$lang_id])) {
			$content = html_entity_decode(html_entity_decode($content[$lang_id]));
		} else {
			$$content = '';
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_menu_mega_mobile.tpl');
		}

	}


	public function list_submenu_mega_footer($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."'");
		
		$parent_info = $query->row;
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		
		$result=array();
		foreach ($query->rows as $value) {
			if($value['type']=='page')
				$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
			if($value['type']=='category')
				$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
			if($value['type']=='thread')
				$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
			if($value['type']=='infomation')
				$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
			if($value['type']=='manufacturer')
				$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
			
			$value['title'] = json_decode(base64_decode($value['title']), true);
			
			$result[] = $value;
		}
		
		$content = json_decode(base64_decode($parent_info['subcontent']), true);
		
		if (isset($content[$lang_id])) {
			$content = html_entity_decode(html_entity_decode($content[$lang_id]));
		} else {
			$$content = '';
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_menu_mega_footer.tpl');
		}

	}


	public function list_submenu_mega_footer_mobile($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.id = '".$parent_id."'");
		
		$parent_info = $query->row;
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		
		$result=array();
		foreach ($query->rows as $value) {
			if($value['type']=='page')
				$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
			if($value['type']=='category')
				$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
			if($value['type']=='thread')
				$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
			if($value['type']=='infomation')
				$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
			if($value['type']=='manufacturer')
				$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
			
			$value['title'] = json_decode(base64_decode($value['title']), true);
			
			$result[] = $value;
		}
		
		$content = json_decode(base64_decode($parent_info['subcontent']), true);
		
		if (isset($content[$lang_id])) {
			$content = html_entity_decode(html_entity_decode($content[$lang_id]));
		} else {
			$$content = '';
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_menu_mega_footer_mobile.tpl');
		}

	}
	
	public function list_submenu($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		
		$result=array();
		foreach ($query->rows as $value) {
			if($value['type']=='page')
				$value['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
			if($value['type']=='category')
				$value['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
			if($value['type']=='thread')
				$value['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
			if($value['type']=='infomation')
				$value['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
			if($value['type']=='manufacturer')
				$value['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
			
			$value['title'] = json_decode(base64_decode($value['title']), true);
			$value['total'] = $this->getTotalMenu($value['id']);
			
			$result[] = $value;
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_menu.tpl');
		}
	}
	
	public function getlist() {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '0' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
	  $result=array();
	  foreach ($query->rows as $value) {
				$result[] = $value;
	  }
	  return $result;
	}

	public function getTotalMenu($parent_id) {
      $query = $this->db->query("SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "megamenu WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
	  return $query->row['total'];
	}
	
	public function getOptions(){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu_options");
		return $query->rows ? $query->rows : array();
	}
}