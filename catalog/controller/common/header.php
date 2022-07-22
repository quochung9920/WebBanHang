<?php
class ControllerCommonHeader extends Controller {
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
		
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code']);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}
		
		$data['header_top'] = $this->load->controller('common/header_top');
		$data['header_bottom'] = $this->load->controller('common/header_bottom');
		
		// Navigation
		$data['navigation'] = $this->load->controller('common/navigation');
		
		// Menu
		$data['megamenu'] = $this->load->controller('common/megamenu');

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['uri'] = html_entity_decode($server . $this->request->server['REQUEST_URI']);
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['image'] = $this->document->getImage();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			// $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
			$data['text_wishlist'] = $this->language->get('text_wishlist');
			$data['total_wishlist'] = $this->model_account_wishlist->getTotalWishlist();
			$data['get_wishlist'] = $this->model_account_wishlist->getWishlist();
		} else {
			// $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
			$data['text_wishlist'] = $this->language->get('text_wishlist');
			$data['total_wishlist'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
			$data['get_wishlist'] = array();
			if(isset($this->session->data['wishlist'])) {
				foreach ($this->session->data['wishlist'] as $key_wishlist => $value_wishlist) {
					$data['get_wishlist'][] = array(
						'product_id' => $value_wishlist,
					);
				}
			}
		}
		//print_r($data['get_wishlist']);die;

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['text_khuvuccuaban'] = $this->language->get('text_khuvuccuaban');
		$data['text_luachonkhuvuc'] = $this->language->get('text_luachonkhuvuc');
		$data['text_tinhthanh'] = $this->language->get('text_tinhthanh');
		$data['text_luachontinhthanh'] = $this->language->get('text_luachontinhthanh');
		$data['text_quanhuyen'] = $this->language->get('text_quanhuyen');
		$data['text_luachonquanhuyen'] = $this->language->get('text_luachonquanhuyen');
		$data['text_chonvitricuaban'] = $this->language->get('text_chonvitricuaban');
		$data['text_batbuocnhap'] = $this->language->get('text_batbuocnhap');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
		
		$data['welcome'] = $this->config->get('config_welcome');

		$data['svg'] = $this->load->controller('common/svg');


		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];

			} else {
			$product_id = 0;

		}


		if (isset($this->request->get['post_id'])) {
			$post_id = $this->request->get['post_id'];
		} else {
			$post_id = 0;
		}
			
			
		
		$this->load->model('catalog/product');
		$this->load->model('catalog/post');
		$this->load->model('tool/image');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$post_info = $this->model_catalog_post->getPost($post_id);
		
		$data['product_info'] = $product_info;
		$data['post_info'] = $post_info;

		if ($product_info) {
			$data['thumb_fb'] = $this->model_tool_image->resize($product_info['image'], 400, 400);
		} else if ($post_info) {
			$data['thumb_fb'] = $this->model_tool_image->resize($post_info['image'], 400, 400);
		} else if($this->config->get('config_logo_share_fb')){
			$data['thumb_fb'] = $this->model_tool_image->resize($this->config->get('config_logo_share_fb'), 1500, 1000);
		} else {
			$data['thumb_fb'] = $this->model_tool_image->resize($this->config->get('config_logo'), 400, 400);
		}


		if ($product_info) { 
		$data['description_fb'] = utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..';
		} else if ($post_info) {
			$data['description_fb'] = utf8_substr(strip_tags(html_entity_decode($post_info['short_description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..';
		} else {
			$data['description_fb'] = $this->document->getDescription();
		}



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
