<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Tables {
    public function create_images_table() {
        global $wpdb;
        $charset_collate = $wpdb->get_charset_collate();
        $table_name = $wpdb->prefix . "ccg_fetched_images";

        if ($wpdb->get_var("SHOW TABLES LIKE '{$table_name}'") != $table_name) {
            $sql = "CREATE TABLE {$table_name} (
                id mediumint(9) NOT NULL AUTO_INCREMENT,
                url VARCHAR(255) NOT NULL,
                image_id VARCHAR(255) NOT NULL,
                source VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
            ) {$charset_collate};";

            require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
            dbDelta($sql);
        }
    }

    public function drop_images_table() {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';

        $sql = "DROP TABLE IF EXISTS $table_name;";
        $wpdb->query($sql);
    }
}
