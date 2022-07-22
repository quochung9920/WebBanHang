<?php
class ControllerModuleProductTab extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/product_tab');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('product_tab', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
						
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_tab'] = $this->language->get('entry_tab');
		$data['entry_latest'] = $this->language->get('entry_latest');
		$data['entry_featured'] = $this->language->get('entry_featured');
		$data['entry_bestseller'] = $this->language->get('entry_bestseller');
		$data['entry_special'] = $this->language->get('entry_special');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_product'] = $this->language->get('help_product');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		// Additional
		$data['entry_resolution'] = $this->language->get('entry_resolution');
		
		$data['text_banner_bottom1'] = $this->language->get('text_banner_bottom1');
		
		$data['entry_banner_bottom1'] = $this->language->get('entry_banner_bottom1');
		$data['entry_banner_bottom1_width'] = $this->language->get('entry_banner_bottom1_width');
		$data['entry_banner_bottom1_height'] = $this->language->get('entry_banner_bottom1_height');
		$data['entry_banner_bottom1_link'] = $this->language->get('entry_banner_bottom1_link');
        $data['entry_banner_bottom1_scale'] = $this->language->get('entry_banner_bottom1_scale');
		
		$data['text_banner_bottom2'] = $this->language->get('text_banner_bottom2');
		
		$data['entry_banner_bottom2'] = $this->language->get('entry_banner_bottom2');
		$data['entry_banner_bottom2_width'] = $this->language->get('entry_banner_bottom2_width');
		$data['entry_banner_bottom2_height'] = $this->language->get('entry_banner_bottom2_height');
		$data['entry_banner_bottom2_link'] = $this->language->get('entry_banner_bottom2_link');
        $data['entry_banner_bottom2_scale'] = $this->language->get('entry_banner_bottom2_scale');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/product_tab', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/product_tab', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/product_tab', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/product_tab', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		$this->load->model('catalog/product');
		
		$data['products'] = array();
		
		if (!empty($this->request->post['product'])) {
			$products = $this->request->post['product'];
		} elseif (!empty($module_info['product'])) {
			$products = $module_info['product'];
		} else {
			$products = array();
		}
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}
		
		
		if (isset($this->request->post['featured_products_status'])) {
			$data['featured_products_status'] = $this->request->post['featured_products_status'];
		} elseif (!empty($module_info)) {
			$data['featured_products_status'] = $module_info['featured_products_status'];
		} else {
			$data['featured_products_status'] = '';
		}
		
		if (isset($this->request->post['latest_products_status'])) {
			$data['latest_products_status'] = $this->request->post['latest_products_status'];
		} elseif (!empty($module_info)) {
			$data['latest_products_status'] = $module_info['latest_products_status'];
		} else {
			$data['latest_products_status'] = '';
		}
		
		if (isset($this->request->post['bestseller_products_status'])) {
			$data['bestseller_products_status'] = $this->request->post['bestseller_products_status'];
		} elseif (!empty($module_info)) {
			$data['bestseller_products_status'] = $module_info['bestseller_products_status'];
		} else {
			$data['bestseller_products_status'] = '';
		}
		
		if (isset($this->request->post['special_products_status'])) {
			$data['special_products_status'] = $this->request->post['special_products_status'];
		} elseif (!empty($module_info)) {
			$data['special_products_status'] = $module_info['special_products_status'];
		} else {
			$data['special_products_status'] = '';
		}
		
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}	
				
		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 220;
		}	
			
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 220;
		}		
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if (isset($this->request->post['banner_bottom1'])) {
			$data['banner_bottom1'] = $this->request->post['banner_bottom1'];
		} elseif (!empty($module_info)) {
			$data['banner_bottom1'] = $module_info['banner_bottom1'];
		} else {
			$data['banner_bottom1'] = array();
		}
		
		if (!isset($data['banner_bottom1']['image'])) {
			$data['banner_bottom1']['image'] = '';
		}
		
		if (!empty($data['banner_bottom1']['image'])) {
			$data['banner_bottom1']['thumb'] = $this->model_tool_image->resize($data['banner_bottom1']['image'], 100, 100);;
		} else {
			$data['banner_bottom1']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);;
		}
		
		if (!isset($data['banner_bottom1']['width'])) {
			$data['banner_bottom1']['width'] = 1170;
		}
		
		if (!isset($data['banner_bottom1']['height'])) {
			$data['banner_bottom1']['height'] = 150;
		}
		
		if (!isset($data['banner_bottom1']['link'])) {
			$data['banner_bottom1']['link'] = '';
		}
        
		if (!isset($data['banner_bottom1']['scale'])) {
			$data['banner_bottom1']['scale'] = '';
		}
		
		if (isset($this->request->post['banner_bottom2'])) {
			$data['banner_bottom2'] = $this->request->post['banner_bottom2'];
		} elseif (!empty($module_info)) {
			$data['banner_bottom2'] = $module_info['banner_bottom2'];
		} else {
			$data['banner_bottom2'] = array();
		}
		
		if (!isset($data['banner_bottom2']['image'])) {
			$data['banner_bottom2']['image'] = '';
		}
		
		if (!empty($data['banner_bottom2']['image'])) {
			$data['banner_bottom2']['thumb'] = $this->model_tool_image->resize($data['banner_bottom2']['image'], 100, 100);;
		} else {
			$data['banner_bottom2']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);;
		}
		
		if (!isset($data['banner_bottom2']['width'])) {
			$data['banner_bottom2']['width'] = 1170;
		}
		
		if (!isset($data['banner_bottom2']['height'])) {
			$data['banner_bottom2']['height'] = 150;
		}
		
		if (!isset($data['banner_bottom2']['link'])) {
			$data['banner_bottom2']['link'] = '';
		}
        
		if (!isset($data['banner_bottom2']['scale'])) {
			$data['banner_bottom2']['scale'] = '';
		}
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/product_tab.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/product_tab')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}
		
		return !$this->error;
	}
}