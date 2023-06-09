<?php

if (!defined('ABSPATH')) {
    exit;
}

class Base_General
{
    public function __construct()
    {
        //theme setup
        add_action('init', array($this, 'theme_setup'), 1);
        //remove admin items
        add_action('admin_menu', array($this, 'remove_admin_items'), 1);
        //custom excerpt length
        add_filter('excerpt_length', array($this, 'custom_excerpt_length'), 1);
        //use classic editor
        add_filter('use_block_editor_for_post', '__return_false', 10);
        //remove Thank you message in the admin footer
        add_action('admin_init', array($this, 'remove_wp_thank_you'));
        //disable some apis
        add_filter('rest_endpoints', function ($endpoints) {
            if (isset($endpoints['/wp/v2/users'])) {
                unset($endpoints['/wp/v2/users']);
            }
            if (isset($endpoints['/wp/v2/users/(?P<id>[\d]+)'])) {
                unset($endpoints['/wp/v2/users/(?P<id>[\d]+)']);
            }
            return $endpoints;
        });
        //remove comments from admin
        add_filter('comments_open', '__return_false');
        //change login logo url
        add_filter('login_headerurl', array($this, 'login_logo_url'));
        //disable login username autocomplete
        //add_action('login_form', array($this, 'disable_login_username_auto_complete'));
        //hide consoles when inspect for non-admin users
        add_action('admin_head', array($this, 'hide_console_none_admin'), 1);
        //hide wp version
        add_filter('the_generator', array($this, 'hide_wp_version'));
        //hide wp update notification
        add_action('admin_init', array($this, 'hide_wp_update_notifications'));
        //disable visual tab on editor
        //add_filter('user_can_richedit', array($this, 'disable_visual_tab_editor'));
        //ignore line break in wp editor
        //remove_filter('the_content', 'wpautop');
        //hide admin bar for none admin users
        add_action('after_setup_theme', array($this, 'hide_admin_bar_for_none_admin_users'));
        //hide help tab in the admin dashboard
        add_action('admin_head', array($this, 'hide_help_tab_dashboard'));
        //change login error message
        add_filter('login_errors', array($this, 'change_login_error_message'));
        //remove widget from dashboard
        add_action('wp_dashboard_setup', array($this, 'remove_dashboard_widgets'));
        //limit login attempt
        add_filter('authenticate', array($this, 'limit_login_attempts'), 30, 3);
        //force admin in english
        add_filter('locale', array($this, 'force_english_admin'));
        //disable users in sitemap
        add_filter('wp_sitemaps_add_provider', array($this, 'exclude_users_from_sitemap'), 10, 2);



    }

    public function theme_setup()
    {
        if (function_exists('acf_add_options_page')) {
            acf_add_options_page(array(
                'page_title' => 'Options',
                'menu_title' => 'Options',
                'menu_slug' => 'theme-general-settings',
                'capability' => 'edit_posts',
                'redirect' => false
            ));
        }
        load_theme_textdomain('themetextdomain', get_template_directory() . '/languages');
        add_theme_support('automatic-feed-links');
        add_theme_support('title-tag');
        add_theme_support('post-thumbnails');
        register_nav_menus(array(
            'menu-1' => esc_html__('Primary'),
        ));
        add_theme_support('html5', array(
            'search-form',
            'gallery',
            'caption',
        ));
        add_post_type_support('page', array(
            'excerpt'
        ));
        $custom_post_types = get_post_types(array('public' => true, '_builtin' => false), 'names', 'and');
        if ($custom_post_types) {
            foreach ($custom_post_types as $post_type) {
                remove_post_type_support($post_type, 'comments');
                remove_post_type_support($post_type, 'discussion');
            }
        }
        $builtin_post_types = get_post_types(array('public' => true, '_builtin' => true), 'names', 'and');
        if ($builtin_post_types) {
            foreach ($builtin_post_types as $post_type) {
                remove_post_type_support($post_type, 'comments');
                remove_post_type_support($post_type, 'discussion');
            }
        }
    }

