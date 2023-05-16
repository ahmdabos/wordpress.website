<?php
/**
 * Plugin Name: WP Backup
 * Plugin URI: https://innovatingweb.com
 * Description: This plugin creates a backup of the WordPress database and files on a weekly basis.
 * Version: 1.0
 * Author: Ahmed Abbous
 * Author URI: https://innovatingweb.com
 **/

add_action('the_wp_backup', 'perform_backup');

function perform_backup() {
    if (!defined('ABSPATH')) {
        define('ABSPATH', dirname(__FILE__, 4) . '/');
    }
    $backup_script_path = plugin_dir_path(__FILE__) . 'script.php';
    if (file_exists($backup_script_path)) {
        ob_start();
        $return_var = include($backup_script_path);
        ob_end_clean();
        if ($return_var !== 1) {
            error_log("Backup script returned an error: $return_var");
        }
    } else {
        error_log("Backup script not found: $backup_script_path");
    }
}

add_filter('cron_schedules', 'add_cron_schedule');

function add_cron_schedule($schedules) {
    $schedules['every_interval_time'] = array(
        'interval' => 604800,
        'display'  => 'Once Weekly',
    );

    return $schedules;
}

register_activation_hook(__FILE__, 'activate_the_wp_backup');

function activate_the_wp_backup() {
    if (!wp_next_scheduled('the_wp_backup')) {
        wp_schedule_event(time(), 'every_interval_time', 'the_wp_backup');
    }
}

register_deactivation_hook(__FILE__, 'deactivate_the_wp_backup');

function deactivate_the_wp_backup() {
    wp_clear_scheduled_hook('the_wp_backup');
}
