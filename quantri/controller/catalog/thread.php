<?php
class ControllerCatalogthread extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/thread');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/thread');

		$this->getList();
	}

	public function add() {
		$this->language->load('catalog/thread');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/thread');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_thread->addthread($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->language->load('catalog/thread');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/thread');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_thread->editthread($this->request->get['thread_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('catalog/thread');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/thread');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $thread_id) {
				$this->model_catalog_thread->deletethread($thread_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function repair() {
		$this->language->load('catalog/thread');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/thread');

		if ($this->validateRepair()) {
			$this->model_catalog_thread->repairthreads();

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('catalog/thread', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('catalog/thread/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/thread/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['repair'] = $this->url->link('catalog/thread/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['threads'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$thread_total = $this->model_catalog_thread->getTotalthreads();

		$results = $this->model_catalog_thread->getthreads($filter_data);

		foreach ($results as $result) {
			$data['threads'][] = array(
				'thread_id' => $result['thread_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/thread/edit', 'token=' . $this->session->data['token'] . '&thread_id=' . $result['thread_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('catalog/thread/delete', 'token=' . $this->session->data['token'] . '&thread_id=' . $result['thread_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $thread_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($thread_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($thread_total - $this->config->get('config_limit_admin'))) ? $thread_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $thread_total, ceil($thread_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/thread_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['thread_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_standard'] = $this->language->get('text_standard');
		$data['text_blog'] = $this->language->get('text_blog');
		$data['text_aside'] = $this->language->get('text_aside');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_gallery'] = $this->language->get('text_gallery');
		
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_child'] = $this->language->get('entry_child');
		$data['entry_format'] = $this->language->get('entry_format');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_child'] = $this->language->get('help_child');
		$data['help_format'] = $this->language->get('help_format');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['thread_id'])) {
			$data['action'] = $this->url->link('catalog/thread/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/thread/edit', 'token=' . $this->session->data['token'] . '&thread_id=' . $this->request->get['thread_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('catalog/thread', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['thread_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$thread_info = $this->model_catalog_thread->getthread($this->request->get['thread_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['thread_description'])) {
			$data['thread_description'] = $this->request->post['thread_description'];
		} elseif (isset($this->request->get['thread_id'])) {
			$data['thread_description'] = $this->model_catalog_thread->getthreadDescriptions($this->request->get['thread_id']);
		} else {
			$data['thread_description'] = array();
		}

		if (isset($this->request->post['path'])) {
			$data['path'] = $this->request->post['path'];
		} elseif (!empty($thread_info)) {
			$data['path'] = $thread_info['path'];
		} else {
			$data['path'] = '';
		}

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($thread_info)) {
			$data['parent_id'] = $thread_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}

		$this->load->model('catalog/filter');

		if (isset($this->request->post['thread_filter'])) {
			$filters = $this->request->post['thread_filter'];
		} elseif (isset($this->request->get['thread_id'])) {
			$filters = $this->model_catalog_thread->getthreadFilters($this->request->get['thread_id']);
		} else {
			$filters = array();
		}

		$data['thread_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['thread_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		$data['entry_thread'] = 'User Mange';//$this->language->get('entry_thread');
		$data['help_thread'] = 'User Mange';//$this->language->get('help_thread');
		
		$this->load->model('catalog/userthread');
		if (isset($this->request->post['post_thread'])) {
			$userthread = $this->request->post['post_thread'];
		} elseif (isset($this->request->get['thread_id'])) {
			$userthread = $this->model_catalog_userthread->getpostthreadspost_user($this->request->get['thread_id']);
		} else {
			$userthread = array();
		}

		$data['post_threadspost'] = array();

		foreach ($userthread as $userthread_id) {
			$userthread_info = $this->model_catalog_userthread->getthread_user($userthread_id);

			if ($userthread_info) {
				$data['post_threadspost'][] = array(
					'thread_id' => $userthread_info['user_id'],
					'name' => $userthread_info['username']
				);
			}
		}
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['thread_store'])) {
			$data['thread_store'] = $this->request->post['thread_store'];
		} elseif (isset($this->request->get['thread_id'])) {
			$data['thread_store'] = $this->model_catalog_thread->getthreadStores($this->request->get['thread_id']);
		} else {
			$data['thread_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($thread_info)) {
			$data['keyword'] = $thread_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($thread_info)) {
			$data['image'] = $thread_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($thread_info) && is_file(DIR_IMAGE . $thread_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($thread_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['child'])) {
			$data['child'] = $this->request->post['child'];
		} elseif (!empty($thread_info)) {
			$data['child'] = $thread_info['child'];
		} else {
			$data['child'] = 0;
		}

		if (isset($this->request->post['format'])) {
			$data['format'] = $this->request->post['format'];
		} elseif (!empty($thread_info)) {
			$data['format'] = $thread_info['format'];
		} else {
			$data['format'] = 'standard';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($thread_info)) {
			$data['sort_order'] = $thread_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($thread_info)) {
			$data['status'] = $thread_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['thread_layout'])) {
			$data['thread_layout'] = $this->request->post['thread_layout'];
		} elseif (isset($this->request->get['thread_id'])) {
			$data['thread_layout'] = $this->model_catalog_thread->getthreadLayouts($this->request->get['thread_id']);
		} else {
			$data['thread_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/thread_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['thread_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['thread_id']) && $url_alias_info['query'] != 'thread_id=' . $this->request->get['thread_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['thread_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateRepair() {
		if (!$this->user->hasPermission('modify', 'catalog/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/thread');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_thread->getthreads($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'thread_id' => $result['thread_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function autocomplete_user() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/userthread');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_userthread->getthreads_user($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'thread_id' => $result['user_id'],
					'name'        => strip_tags(html_entity_decode($result['username'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}