<?php
class ModelDesignNavigation extends Model {
	
	public function listSubWithoutUl($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "navigation.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		if($result){
			foreach($result as $key=> $value) :
				$title = json_decode($value['title'], true);
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
					<li><a href="<?php echo $value['url']; ?>"><?php echo html_entity_decode(html_entity_decode($title[$lang_id])); ?></a></li>
					<?php
					$this->listSubWithoutUl($value['id']);
			endforeach ;
		}
	}

	public function list_submenu_mega($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.id = '".$parent_id."'");
		
		$parent_info = $query->row;
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "navigation.id ASC");
		
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
			
			$value['title'] = json_decode($value['title'], true);
			
			$result[] = $value;
		}
		
		$content = json_decode($parent_info['subcontent'], true);
		
		if (isset($content[$lang_id])) {
			$content = html_entity_decode(html_entity_decode($content[$lang_id]));
		} else {
			$$content = '';
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_nav_mega.tpl');
		}

	}

	public function list_submenu($parent_id) {
		$lang_id = $this->config->get('config_language_id');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "navigation.id ASC");
		
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
			
			$value['title'] = json_decode($value['title'], true);
			
			$result[] = $value;
		}
		
		if($result) {
			include(DIR_TEMPLATE . 'default/template/common/sub_nav.tpl');
		}
	}

	public function getlist() {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.parent_id = '0' ORDER BY " . DB_PREFIX . "navigation.id ASC");
	  $result=array();
	  foreach ($query->rows as $value) {
				$result[] = $value;
	  }
	  return $result;
	}



	
}
?>