<?php
// HTTP
define('HTTP_SERVER', 'http://localhost/webbanhang/');

// HTTPS
define('HTTPS_SERVER', 'https://localhost/webbanhang/');

// DIR
define('DIR_HOME', 'C:\xampp\htdocs\webbanhang/');
define('DIR_APPLICATION', 'C:\xampp\htdocs\webbanhang/catalog/');
define('DIR_SYSTEM', 'C:\xampp\htdocs\webbanhang/system/');
define('DIR_LANGUAGE', 'C:\xampp\htdocs\webbanhang/catalog/language/');
define('DIR_TEMPLATE', 'C:\xampp\htdocs\webbanhang/catalog/view/theme/');
define('DIR_CONFIG', 'C:\xampp\htdocs\webbanhang/system/config/');
define('DIR_IMAGE', 'C:\xampp\htdocs\webbanhang/image/');
define('DIR_CACHE', 'C:\xampp\htdocs\webbanhang/system/storage/cache/');
define('DIR_DOWNLOAD', 'C:\xampp\htdocs\webbanhang/system/storage/download/');
define('DIR_LOGS', 'C:\xampp\htdocs\webbanhang/system/storage/logs/');
define('DIR_MODIFICATION', 'C:\xampp\htdocs\webbanhang/system/storage/modification/');
define('DIR_UPLOAD', 'C:\xampp\htdocs\webbanhang/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'webbanhang');
define('DB_PORT', '3306');
define('DB_PREFIX', 'pre_');


error_reporting(E_ALL);
ini_set("display_errors", 1);