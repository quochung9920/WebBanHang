<?php  
class ControllerModulepost extends Controller {
	public $settingpost;
	public function __construct($settingpost) {
	parent::__construct($settingpost);
		$this->load->model('setting/settingpost');
		$this->setting=$this->model_setting_settingpost->getSettingPosts(); 
	}
	public function index() {
		//---------------- load setting
		$this->language->load('module/post');
		$this->load->model('catalog/post');
		
		$this->document->addStyle('catalog/view/stylesheet/news.css');
		
		$filter_data = array(
			'page' => 1,
			'limit' => $this->setting['item_module_post'],
			'start' => 0,
		);
	 
		/*$data['heading_title'] = $this->setting['head_module_post'];*/
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_title_link'] =$this->url->link('information/post');
		
		$data['text_see_more'] = $this->language->get('text_see_more');
		$posts = $this->model_catalog_post->getposts($filter_data);
	 
		$data['posts'] = array();
		
		$this->load->model('tool/image');
		foreach ($posts as $post) {
			if (is_file(DIR_IMAGE . $post['image'])) {
				$image = $this->model_tool_image->resize($post['image'], $this->setting['image_thumb_width'],$this->setting['image_thumb_height']);
			} else {
				$image = $this->model_tool_image->resize('no_image.png',$this->setting['image_thumb_width'],$this->setting['image_thumb_height']);
			}
			
			$data['posts'][] = array (
				'post_id'       => $post['post_id'],
				'title' 		=> html_entity_decode($post['title'], ENT_QUOTES),
				'image'    		=> $image,
				/*'short_description' 	=> (strlen(strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES))) > $this->setting['description_limit'] ? substr(strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES)), 0,$this->setting['description_limit']) . '...' : strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES))),*/

				'short_description' 	=> (strlen(strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES, 'UTF-8'))) > $this->setting['description_limit'] ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES, 'UTF-8')),$this->setting['description_limit']) . '...' : strip_tags(html_entity_decode($post['short_description'], ENT_QUOTES, 'UTF-8'))),

				'view' 			=> $this->url->link('information/post', 'post_id=' . $post['post_id']),
				'href' 			=> $this->url->link('information/post', 'post_id=' . $post['post_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($post['date_added']))
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/post.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/post.tpl', $data);
		} else {
			return $this->load->view('default/template/module/post.tpl', $data);
		}
	}
}