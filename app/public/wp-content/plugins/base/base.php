<?php

/*
Plugin Name: Base
Description: all base features
Version: 1.3
Author: Ahmed Abbous
Author URI: https://innovatingweb.com
*/

if (!defined('ABSPATH')) {
    exit;
}

class Base
{

    private $base_sitemap;

    public function __construct()
    {
        add_action('admin_init', array($this, 'check_php_version'));
        if (version_compare(PHP_VERSION, '7.4.0', '>=')) {
            register_activation_hook(__FILE__, array($this, 'activate'));
            register_deactivation_hook(__FILE__, array($this, 'deactivate'));
        }
        $this->load_dependencies();
        $this->base_sitemap = new Base_Sitemap();
    }

    private function load_dependencies()
    {
        try {
            require_once plugin_dir_path(__FILE__) . 'includes/class-base-sitemap.php';
        } catch (Exception $e) {
            add_action('admin_notices', function () use ($e) {
                echo '<div class="notice notice-error is-dismissible"><p>Error loading dependencies: ' . $e->getMessage() . '</p></div>';
            });
        }
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

    public function activate()
    {

    }

    public function deactivate()
    {

    }

}

new Base();
