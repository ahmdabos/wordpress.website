<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Plugin
{
    public function __construct()
    {
        $this->load_dependencies();
        $this->define_hooks();

    }

    private function load_dependencies()
    {
        try {
            require_once plugin_dir_path(dirname(__FILE__)) . 'admin/class-ccg-admin.php';
            require_once plugin_dir_path(dirname(__FILE__)) . 'admin/class-ccg-settings.php';
            require_once plugin_dir_path(dirname(__FILE__)) . 'public/class-ccg-public.php';
            require_once plugin_dir_path(__FILE__) . 'class-ccg-fetch-image.php';
            require_once plugin_dir_path(__FILE__) . 'class-ccg-chatgpt.php';
            require_once plugin_dir_path(__FILE__) . 'class-ccg-generate-content.php';
            require_once plugin_dir_path(__FILE__) . 'class-ccg-create-post.php';
            require_once plugin_dir_path(__FILE__) . 'class-ccg-tables.php';
        } catch (Exception $e) {
            add_action('admin_notices', function () use ($e) {
                echo '<div class="notice notice-error is-dismissible"><p>Error loading dependencies: ' . $e->getMessage() . '</p></div>';
            });
        }
    }

    private function define_hooks()
    {
        add_action('admin_menu', [$this, 'create_main_menu_page']);
        add_action('admin_menu', [$this, 'create_setting_menu_page']);
        add_action('admin_init', [$this, 'register_settings']);

    }

    public function create_main_menu_page()
    {
        $admin = new CCG_Admin();
        $admin->create_main_menu_page();
    }

    public function create_setting_menu_page()
    {
        $settings = new CCG_Settings();
        $settings->create_settings_page();
    }

    public function register_settings()
    {
        $settings = new CCG_Settings();
        $settings->register_settings();
    }

    public function activate()
    {
        $tables = new CCG_Tables();
        $tables->create_images_table();
    }

    public function deactivate()
    {
        $tables = new CCG_Tables();
        $tables->drop_images_table();
    }

    public function start()
    {
        new CCG_Public();
    }

}
