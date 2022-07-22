<?php
class ControllerModulePostselected extends Controller {
	public function index($setting) {
		$this->load->language('module/postselected');

		
		$data['heading_title'] = $setting['name'];

		$data['text_tax'] = $this->language->get('text_tax');

		$this->load->model('catalog/post');

		$this->load->model('tool/image');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		$data['module'] = $setting;
		$data['text_see_more'] = $this->language->get('text_see_more');
		$data['posts'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['post'])) {
			
			
			$posts = array_slice($setting['post'], 0, (int)$setting['limit']);

			foreach ($posts as $post_id) {
				$post_info = $this->model_catalog_post->getPost($post_id);

				if ($post_info) {
					if ($post_info['image']) {
						$image = $this->model_tool_image->resize($post_info['image'], $setting['width'], $setting['height']);
						$thumb_mn = $server . 'image/' . $post_info['image'];
						$image_q = $this->model_tool_image->resize($post_info['image'], 80, 80);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
						$thumb_mn = $server . 'image/' . $post_info['image'];
						$image_q = $this->model_tool_image->resize('placeholder.png', 80, 80);
					}

					$data['posts'][] = array(
						'title' 		=> html_entity_decode($post_info['title'], ENT_QUOTES),
					'image'    		=> $image,

					'thumb_mn'=>$thumb_mn,
					'image_q' => $image_q,
					/*'short_description' 	=> (strlen(strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES))) > $this->setting['description_limit'] ? substr(strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES)), 0,$this->setting['description_limit']) . '...' : strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES))),*/
					
					'short_description' 	=> (strlen(strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES, 'UTF-8'))) > $this->setting['description_limit'] ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES, 'UTF-8')),$this->setting['description_limit']) . '...' : strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES, 'UTF-8'))),

					'view' 			=> $this->url->link('information/post', 'post_id=' . $post_info['post_id']),
					'href' 			=> $this->url->link('information/post', 'post_id=' . $post_info['post_id']),
					'date_added' 	=> date($this->language->get('j/n'), strtotime($post_info['date_added']))
						
					);
				}
			}
		}
		
		

		if ($data['posts']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/postselected.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/postselected.tpl', $data);
		} else {
			return $this->load->view('default/template/module/postselected.tpl', $data);
		}
		}
	}
}