<?php
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');

		$this->document->addStyle('catalog/view/theme/default/stylesheet/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		$data['module'] = $setting;

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
		
		if ($results) {
			$data['banner_left'] = $setting['banner_left'];
			$data['banner_right'] = $setting['banner_right'];
			$data['banner_bottom1'] = $setting['banner_bottom1'];
			$data['banner_bottom2'] = $setting['banner_bottom2'];
			
			if (!empty($setting['banner_left']['image'])) {
				$data['banner_left']['thumb'] = $this->model_tool_image->resize($setting['banner_left']['image'], $setting['banner_left']['width'], $setting['banner_left']['height']);
			}
			
			if (!empty($setting['banner_right']['image'])) {
				$data['banner_right']['thumb'] = $this->model_tool_image->resize($setting['banner_right']['image'], $setting['banner_right']['width'], $setting['banner_right']['height']);
			}
			
			if (!empty($setting['banner_bottom1']['image'])) {
				$data['banner_bottom1']['thumb'] = $this->model_tool_image->resize($setting['banner_bottom1']['image'], $setting['banner_bottom1']['width'], $setting['banner_bottom1']['height']);
			}
			
			if (!empty($setting['banner_bottom2']['image'])) {
				$data['banner_bottom2']['thumb'] = $this->model_tool_image->resize($setting['banner_bottom2']['image'], $setting['banner_bottom2']['width'], $setting['banner_bottom2']['height']);
			}
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					/*'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/

					'description' 	=> (strlen(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))) > $this->config->get('config_product_description_length') ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),$this->config->get('config_product_description_length')) . '...' : strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))),
					
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'saving' => $result['price'] == 0 ? 100 : round((($result['price'] - $result['special'])/$result['price'])*100, 0)
				);
			}
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_item.tpl')) {
				$data['product_item'] = DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_item.tpl';
			} else {
				$data['product_item'] = DIR_TEMPLATE . 'default/template/product/product_item.tpl';
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bestseller.tpl', $data);
			}
		}
	}
}
