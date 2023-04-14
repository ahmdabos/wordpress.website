<?php

class WP_Simple_Location
{
    // Properties
    private $wp_location_trading_hour_days = array();

    // Magic function (triggered on initialization)
    public function __construct()
    {
        $this->setup_hooks();
    }

    private function setup_hooks()
    {
        add_action('init', array($this, 'set_location_trading_hour_days'));
        add_action('init', array($this, 'register_location_content_type'));
        add_action('add_meta_boxes', array($this, 'add_location_meta_boxes'));
        add_action('save_post_wp_locations', array($this, 'save_location'));
        add_action('admin_enqueue_scripts', array($this, 'enqueue_admin_scripts_and_styles'));
        add_action('wp_enqueue_scripts', array($this, 'enqueue_public_scripts_and_styles'));
        add_filter('the_content', array($this, 'prepend_location_meta_to_content'));
        register_activation_hook(__FILE__, array($this, 'plugin_activate'));
        register_deactivation_hook(__FILE__, array($this, 'plugin_deactivate'));
    }

    //set the default trading hour days (used in our admin backend)
    public function set_location_trading_hour_days()
    {
        //set the default days to use for the trading hours
        $this->wp_location_trading_hour_days = apply_filters('wp_location_trading_hours_days',
            array('monday' => 'Monday',
                'tuesday' => 'Tuesday',
                'wednesday' => 'Wednesday',
                'thursday' => 'Thursday',
                'friday' => 'Friday',
                'saturday' => 'Saturday',
                'sunday' => 'Sunday',
            )
        );
    }

    //register the location content type
    public function register_location_content_type()
    {
        //Labels for post type
        $labels = array(
            'name' => 'Location',
            'singular_name' => 'Location',
            'menu_name' => 'Locations',
            'name_admin_bar' => 'Location',
            'add_new' => 'Add New',
            'add_new_item' => 'Add New Location',
            'new_item' => 'New Location',
            'edit_item' => 'Edit Location',
            'view_item' => 'View Location',
            'all_items' => 'All Locations',
            'search_items' => 'Search Locations',
            'parent_item_colon' => 'Parent Location:',
            'not_found' => 'No Locations found.',
            'not_found_in_trash' => 'No Locations found in Trash.',
        );
        //arguments for post type
        $args = array(
            'labels' => $labels,
            'public' => true,
            'publicly_queryable' => true,
            'show_ui' => true,
            'show_in_nav' => true,
            'query_var' => true,
            'hierarchical' => false,
            'supports' => array('title', 'thumbnail', 'editor'),
            'has_archive' => true,
            'menu_position' => 20,
            'show_in_admin_bar' => true,
            'menu_icon' => 'dashicons-location-alt',
            'rewrite' => array('slug' => 'locations', 'with_front' => 'true')
        );
        //register post type
        register_post_type('wp_locations', $args);
    }

    //adding meta boxes for the location content type*/
    public function add_location_meta_boxes()
    {
        add_meta_box(
            'wp_location_meta_box', //id
            'Location Information', //name
            array($this, 'location_meta_box_display'), //display function
            'wp_locations', //post type
            'normal', //location
            'default' //priority
        );
    }


    //Display the location meta box in the post editor.

    public function location_meta_box_display($post)
    {
        // Set nonce field
        wp_nonce_field('wp_location_nonce', 'wp_location_nonce_field');

        // Collect variables
        $wp_location_phone = get_post_meta($post->ID, 'wp_location_phone', true);
        $wp_location_email = get_post_meta($post->ID, 'wp_location_email', true);
        $wp_location_address = get_post_meta($post->ID, 'wp_location_address', true);

        // Display form
        ?>
        <p>Enter additional information about your location</p>
        <div class="field-container">
            <?php do_action('wp_location_admin_form_start'); ?>

            <div class="field">
                <label for="wp_location_phone">Contact Phone</label>
                <small>Main contact number</small>
                <input type="tel" name="wp_location_phone" id="wp_location_phone" value="<?= $wp_location_phone ?>"/>
            </div>

            <div class="field">
                <label for="wp_location_email">Contact Email</label>
                <small>Email contact</small>
                <input type="email" name="wp_location_email" id="wp_location_email" value="<?= $wp_location_email ?>"/>
            </div>

            <div class="field">
                <label for="wp_location_address">Address</label>
                <small>Physical address of your location</small>
                <textarea name="wp_location_address" id="wp_location_address"><?= $wp_location_address ?></textarea>
            </div>

            <?php if (!empty($this->wp_location_trading_hour_days)): ?>
                <div class="field">
                    <label>Trading Hours</label>
                    <small>Trading hours for the location (e.g. 9am - 5pm)</small>

                    <?php foreach ($this->wp_location_trading_hour_days as $day_key => $day_value): ?>
                        <?php
                        $wp_location_trading_hour_value = get_post_meta($post->ID, 'wp_location_trading_hours_' . $day_key, true);
                        ?>
                        <label for="wp_location_trading_hours_<?= $day_key ?>">
                            <?= $day_key ?>
                        </label>
                        <input type="text" name="wp_location_trading_hours_<?= $day_key ?>"
                               id="wp_location_trading_hours_<?= $day_key ?>"
                               value="<?= $wp_location_trading_hour_value ?>"/>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <?php do_action('wp_location_admin_form_end'); ?>
        </div>
        <?php
    }