    public function remove_admin_items()
    {
        //remove comment from post detail
        remove_meta_box('commentsdiv', 'post', 'normal');
        //remove post link
        // remove_menu_page('edit.php');
        //remove comment link
        remove_menu_page('edit-comments.php');
        //remove wp version and logo
        if (!is_super_admin()) {
            remove_filter('update_footer', 'core_update_footer');
        }
    }

    public function custom_excerpt_length()
    {
        return 50;
    }

    public function remove_wp_thank_you()
    {
        add_filter('admin_footer_text', function ($content) {
            return "";
        }, 11);
    }

    public function login_logo_url()
    {
        return home_url();
    }

    public function disable_login_username_auto_complete()
    {
        echo <<<html
        <script>
            document.getElementById( "user_login" ).autocomplete = "off";
            document.getElementById( "user_pass" ).autocomplete = "off";
        </script>
html;
    }

    public function hide_console_none_admin()
    {
        if (!current_user_can('administrator')) {
            ?>
            <script type="text/javascript">
                console.log = function () {
                };
            </script>
            <?php
        }
    }

    public function hide_wp_update_notifications()
    {
        if (!current_user_can('administrator')) {
            remove_action('admin_notices', 'update_nag', 3);
        }
    }

    public function disable_visual_tab_editor()
    {
        return false;
    }

    public function hide_admin_bar_for_none_admin_users()
    {
        if (!current_user_can('administrator') && !is_admin()) {
            show_admin_bar(false);
        }
    }

    public function hide_help_tab_dashboard()
    {
        if (is_admin()) {
            echo '<style type="text/css">
            #contextual-help-link-wrap { display: none !important; }
          </style>';
        }
    }

    public function hide_wp_version()
    {
        return '';
    }

    public function change_login_error_message()
    {
        return 'Wrong credential!';
    }

    public function remove_dashboard_widgets()
    {
        global $wp_meta_boxes;
        unset($wp_meta_boxes['dashboard']['side']['core']['dashboard_quick_press']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_incoming_links']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_right_now']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_plugins']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_recent_drafts']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_recent_comments']);
        unset($wp_meta_boxes['dashboard']['side']['core']['dashboard_primary']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_activity']);
        unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_site_health']);
        remove_action('welcome_panel', 'wp_welcome_panel');
    }

    public function limit_login_attempts($user, $username, $password)
    {
        $max_login_attempts = 7;
        $client_ip = $_SERVER['REMOTE_ADDR'];
        $login_attempts = get_transient('login_attempts_' . $client_ip);
        if ($login_attempts) {
            $login_attempts = json_decode($login_attempts, true);
            if ($login_attempts['attempts'] >= $max_login_attempts) {
                $secs_to_wait = ($login_attempts['attempt_time'] + 60 * 60) - time();
                if ($secs_to_wait > 0) {
                    return new WP_Error('too_many_attempts', 'Too many failed login attempts. Please wait ' . round($secs_to_wait / 60) . ' minutes before trying again.');
                }
            }
        }
        $user = get_user_by('login', $username);
        if (!$user) {
            if (!$login_attempts) {
                $login_attempts = array('attempts' => 1, 'attempt_time' => time());
            } else {
                $login_attempts['attempts']++;
            }
            set_transient('login_attempts_' . $client_ip, json_encode($login_attempts), 60 * 60);
            return new WP_Error('invalid_username', 'Invalid username. Please try again.');
        }
        if (!wp_check_password($password, $user->user_pass, $user->ID)) {
            if (!$login_attempts) {
                $login_attempts = array('attempts' => 1, 'attempt_time' => time());
            } else {
                $login_attempts['attempts']++;
            }
            set_transient('login_attempts_' . $client_ip, json_encode($login_attempts), 60 * 60);
            return new WP_Error('incorrect_password', 'Incorrect password. Please try again.');
        }
        delete_transient('login_attempts_' . $client_ip);
        return $user;
    }

    public function force_english_admin($locale)
    {
        if (is_admin()) {
            return 'en_US';
        }
        return $locale;
    }

    public function exclude_users_from_sitemap($provider, $name)
    {
        if ($name === 'users') {
            return null;
        }
        return $provider;
    }
}

new Base_General();