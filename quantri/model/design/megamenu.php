<?php
class ModelDesignMegamenu extends Model {
	protected $preData = array(
		'menu_height'=>'50',
		'submenu_width'=>'200',
		'submenu_height'=>'35',
		'menu_font_style'=>'uppercase',
		'menu_font_size'=>'15',
		'menu_font_color'=>'ffffff',
		'menu_font_color_hover'=>'ffffff',
		'submenu_font_style'=>'capitalize',
		'submenu_font_size'=>'15',
		'submenu_font_color'=>'464646',
		'submenu_font_color_hover'=>'3cb7e7',
		'menu_background'=>'323a45',
		'menu_background_hover'=>'3cb7e7',
		'submenu_background'=>'e6e6e6',
		'submenu_background_hover'=>'d0d0d0',
	);
	public function getOptions(){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu_options");
		return $query->rows ? $query->rows : array();
	}
	public function saveOptions($data){
		foreach ($data as $key => $value) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_options WHERE name = '" . $key . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_options SET name = '" . $key . "', value = '" . $this->db->escape($value) . "'");
		}
	}
	public function insert($data) {
		foreach($data['title'] as $key=>$value){
			$title = array_map("htmlentities", $value);
/*			$content = array_map("htmlentities", $data['content_submenu'][$key]);*/
			$title = base64_encode(json_encode($title));
		/*	$content = base64_encode(json_encode($content));*/
			$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu SET title = '" . htmlspecialchars_decode($title) . "', image = '" . $data['image'][$key] . "', url = '" . $data['url'][$key] . "', parent_id = '" . (int)$data['parent_id'][$key] ."', type = '".$data['type'][$key]."', type_id = '" .(int)$data['type_id'][$key]. "', activemega = '" .(int)$data['activemega'][$key]. "'");
		}
	}
	public function empty_data() {
			$this->db->query("TRUNCATE " . DB_PREFIX . "megamenu");
	}
	public function getDefaultLanguage(){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "language WHERE code = '" . $this->config->get('config_language') . "'");
		return $query->row ? $query->row['language_id'] : 0;
	}
	public function getMenuHtml($parent_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '".$parent_id."' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
		$result=array();
		foreach ($query->rows as $value) {
			$result[] = $value;
		}
		/* Multi Language */
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		
		$this->load->language('design/megamenu');
		
		$text_explane = $this->language->get('text_explane');
		$text_collapse = $this->language->get('text_collapse');
		$text_remove = $this->language->get('text_remove');
		$text_active_mega = $this->language->get('text_active_mega');
		$text_deactivate_mega = $this->language->get('text_deactivate_mega');
		
		$entry_type = $this->language->get('entry_type');
		$entry_title = $this->language->get('entry_title');
		$entry_image = $this->language->get('entry_image');
		$entry_url = $this->language->get('entry_url');
		$entry_column = $this->language->get('entry_column');
		$entry_width = $this->language->get('entry_width');
		$entry_content = $this->language->get('entry_content');

		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if($result) :
		if($parent_id!=0) echo "<ol class='dd-list'>";
		foreach($result as $value) : ?>
		<?php
			$image = '';
			$thumb = $data['placeholder'];
			if (is_file(DIR_IMAGE . $value['image'])) :
				$image = $value['image'];
				$thumb = $this->model_tool_image->resize($value['image'], 100, 100);
			endif;
			$title = json_decode(base64_decode($value['title']), true);
			//var_dump($title);
			$content = json_decode(base64_decode($value['subcontent']), true);
		?>
		<li class='dd-item <?php if($value["activemega"]==1) {echo 'activemega';} ?>' id="<?php echo $value['id'];?>">
			<div class='dd-handle'>
				<div class='bar'>
					<span class='title'><?php echo html_entity_decode(html_entity_decode($title[$this->getDefaultLanguage()]));?></span>
				</div>
			</div>
			<div class='info hide'>
				<p class="input-item"><span class='type'><?php echo $entry_type; ?> <?php echo $value['type'];?></span></p>
				<p class="input-item"><label>Image : </label><a href="javascript:void(0)" id="thumb-image<?php echo $value['id'];?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $data['placeholder']; ?>" /></a>
                  <input type="hidden" name="image[]" value="<?php echo $image; ?>" id="input-image<?php echo $value['id'];?>" /></p>
				<p class="input-item"><label><?php echo $entry_title; ?> </label></p>
				<?php foreach($languages as $language) : ?>
					<div class="input-group">
						<input class="form-control" type="text" name="title[][<?php echo $language['language_id']; ?>]" value="<?php if(isset($title[$language['language_id']])) echo $this->db->escape(html_entity_decode(html_entity_decode($title[$language['language_id']])));?>"/>
						<div class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>"/></div>
					</div>
				<?php endforeach;?>
				<?php if($value['type']=='custom') : ?>
				<p class="input-item"><label>Url : </label><input class="form-control" type="text" name="url[]" value="<?php echo $value['url'] ; ?>"/></p>
				<?php endif;?>
				<p class="input-item"><a  href="javascript:void(0);" class="remove" onclick="remove_item(this);"> <i class="fa fa-trash"></i> <?php echo $text_remove; ?></a></p>
				<?php if($value['activemega']==1) : ?><p class="input-item"><a  href="javascript:void(0);" class="activemega" onclick="activemega(this);" ><?php echo $text_deactivate_mega; ?></a></p><?php else : ?><p class="input-item"><a  href="javascript:void(0);" class="activemega active" onclick="activemega(this);"><?php echo $text_active_mega; ?></a></p><?php endif;?>
				<div class="hidden-data">
					<input type="hidden" class="type" name="type[]" value="<?php echo $value['type'];?>"/>
					<input type="hidden" class="parent_id" name="parent_id[]" value="<?php echo $value['parent_id'];?>"/>
					<input type="hidden" class="type_id" name="type_id[]" value="<?php echo $value['type_id'];?>"/>
					<?php if($value['type']!='custom') : ?>
					<input type="hidden" class="url" name="url[]" value="<?php echo $value['url'] ; ?>"/>
					<?php endif;?>
					<?php if($value['activemega']==1) : ?><input type="hidden" class="activemega" name="activemega[]" value="1"/><?php else : ?><input type="hidden" class="activemega" name="activemega[]" value="0"/><?php endif;?>
				</div>
				
			</div><a href="javascript:void(0);" class="explane" onclick="explane(this)"><?php echo $text_explane; ?></a>
			<?php
				$this->model_design_megamenu->getMenuHtml($value['id']);
			?>
		</li>
		<?php
		endforeach ;
		if($parent_id!=0) echo "</ol>";
		endif;
	}
	public function getlist() {

      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu  WHERE " . DB_PREFIX . "megamenu.parent_id = '0' ORDER BY " . DB_PREFIX . "megamenu.id ASC");
	  $result=array();
	  foreach ($query->rows as $value) {
				$result[] = $value;
	  }	
	  return $result;		
	}
    public function install() {
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS ".DB_PREFIX."megamenu
		(
			id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
			title TEXT NOT NULL,
			image TEXT NOT NULL,
			url VARCHAR(128) NOT NULL,
			parent_id INTEGER(128) NOT NULL DEFAULT 0,
			subcontent TEXT NOT NULL,
			type VARCHAR(128) NOT NULL,
			type_id INTEGER(128) ,
			widths INTEGER,
			columns INTEGER,
			activemega INTEGER
		) ENGINE=InnoDB DEFAULT CHARSET=utf8");
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS ".DB_PREFIX."megamenu_options
		(
			id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
			name VARCHAR(225) NOT NULL,
			value TEXT NOT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8");
		foreach ($this->preData as $key => $value) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_options WHERE name = '" . $key . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_options SET name = '" . $key . "', value = '" . $this->db->escape($value) . "'");
		}
	}
}