    //triggered on activation of the plugin (called only once)
    public function plugin_activate()
    {
        //call our custom content type function
        $this->register_location_content_type();
        //flush permalinks
        flush_rewrite_rules();
    }

    //trigered on deactivation of the plugin (called only once)
    public function plugin_deactivate()
    {
        //flush permalinks
        flush_rewrite_rules();
    }

    public function prepend_location_meta_to_content($content)
    {
        if (!is_singular('wp_locations')) {
            return $content;
        }

        $location_id = get_the_ID();
        $location_phone = get_post_meta($location_id, 'wp_location_phone', true);
        $location_email = get_post_meta($location_id, 'wp_location_email', true);
        $location_address = get_post_meta($location_id, 'wp_location_address', true);

        $html = '';
        $html .= '<section class="meta-data">';

        do_action('wp_location_meta_data_output_start', $location_id);

        if (!empty($location_phone) || !empty($location_email) || !empty($location_address) || !empty($this->wp_location_trading_hour_days)) {
            $html .= '<p>';

            if (!empty($location_phone)) {
                $html .= '<b>Location Phone:</b> ' . esc_html($location_phone) . '<br>';
            }

            if (!empty($location_email)) {
                $html .= '<b>Location Email:</b> ' . sanitize_email($location_email) . '<br>';
            }

            if (!empty($location_address)) {
                $html .= '<b>Location Address:</b> ' . esc_html($location_address) . '<br>';
            }

            if (!empty($this->wp_location_trading_hour_days)) {
                $html .= '<b>Location Trading Hours:</b><br>';
                foreach ($this->wp_location_trading_hour_days as $day_key => $day_value) {
                    $trading_hours = get_post_meta($location_id, 'wp_location_trading_hours_' . $day_key, true);
                    if (!empty($trading_hours)) {
                        $html .= '<span class="day">' . esc_html($day_value) . ':</span> <span class="hours">' . esc_html($trading_hours) . '</span><br>';
                    }
                }
            }

            $html .= '</p>';
        }

        do_action('wp_location_meta_data_output_end', $location_id);
        $html .= '</section>';
        $html .= $content;

        return $html;
    }

    //triggered when adding or editing a location
    public function save_location($post_id)
    {
        // Check for nonce
        if (!isset($_POST['wp_location_nonce_field']) || !wp_verify_nonce($_POST['wp_location_nonce_field'], 'wp_location_nonce')) {
            return $post_id;
        }

        // Check for autosave
        if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
            return $post_id;
        }

        // Get and sanitize phone, email, and address fields
        $fields = [
            'wp_location_phone',
            'wp_location_email',
            'wp_location_address',
        ];
        foreach ($fields as $field) {
            if (isset($_POST[$field])) {
                $value = sanitize_text_field($_POST[$field]);
                update_post_meta($post_id, $field, $value);
            }
        }

        // Update trading hour data
        $trading_hour_fields = preg_grep('/^wp_location_trading_hours_/', array_keys($_POST));
        foreach ($trading_hour_fields as $field) {
            update_post_meta($post_id, $field, sanitize_text_field($_POST[$field]));
        }

        // Location save hook
        do_action('wp_location_admin_save', $post_id, $_POST);
    }

    //enqueus scripts and stles on the back end
    public function enqueue_admin_scripts_and_styles()
    {
        wp_enqueue_style('wp_location_admin_styles', plugin_dir_url(__FILE__) . '/css/wp-location-admin-styles.css');
    }

    //enqueues scripts and styled on the front end
    public function enqueue_public_scripts_and_styles()
    {
        wp_enqueue_style('wp_location_public_styles', plugin_dir_url(__FILE__) . '/css/wp-location-public-styles.css');

    }
}
