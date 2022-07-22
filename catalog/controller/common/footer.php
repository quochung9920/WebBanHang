<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		
		$this->load->model('design/block');
		$this->load->model('design/layout');
		
		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}
 
		$data['layout_id'] = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');

			$path = explode('_', (string)$this->request->get['path']);

			$data['layout_id'] = $this->model_catalog_category->getCategoryLayoutId(end($path));
		} else if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');

			$data['layout_id'] = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		} else if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');

			$data['layout_id'] = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$data['layout_id']) {
			$data['layout_id'] = $this->model_design_layout->getLayout($route);
		}

		if (!$data['layout_id']) {
			$data['layout_id'] = $this->config->get('config_layout_id');
		}
		
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_about_us'] = $this->language->get('text_about_us');


		$data['text_khuvuccuaban'] = $this->language->get('text_khuvuccuaban');
		$data['text_luachonkhuvuc'] = $this->language->get('text_luachonkhuvuc');
		$data['text_tinhthanh'] = $this->language->get('text_tinhthanh');
		$data['text_luachontinhthanh'] = $this->language->get('text_luachontinhthanh');
		$data['text_quanhuyen'] = $this->language->get('text_quanhuyen');
		$data['text_luachonquanhuyen'] = $this->language->get('text_luachonquanhuyen');
		$data['text_chonvitricuaban'] = $this->language->get('text_chonvitricuaban');
		$data['text_batbuocnhap'] = $this->language->get('text_batbuocnhap');

		$data['button_checkout'] = $this->language->get('button_checkout');
		$data['text_sanphamdaduocthemvaogio'] = $this->language->get('text_sanphamdaduocthemvaogio');
		$data['text_tieptucmuasam'] = $this->language->get('text_tieptucmuasam');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		
		$data['text_contact_us'] = $this->language->get('text_contact_us');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_telephone'] = $this->language->get('text_telephone');
		
		$data['text_follow_us'] = $this->language->get('text_follow_us');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['informations2'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom2']) {
				$data['informations2'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}
		
		$data['subcribe'] = $this->load->controller('module/advanced_newsletter');
		
		$data['footer_top'] = $this->load->controller('common/footer_top');
		$data['footer_bottom'] = $this->load->controller('common/footer_bottom');
		
		$data['about_us'] = nl2br($this->config->get('config_about_us'));
		$data['store_name'] = $this->config->get('config_name');
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['email'] = $this->config->get('config_email');
		$data['telephone'] = nl2br($this->config->get('config_telephone'));
		$data['embed_code'] = html_entity_decode($this->config->get('config_embed_code'));
		
		$data['facebook'] = $this->config->get('config_community_facebook');
		$data['google'] = $this->config->get('config_community_google'); 
		$data['youtube'] = $this->config->get('config_community_youtube'); 
		$data['twitter'] = $this->config->get('config_community_twitter');
		$data['pinterest'] = $this->config->get('config_community_pinterest');
		$data['instagram'] = $this->config->get('config_community_instagram');
		$data['vimeo'] = $this->config->get('config_community_vimeo');
		$data['tumblr'] = $this->config->get('config_community_tumblr');
		$data['zingme'] = $this->config->get('config_community_zingme');
		$data['rss'] = $this->config->get('config_community_rss');

		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		$data['countries'] = $this->model_localisation_country->getCountries();


		$data['megamenu_footer'] = $this->load->controller('common/megamenu_footer');
		$data['megamenu_footer_mobile'] = $this->load->controller('common/megamenu_footer_mobile');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}


	public function js_search_input_country(){
		$json = array();
		$this->load->model('localisation/country');

		$filter_name = '';
		if(isset($this->request->post['filter_name'])){
			$filter_name = $this->request->post['filter_name'];
		}
		$data_filter = array(
			'filter_name' => $filter_name,
		);

		$json = $this->model_localisation_country->getCountries($data_filter);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function js_search_input_zone(){
		$json = array();
		$this->load->model('localisation/zone');

		$filter_name = '';
		if(isset($this->request->post['filter_name'])){
			$filter_name = $this->request->post['filter_name'];
		}

		$filter_country_id = '';
		if(isset($this->request->post['filter_country_id'])){
			$filter_country_id = $this->request->post['filter_country_id'];
		}

		$data_filter = array(
			'filter_name' => $filter_name,
			'filter_country_id' => $filter_country_id,
		);

		$json = $this->model_localisation_zone->getZones($data_filter);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function v_selectbox__option(){
		$json = array();
		$this->load->model('localisation/zone');

		$country_id = 0;
		if(isset($this->request->post['country_id'])){
			$country_id = $this->request->post['country_id'];
		}


		$json = $this->model_localisation_zone->getZonesByCountryId($country_id);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
