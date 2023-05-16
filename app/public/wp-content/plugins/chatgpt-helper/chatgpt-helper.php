<?php
/*
Plugin Name: ChatGPT Helper
Description: A plugin to manipulate the content or generate new content
Version: 1.4
Author: Ahmed Abbous
Author URI: https://innovatingweb.com
*/

if (!defined('ABSPATH')) {
    exit;
}

require_once plugin_dir_path(__FILE__) . 'includes/class-ch-plugin.php';

class ChatGPT_Helper {
    public function __construct() {
        add_action('admin_init', array($this, 'check_php_version'));
        add_action('plugins_loaded', array($this, 'run'));
    }

    public function check_php_version() {
        if (version_compare(PHP_VERSION, '7.4.0', '<')) {
            if (is_admin()) {
                add_action('admin_notices', array($this, 'php_version_error'));
            }
            $this->deactivate_self();
        }
    }

    public function php_version_error() {
        echo '<div class="error"><p>ChatGPT Helper requires PHP 7.4.0 or higher. Your current PHP version is ' . PHP_VERSION . '. Please upgrade your PHP version to use this plugin.</p></div>';
    }

    public function deactivate_self() {
        deactivate_plugins(plugin_basename(__FILE__));
    }

    public function run() {
        if (version_compare(PHP_VERSION, '7.4.0', '>=')) {
            $ch_plugin = new CH_Plugin();
            register_activation_hook(__FILE__, array($ch_plugin, 'activate'));
            register_deactivation_hook(__FILE__, array($ch_plugin, 'deactivate'));
            $ch_plugin->start();
        }
    }
}

// Instantiate the plugin class
new ChatGPT_Helper();
