<?php
if (!defined('ABSPATH')) {
    exit;
}

class CH_Plugin
{
    public function __construct()
    {
        $this->load_dependencies();
        $this->define_hooks();

    }

    private function load_dependencies()
    {
        try {
            require_once plugin_dir_path(dirname(__FILE__)) . 'admin/class-ch-admin.php';
            require_once plugin_dir_path(dirname(__FILE__)) . 'admin/class-ch-settings.php';
            require_once plugin_dir_path(dirname(__FILE__)) . 'public/class-ch-public.php';
            require_once plugin_dir_path(__FILE__) . 'class-ch-chatgpt.php';
            require_once plugin_dir_path(__FILE__) . 'class-ch-generate-content.php';
        } catch (Exception $e) {
            add_action('admin_notices', function () use ($e) {
                echo '<div class="notice notice-error is-dismissible"><p>Error loading dependencies: ' . $e->getMessage() . '</p></div>';
            });
        }
    }

    private function define_hooks()
    {
        add_action('add_meta_boxes', [$this, 'create_meta_boxes']);
        add_action('admin_menu', [$this, 'create_setting_menu_page']);
        add_action('admin_init', [$this, 'register_settings']);

    }

    public function create_meta_boxes()
    {
        $admin = new CH_Admin();
        $admin->create_meta_boxes();
    }

    public function create_setting_menu_page()
    {
        $settings = new CH_Settings();
        $settings->create_admin_page();
    }

    public function register_settings()
    {
        $settings = new CH_Settings();
        $settings->register_settings();
    }


    public function activate()
    {

    }

    public function deactivate()
    {

    }

    public function start()
    {
        new CH_Public();
    }

}
