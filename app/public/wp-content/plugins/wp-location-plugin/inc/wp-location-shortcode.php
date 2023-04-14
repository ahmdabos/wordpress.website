<?php

defined('ABSPATH') or die('Nope, not accessing this');

class WP_Location_Shortcode {
    public function __construct() {
        add_action('init', array($this, 'register_location_shortcodes'));
    }

    public function register_location_shortcodes() {
        add_shortcode('wp_locations', array($this, 'location_shortcode_output'));
    }

    public function location_shortcode_output($atts, $content = '', $tag) {
        $default_args = array(
            'location_id' => '',
            'number_of_locations' => -1
        );

        $arguments = shortcode_atts($default_args, $atts, $tag);

        $location_args = array(
            'post_type' => 'wp_locations',
            'posts_per_page' => $arguments['number_of_locations'],
            'post_status' => 'publish'
        );

        if (!empty($arguments['location_id'])) {
            $location_args['include'] = $arguments['location_id'];
        }

        $html = '';
        $locations = get_posts($location_args);

        if ($locations) {
            $html .= '<article class="location_list cf">';

            foreach ($locations as $location) {
                $html .= $this->generate_location_section($location);
            }

            $html .= '</article>';
            $html .= '<div class="cf"></div>';
        }

        return $html;
    }

    private function generate_location_section($location) {
        $wp_location_id = $location->ID;
        $wp_location_title = get_the_title($wp_location_id);
        $wp_location_thumbnail = get_the_post_thumbnail($wp_location_id, 'thumbnail');
        $wp_location_content = apply_filters('the_content', $location->post_content);
        $wp_location_content = !empty($wp_location_content) ? wp_trim_words(strip_tags($wp_location_content), 40, '...') : '';
        $wp_location_permalink = get_permalink($wp_location_id);
        $wp_location_phone = get_post_meta($wp_location_id, 'wp_location_phone', true);
        $wp_location_email = get_post_meta($wp_location_id, 'wp_location_email', true);

        $html = '<section class="location">';
        $html = apply_filters('wp_location_before_main_content', $html, $location);

        $html .= "<h2 class='title'><a href='{$wp_location_permalink}' title='view location'>{$wp_location_title}</a></h2>";

        if (!empty($wp_location_thumbnail) || !empty($wp_location_content)) {
            $html .= "<p class='image_content'>{$wp_location_thumbnail}{$wp_location_content}</p>";
        }

        if (!empty($wp_location_phone) || !empty($wp_location_email)) {
            $phone_html = !empty($wp_location_phone) ? "<b>Phone: </b>{$wp_location_phone}<br>" : '';
            $email_html = !empty($wp_location_email) ? "<b>Email: </b>{$wp_location_email}" : '';
            $html .= "<p class='phone_email'>{$phone_html}{$email_html}</p>";
        }

        $html = apply_filters('wp_location_after_main_content', $html, $location);

        $html .= "<a class='link' href='{$wp_location_permalink}' title='view location'>View Location</a>";
        $html .= '</section>';

        return $html;
    }
}

new WP_Location_Shortcode();