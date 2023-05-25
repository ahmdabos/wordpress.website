<?php

/*
Plugin Name: Base
Description: all base features
Version: 1.3
Author: Ahmed Abbous
Author URI: https://innovatingweb.com
*/
define('BASE_FILE_PATH', __FILE__);
if (!defined('ABSPATH')) {
    exit;
}
try {
    require_once plugin_dir_path(__FILE__) . 'includes/class-base-general.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class-base-sitemap.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class-base-backup.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class_base_custom_post_type.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class_base_custom_taxonomy.php';
} catch (Exception $e) {
    add_action('admin_notices', function () use ($e) {
        echo '<div class="notice notice-error is-dismissible"><p>Error loading dependencies: ' . $e->getMessage() . '</p></div>';
    });
}
