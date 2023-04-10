<?php

defined('ABSPATH') or die('Nope, not accessing this');

/*
Plugin Name: Locations
Plugin URI:  https://google.com
Description: Offices location listing.
Version:     1.2.0
Author:      Ahmad Abbous
Author URI:  http://google.com
License:     GPL2
License URI: https://www.gnu.org/licenses/gpl-2.0.html
*/

require_once(plugin_dir_path(__FILE__) . 'inc/wp-simple-location.php');
require_once(plugin_dir_path(__FILE__) . 'inc/wp-location-shortcode.php');
require_once(plugin_dir_path(__FILE__) . 'inc/wp-location-widget.php');

function wp_simple_location_init() {
    new WP_Simple_Location();
}

add_action('plugins_loaded', 'wp_simple_location_init');
