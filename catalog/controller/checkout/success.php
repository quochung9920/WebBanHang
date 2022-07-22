<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');

		$data['text_tensanpham'] = $this->language->get('text_tensanpham');
		$data['text_masanpham'] = $this->language->get('text_masanpham');
		$data['text_thuonghieu'] = $this->language->get('text_thuonghieu');
		$data['text_soluong'] = $this->language->get('text_soluong');
		$data['text_dongia'] = $this->language->get('text_dongia');
		$data['text_tongtien'] = $this->language->get('text_tongtien');
		$data['text_tongcong'] = $this->language->get('text_tongcong');


		$products = $this->cart->getProducts();
		/*print_r($this->session->data['customer_id']);die;*/

		$this->session->data['clone']['products'] = $this->cart->getProducts();
		if(isset($this->session->data['order_id'])){
			$this->session->data['clone']['order_id'] = $this->session->data['order_id'];
		}else{
			$this->session->data['clone']['order_id'] = '';
		}
		$this->session->data['clone']['currency'] = $this->session->data['currency'];
		if(isset($this->session->data['coupon'])){
			$this->session->data['clone']['coupon'] = $this->session->data['coupon'];
		}else{
			$this->session->data['clone']['coupon'] = '';
		}
		if(isset($this->session->data['esteemgift'])){
			$this->session->data['clone']['esteemgift'] = $this->session->data['esteemgift'];
		}else{
			$this->session->data['clone']['esteemgift'] = 0;
		}
		if(isset($this->session->data['customer_id'])){
			$this->session->data['clone']['customer_id'] = $this->session->data['customer_id'];
		}else{
			$this->session->data['clone']['customer_id'] = 0;
		}
		//print_r($this->session->data['payment_method']);die;
		if(isset($this->session->data['payment_method'])){
			$data['payment'] = $this->load->controller('payment/' . $this->session->data['payment_method']['code']);
		}else{
			$data['payment'] = '';
		}
		/*print_r($paymentq);die;*/
		

		$data['order_id'] = $this->session->data['clone']['order_id'];
		$products = $this->session->data['clone']['products'];
		$data['currency'] = $this->session->data['clone']['currency'];
		$data['coupon'] = $this->session->data['clone']['coupon'];
		$data['esteemgift'] = $this->session->data['clone']['esteemgift'];
		$data['customer_id'] = $this->session->data['clone']['customer_id'];



		$data['total'] = 0;
		$data['total_total'] = 0;
		$data['discount_coupon'] = 0;
		$data['coupon_name'] = '';

		$cookie_store = 0;
		if (isset($_COOKIE['cookie_store'])) {
			$cookie_store = $_COOKIE['cookie_store'];
		}
		$data['cookie_store'] = $cookie_store;

		$this->load->model('catalog/product');

		$data['array_products'] = array();

		foreach($products as $product){
			$product_temp = $this->model_catalog_product->getProduct($product['product_id']);

			$data['array_products'][] = array(
				'product_id' => $product_temp['product_id'],
				'name' => $product_temp['name'],
				'model' => $product_temp['model'],
				'manufacturer' => $product_temp['manufacturer'],
				'price' => $product['price'],
				'quantity' => $product['quantity']
			);
			$data['total'] +=  $product['total'];
		}
		$data['total_total'] = $data['total'];


		$this->load->model('total/coupon');
		$data['coupons_info'] = array();
		$flag_coupon = 0;

		if($data['coupon']){
			foreach ($data['coupon'] as $key_coupon => $data_coupon) {
				$coupon_info = $this->model_total_coupon->getCoupon($data_coupon);
				if($coupon_info){
					$data['coupons_info'][] = array(
						'code' => $data_coupon,
						'coupon_name' => $coupon_info['name'],
						'discount_coupon' => $coupon_info['discount'],
					);
					$data['total_total'] -= $coupon_info['discount'];
				}
			}
		}

		if($data['esteemgift'] > $data['total_total']){
			$data['esteemgift'] = $data['total_total'];
		}

		if (isset($this->session->data['order_id'])) {
			// $this->cart->clear();
			// Add to activity log
			$phone_number = '';
			$this->load->model('account/activity');
			if ($this->customer->isLogged()) {
				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'order_id'    => $this->session->data['order_id']
				);
				$phone_number = $this->customer->getTelephone();
				$this->model_account_activity->addActivity('order_account', $activity_data);
			}else {
				$activity_data = array(
					'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
					'order_id' => $this->session->data['order_id']
				);
				$phone_number = $this->session->data['guest']['telephone'];
				$this->model_account_activity->addActivity('order_guest', $activity_data);
			}

			$this->load->model('checkout/order');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
			$this->cart->clear();
		}
		$this->document->setTitle($this->language->get('heading_title'));
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);
		$data['heading_title'] = $this->language->get('heading_title');
		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}
		
		$data['button_continue'] = $this->language->get('button_continue');
		$data['continue'] = $this->url->link('common/home');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}