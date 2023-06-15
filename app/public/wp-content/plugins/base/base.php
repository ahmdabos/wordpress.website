<?php

/*
Plugin Name: Base
Description: all base features
Version: 1.3
Author: Ahmed Abbous I want to create an article that will work as details to my service for my potential clients (restaurant owners) to convince them to use my service to create a website for their restaurant
the article should include why it is important to have a website for restaurant, and what is the needs to have useful website that will lead for more sell
Author URI: https://innovatingweb.com
*/
define('BASE_FILE_PATH', __FILE__);
if (!defined('ABSPATH')) {
    exit;
}
try {
    require_once plugin_dir_path(__FILE__) . 'includes/class-base-general.php';
    //require_once plugin_dir_path(__FILE__) . 'includes/class-base-backup.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class_base_custom_post_type.php';
    require_once plugin_dir_path(__FILE__) . 'includes/class_base_custom_taxonomy.php';

} catch (Exception $e) {
    add_action('admin_notices', function () use ($e) {
        echo '<div class="notice notice-error is-dismissible"><p>Error loading dependencies: ' . $e->getMessage() . '</p></div>';
    });
}
