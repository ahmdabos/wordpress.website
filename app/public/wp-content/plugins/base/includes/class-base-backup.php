<?php
if (!defined('ABSPATH')) {
    exit;
}

class Base_Backup
{
    public function __construct()
    {
        add_action('the_wp_backup', array($this, 'perform_backup'));
        add_filter('cron_schedules', array($this, 'add_cron_schedule'));
        register_activation_hook(BASE_FILE_PATH, array($this, 'activate_the_wp_backup'));
        register_deactivation_hook(BASE_FILE_PATH, array($this, 'deactivate_the_wp_backup'));
    }

    public function perform_backup()
    {
        if (!defined('ABSPATH')) {
            define('ABSPATH', dirname(__FILE__, 4) . '/');
        }
        $backup_script_path = plugin_dir_path(__FILE__) . 'backup-script.php';
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

    public function add_cron_schedule($schedules)
    {
        $schedules['every_interval_time'] = array(
            'interval' => 604800,
            'display' => 'Once Weekly',
        );
        return $schedules;
    }

    public function activate_the_wp_backup()
    {
        if (!wp_next_scheduled('the_wp_backup')) {
            wp_schedule_event(time(), 'every_interval_time', 'the_wp_backup');
        }
    }

    public function deactivate_the_wp_backup()
    {
        wp_clear_scheduled_hook('the_wp_backup');
    }
}

new Base_Backup();

