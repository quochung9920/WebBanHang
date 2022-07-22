<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");

		return $query->row;
	}

	public function getZones($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . "zone WHERE status = '1'";
		// $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_country_id'])) {
			$sql .= " AND country_id = '" . (int)$data['filter_country_id'] . "'";
		}

		$sql .= " ORDER BY name ASC";
		$query = $this->db->query($sql);

		$zone_data = $query->rows;

		return $zone_data;
	}

	public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);

		if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");

			$zone_data = $query->rows;

			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}

		return $zone_data;
	}


}