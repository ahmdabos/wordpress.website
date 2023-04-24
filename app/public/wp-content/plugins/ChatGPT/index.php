<?php
/**
 * Plugin Name: ChatGPT
 * Description: ChatGPT Content Generator
 * Version: 1.0
 * Author: Future Internet
 * Author URI: https://future-internet.com
 */

defined('ABSPATH') || exit;

// Include the necessary files.
require_once plugin_dir_path(__FILE__) . 'settings.php';
require_once plugin_dir_path(__FILE__) . 'dashboard.php';

/**
 * Initializes the plugin by registering the necessary actions and filters.
 */
function chatgpt_content_writer_init() {
    add_action('admin_menu', 'chatgpt_content_writer_register_menu_pages');
    add_action('plugins_loaded', 'chatgpt_content_writer_create_database_table');
    add_action('admin_enqueue_scripts', 'chatgpt_enqueue_styles_scripts');

}
function chatgpt_enqueue_styles_scripts() {
    // Turn off error reporting
    error_reporting(0);

    // Include Bootstrap CSS
    wp_enqueue_style('bootstrap-css', 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css', array(), '5.2.2');

    // Include Font Awesome CSS
    wp_enqueue_style('font-awesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css', array(), '4.7.0');

    // Include jQuery
    wp_enqueue_script('jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js', array('jquery-core'), '3.6.0', true);

    // Include Chart.js
    wp_enqueue_script('chart-js', 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js', array(), '2.5.0', true);
}

/**
 * Registers the plugin menu pages.
 */
function chatgpt_content_writer_register_menu_pages() {
    add_menu_page(
        'Chat GPT',
        'Chat GPT',
        'manage_options',
        'chatgpt-content-writer-dashboard',
        'chatgpt_content_writer_render_dashboard',
        'dashicons-admin-users',
        999
    );

    add_submenu_page(
        'chatgpt-content-writer-dashboard',
        'Settings',
        'Settings',
        'manage_options',
        'chatgpt-content-writer-settings',
        'chatgpt_content_writer_render_settings'
    );
}

/**
 * Renders the dashboard page.
 */
function chatgpt_content_writer_render_dashboard() {
    chatgpt_content_writer_dashboard();
}

/**
 * Renders the settings page.
 */
function chatgpt_content_writer_render_settings() {
    chatgpt_content_writer_settings();
}

/**
 * Creates the necessary database table for the plugin.
 */
function chatgpt_content_writer_create_database_table() {
    global $wpdb;

    $table_name = $wpdb->prefix . 'chatgpt_content_writer';

    $sql = "CREATE TABLE $table_name (
		id int(11) NOT NULL AUTO_INCREMENT,
		api_token tinytext NOT NULL,
		temperature tinytext NOT NULL,
		max_tokens tinytext NOT NULL,
		PRIMARY KEY  (id)
	) ENGINE=InnoDB $wpdb->charset COLLATE=$wpdb->collate;";

    require_once ABSPATH . 'wp-admin/includes/upgrade.php';
    dbDelta($sql);
}

// Initializes the plugin.
add_action('plugins_loaded', 'chatgpt_content_writer_init');
