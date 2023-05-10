<?php
/*
Plugin Name: ChatGPT Content Generator
Description: A plugin to generate content for posts using GPT, Pixabay, and Unsplash.
Version: 1.3
Author: Ahmed Abbous
Author URI: https://innovatingweb.com
*/

if (!defined('ABSPATH')) {
    exit;
}

require_once plugin_dir_path(__FILE__) . 'includes/class-ccg-plugin.php';

class ChatGPT_Content_Generator
{
    public function __construct()
    {
        add_action('admin_init', array($this, 'check_php_version'));
        add_action('plugins_loaded', array($this, 'run'));
    }

    public function check_php_version()
    {
        if (version_compare(PHP_VERSION, '7.4.0', '<')) {
            if (is_admin()) {
                add_action('admin_notices', array($this, 'php_version_error'));
            }
            $this->deactivate_self();
        }
    }

    public function php_version_error()
    {
        echo '<div class="error"><p>ChatGPT Content Generator requires PHP 7.4.0 or higher. Your current PHP version is ' . PHP_VERSION . '. Please upgrade your PHP version to use this plugin.</p></div>';
    }

    public function deactivate_self()
    {
        deactivate_plugins(plugin_basename(__FILE__));
    }

    public function run()
    {
        if (version_compare(PHP_VERSION, '7.4.0', '>=')) {
            $ccg_plugin = new CCG_Plugin();
            register_activation_hook(__FILE__, array($ccg_plugin, 'activate'));
            register_deactivation_hook(__FILE__, array($ccg_plugin, 'deactivate'));
            $ccg_plugin->start();
        }
    }
}

new ChatGPT_Content_Generator();
