<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$this->document->addStyle('catalog/view/theme/default/stylesheet/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_timhieuthem'] = $this->language->get('text_timhieuthem');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		$data['module'] = $setting;

		$data['products'] = array();
		$data['products2'] = array();
		$data['products3'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 5;
		}

		$data['title'] = $setting['title'][$this->config->get('config_language_id')];
		$data['title2'] = $setting['title2'][$this->config->get('config_language_id')];
		$data['title3'] = $setting['title3'][$this->config->get('config_language_id')];

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

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						/*'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/

						'description' 	=> (strlen(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'))) > $this->config->get('config_product_description_length') ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')),$this->config->get('config_product_description_length')) . '...' : strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'))),
						
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
						'rating'      => $rating,
						'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
          				'saving' => $product_info['price'] == 0 ? 100 : round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0)
					);
				}
			}
		}


		if (!empty($setting['product2'])) {
			$products2 = array_slice($setting['product2'], 0, (int)$setting['limit']);

			foreach ($products2 as $product2_id) {
				$product2_info = $this->model_catalog_product->getProduct($product2_id);

				if ($product2_info) {
					if ($product2_info['image']) {
						$image = $this->model_tool_image->resize($product2_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product2_info['price'], $product2_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product2_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product2_info['special'], $product2_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product2_info['special'] ? $product2_info['special'] : $product2_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product2_info['rating'];
					} else {
						$rating = false;
					}

					$data['products2'][] = array(
						'product_id'  => $product2_info['product_id'],
						'thumb'       => $image,
						'name'        => $product2_info['name'],
						/*'description' => utf8_substr(strip_tags(html_entity_decode($product2_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/

						'description' 	=> (strlen(strip_tags(html_entity_decode($product2_info['description'], ENT_QUOTES, 'UTF-8'))) > $this->config->get('config_product_description_length') ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($product2_info['description'], ENT_QUOTES, 'UTF-8')),$this->config->get('config_product_description_length')) . '...' : strip_tags(html_entity_decode($product2_info['description'], ENT_QUOTES, 'UTF-8'))),
						
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $product2_info['minimum'] > 0 ? $product2_info['minimum'] : 1,
						'rating'      => $rating,
						'href'    	 => $this->url->link('product/product', 'product_id=' . $product2_info['product_id']),
          				'saving' => $product2_info['price'] == 0 ? 100 : round((($product2_info['price'] - $product2_info['special'])/$product2_info['price'])*100, 0)
					);
				}
			}
		}

		if (!empty($setting['product3'])) {
			$products3 = array_slice($setting['product3'], 0, (int)$setting['limit']);

			foreach ($products3 as $product3_id) {
				$product3_info = $this->model_catalog_product->getProduct($product3_id);

				if ($product3_info) {
					if ($product3_info['image']) {
						$image = $this->model_tool_image->resize($product3_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product3_info['price'], $product3_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product3_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product3_info['special'], $product3_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product3_info['special'] ? $product3_info['special'] : $product3_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product3_info['rating'];
					} else {
						$rating = false;
					}

					$data['products3'][] = array(
						'product_id'  => $product3_info['product_id'],
						'thumb'       => $image,
						'name'        => $product3_info['name'],
						/*'description' => utf8_substr(strip_tags(html_entity_decode($product3_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',*/

						'description' 	=> (strlen(strip_tags(html_entity_decode($product3_info['description'], ENT_QUOTES, 'UTF-8'))) > $this->config->get('config_product_description_length') ?  $this->model_tool_image->catchu(strip_tags(html_entity_decode($product3_info['description'], ENT_QUOTES, 'UTF-8')),$this->config->get('config_product_description_length')) . '...' : strip_tags(html_entity_decode($product3_info['description'], ENT_QUOTES, 'UTF-8'))),
						
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $product3_info['minimum'] > 0 ? $product3_info['minimum'] : 1,
						'rating'      => $rating,
						'href'    	 => $this->url->link('product/product', 'product_id=' . $product3_info['product_id']),
          				'saving' => $product3_info['price'] == 0 ? 100 : round((($product3_info['price'] - $product3_info['special'])/$product3_info['price'])*100, 0)
					);
				}
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_item.tpl')) {
			$data['product_item'] = DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_item.tpl';
		} else {
			$data['product_item'] = DIR_TEMPLATE . 'default/template/product/product_item.tpl';
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}