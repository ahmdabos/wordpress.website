<?php
// If uninstall not called from WordPress, then exit.
if (!defined('WP_UNINSTALL_PLUGIN')) {
    exit;
}

// Define the table name to be deleted.
global $wpdb;
$table_name = $wpdb->prefix . 'chatgpt_content_writer';

// Drop the table.
$wpdb->query("DROP TABLE IF EXISTS {$table_name}");