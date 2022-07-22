<?php
class ModelDesignNavigation extends Model {
	public function insert($data) {
		foreach($data['title'] as $key=>$value){
			$title = array_map("htmlentities", $value);
			/*$content = array_map("htmlentities", $data['content_submenu'][$key]);*/
			$title = json_encode($title);
			/*$content = json_encode($content);*/
			$this->db->query("INSERT INTO " . DB_PREFIX . "navigation SET title = '" . $this->db->escape($title). "', url = '" . $this->db->escape($data['url'][$key]) . "', parent_id = '" . (int)$data['parent_id'][$key] ."', type = '".$data['type'][$key]."', type_id = '" .(int)$data['type_id'][$key]. "', activemega = '" .(int)$data['activemega'][$key] . "'");
		}
	}
	
	public function empty_data() {
		$this->db->query("TRUNCATE " . DB_PREFIX . "navigation");
	}
	
	public function getDefaultLanguage(){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "language WHERE code = '" . $this->config->get('config_language') . "'");
		return $query->row ? $query->row['language_id'] : 0;
	}
	
	public function getMenuHtml($parent_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "navigation  WHERE " . DB_PREFIX . "navigation.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "navigation.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		
		$this->load->language('design/navigation');
		
		/* Multi Language */
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

		$text_explane = $this->language->get('text_explane');
		$text_collapse = $this->language->get('text_collapse');
		$text_remove = $this->language->get('text_remove');
		$text_active_mega = $this->language->get('text_active_mega');
		$text_deactivate_mega = $this->language->get('text_deactivate_mega');
		
		$entry_type = $this->language->get('entry_type');
		$entry_title = $this->language->get('entry_title');
		$entry_url = $this->language->get('entry_url');
		$entry_column = $this->language->get('entry_column');
		$entry_width = $this->language->get('entry_width');
		$entry_content = $this->language->get('entry_content');

		if($result) :
		if($parent_id!=0) echo "<ol class='dd-list'>";foreach($result as $value) : ?><?php $title = json_decode($value['title'], true); ?><li class='dd-item <?php if($value["activemega"]==1) {echo 'activemega';} ?>'><div class='dd-handle'><div class='bar'><span class='title'><?php echo html_entity_decode($title[$this->getDefaultLanguage()]);?></span></div></div><div class='info hide'><p class="input-item"><span class='type'><?php echo $value['type'];?></span></p><?php foreach($languages as $language) : ?><div class="input-group"><input class="form-control" type="text" name="title[][<?php echo $language['language_id']; ?>]" value="<?php if(isset($title[$language['language_id']])) echo $this->db->escape(html_entity_decode(html_entity_decode($title[$language['language_id']])));?>"/><div class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>"/></div></div><?php endforeach;?><?php if($value['type']=='custom') : ?><p class="input-item"><label>Url</label><input class="form-control" type="text" name="url[]" value="<?php echo $value['url'] ; ?>"/></p><?php endif;?><p class="input-item"><a class="remove" onclick="remove_item(this);"><?php echo $text_remove; ?></a></p><?php if($value['activemega']==1) : ?><p class="input-item"><a  href="javascript:void(0);" class="activemega" onclick="activemega(this);" ><?php echo $text_deactivate_mega; ?></a></p><?php else : ?><p class="input-item"><a  href="javascript:void(0);" class="activemega active" onclick="activemega(this);"><?php echo $text_active_mega; ?></a></p><?php endif;?><div class="hidden-data"><input type="hidden" class="type" name="type[]" value="<?php echo $value['type'];?>"/><input type="hidden" class="parent_id" name="parent_id[]" value="<?php echo $value['parent_id'];?>"/><input type="hidden" class="type_id" name="type_id[]" value="<?php echo $value['type_id'];?>"/><?php if($value['type']!='custom') : ?><input type="hidden" class="url" name="url[]" value="<?php echo $value['url'] ; ?>"/><?php endif;?><?php if($value['activemega']==1) : ?><input type="hidden" class="activemega" name="activemega[]" value="1"/><?php else : ?><input type="hidden" class="activemega" name="activemega[]" value="0"/><?php endif;?></div></div><a class="explane" onclick="explane(this)"><?php echo $text_explane; ?></a><?php $this->model_design_navigation->getMenuHtml($value['id']);?></li><?php endforeach ; if($parent_id!=0) echo "</ol>"; endif;
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