<?php
class ModelToolCustom extends Model {
	public function formatCurrency($price){
		$price = str_replace('.', '', $price);
		$price = str_replace(',', '', $price);
		$price = str_replace(' ', '', $price);
		$price = preg_replace('/\xc2\xa0/', '', $price);
		$price = str_replace('vnd', '', $price);
		$price = str_replace('VND', '', $price);
		$price = str_replace('vnđ', '', $price);
		$price = str_replace('VNĐ', '', $price);
		$price = str_replace('đ', '', $price);
		$price = str_replace('Đ', '', $price);
		$price = str_replace('d', '', $price);
		$price = str_replace('₫', '', $price);
		return $price;
	}

	public function trimQ($string){
		$string = preg_replace('/\xc2\xa0/', ' ', $string);
		$string = str_replace('  ', ' ', $string);
		$string = trim($string);
		return $string;
	}
}