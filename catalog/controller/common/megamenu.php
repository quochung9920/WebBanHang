<?php
class ControllerCommonMegaMenu extends Controller {
	public function index() {
		$this->load->language('common/megamenu');
		$route = isset($this->request->get['route']) ? $this->request->get['route'] : null;
		
		$this->document->addStyle('catalog/view/theme/default/stylesheet/megamenu.css');
		
		$this->load->model('design/megamenu');
		$root_menus = $this->model_design_megamenu->getlist();
		$options = $this->model_design_megamenu->getOptions();
		
		foreach($options as $val){
			$data[$val['name']] = $val['value'];
		}
		
		if($root_menus){
			foreach($root_menus as $key=>$value){
				if($value['type']=='page'){
					$root_menus[$key]['url'] = $this->url->link('common/page', 'page_id=' . $value['type_id']);
					if($route=='common/page' && isset($this->request->get['page_id']) && $this->request->get['page_id']==$value['type_id'])
					$root_menus[$key]['active'] = 1;
				}
				
				if($value['type']=='category'){
					$root_menus[$key]['url'] = $this->url->link('product/category', 'path=' . $value['type_id']);
					
					if (isset($this->request->get['path'])) {
						$parts = explode('_', (string)$this->request->get['path']);
					} else {
						$parts = array();
					}
					
					if($route=='product/category' && in_array($value['type_id'], $parts))
						$root_menus[$key]['active'] = 1;
				}
				
				if($value['type']=='thread'){
					$root_menus[$key]['url'] = $this->url->link('information/thread', 'thread=' . $value['type_id']);
					
					if (isset($this->request->get['thread'])) {
						$parts = explode('_', (string)$this->request->get['thread']);
					} else {
						$parts = array();
					}
					
					if ($route=='information/thread' && in_array($value['type_id'], $parts)) {
						$root_menus[$key]['active'] = 1;
					}
				}
				
				if($value['type']=='infomation'){
					$root_menus[$key]['url'] = $this->url->link('information/information', 'information_id=' . $value['type_id']);
					if($route=='information/information' && isset($this->request->get['information_id']) && $this->request->get['information_id']==$value['type_id'])
					$root_menus[$key]['active'] = 1;
				}
				
				if($value['type']=='manufacturer'){
					$root_menus[$key]['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $value['type_id']);
					if($route=='product/manufacturer/info' && isset($this->request->get['manufacturer_id']) && $this->request->get['manufacturer_id']==$value['type_id'])
					$root_menus[$key]['active'] = 1;
				}
				
				if( (preg_match('/index.php$/i', $value['url']) || preg_match('/common\/home$/i', $value['url']) || preg_match('/\/$/i', $value['url'])) and (!$route or $route=='common/home') ){
					$root_menus[$key]['active'] = 1;
				}
				
				$root_menus[$key]['total'] = $this->model_design_megamenu->getTotalMenu($value['id']);
			}
		}
		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['menus_root'] = $root_menus;
		$data['responsive_title'] = $this->language->get('responsive_title');
		$data['text_login']       = $this->language->get('text_login');
		$data['text_wishlist']    = $this->language->get('text_wishlist');
		$data['proMegaMenuModel'] = $this->model_design_megamenu;
		$data['language'] = $this->load->controller('common/language');
		$data['configObject'] = $this->config;
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/megamenu.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/megamenu.tpl', $data);
		} else {
			return $this->load->view('default/template/common/megamenu.tpl', $data);
		}
	}
}