<?php
class ControllerModuleBannerGrid extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		//$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		//$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		//$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		
		$data['perrow_id'] = $setting['perrow_id'];
		$data['status'] = $setting['status'];		
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);


		
		
		foreach ($results as $result) {
			$image = '';
			$image_mobile = '';
			if($result['image']){
				$image_mobile = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			}
			if($result['image']){
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			}
			if($data['status'] == 2){
				if($result['image']){
					$image_mobile = $this->model_tool_image->resize($result['image'], 277, 277);
				}
			}
		
			$data['banners'][] = array(
				'title' => $result['title'],
				'link'  => $result['link'],
				'name_link' => $result['name_link'],
				'description' => $result['description'],
				'anhgoc' => $result['image'],
				'image' => $image,
				'image_mobile' => $image_mobile,
			);
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banner_grid.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/banner_grid.tpl', $data);
		} else {
			return $this->load->view('default/template/module/banner_grid.tpl', $data);
		}
	}
}