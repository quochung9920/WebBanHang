<?php
class ModelLocalisationCountry extends Model {
	public function getCountry($country_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '" . (int)$country_id . "' AND status = '1'");

		return $query->row;
	}

	public function getCountries($data = array()) {
		// $country_data = $this->cache->get('country.status');

		// if (!$country_data) {
		// 	$sql = "SELECT * FROM " . DB_PREFIX . "country WHERE status = '1'";
		// 	// $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

		// 	if (!empty($data['filter_name'])) {
		// 		$sql .= " AND name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		// 	}

		// 	$sql .= " ORDER BY name ASC";
		// 	$query = $this->db->query($sql);

		// 	$country_data = $query->rows;

		// 	$this->cache->set('country.status', $country_data);
		// }

		$sql = "SELECT * FROM " . DB_PREFIX . "country WHERE status = '1'";
		// $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " ORDER BY name ASC";
		$query = $this->db->query($sql);

		$country_data = $query->rows;

		return $country_data;
	}
}