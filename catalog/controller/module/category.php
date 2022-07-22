<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['view_more'] = $this->language->get('view_more');
		$data['text_muahang'] = $this->language->get('text_muahang');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['categories'] = array();
		
		$categories = array();
		
		if (is_array($this->config->get('category_category'))) {
			foreach ($this->config->get('category_category') as $category_id) {
				$categories[] = $this->model_catalog_category->getCategory($category_id);
			}
		}
		
		foreach ($categories as $category) {
			if ($category) {
				$children_data = array();
	
				$children = $this->model_catalog_category->getCategories($category['category_id']);
	
				foreach($children as $child) {
					$children_lv1_data = array();
					
					$children_lv1 = $this->model_catalog_category->getCategories($child['category_id']);
					
					foreach ($children_lv1  as $child_lv1) {
						$filter_data = array('filter_category_id' => $child_lv1['category_id'], 'filter_sub_category' => true);
						
						$children_lv1_data[] = array(
							'category_id' => $child_lv1['category_id'],
							'name' => $child_lv1['name'],
							'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv1['category_id'])
						);
					}
					
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);
	
					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name' => $child['name'],
						'children'    => $children_lv1_data,
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
	
				$filter_data = array(
					'filter_category_id'  => $category['category_id'],
					'filter_sub_category' => true
				);


				if ($category['image']) {
					$thumb = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));

					$thumb_desktop = $this->model_tool_image->resize($category['image'], 110, 110);
				} else {
					$thumb = '';
					$thumb_desktop = '';
				}
	
				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'],
					'image'		  => $category['image'],
					'thumb'		  => $thumb,
					'thumb_desktop'		  => $thumb_desktop,
					'children'    => $children_data,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$data['column'] = (int)$this->config->get('category_column');
		$data['class'] = 'col-sm-' . (12/$data['column']);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}