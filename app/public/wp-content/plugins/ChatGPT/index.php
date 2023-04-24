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
require_once plugin_dir_path(__FILE__) . 'header.php';
require_once plugin_dir_path(__FILE__) . 'settings.php';
require_once plugin_dir_path(__FILE__) . 'dashboard.php';

/**
 * Initializes the plugin by registering the necessary actions and filters.
 */
function chatgpt_content_writer_init() {
    add_action('admin_menu', 'chatgpt_content_writer_register_menu_pages');
    add_action('plugins_loaded', 'chatgpt_content_writer_create_database_table');
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
