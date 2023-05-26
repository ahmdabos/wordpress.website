<?php

if (!defined('ABSPATH')) {
    exit;
}

class Base_General
{

    public function __construct()
    {
        //theme setup
        add_action('init', array($this, 'theme_setup'));
        //remove admin items
        add_action('admin_menu', array($this, 'remove_admin_items'));
        //custom excerpt read more text
        add_filter('excerpt_more', array($this, 'custom_excerpt_more'));
        //custom excerpt length
        add_filter('excerpt_length', array($this, 'custom_excerpt_length'));
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
        add_action('login_form', array($this, 'disable_login_username_auto_complete'));
        //hide consoles when inspect for non-admin users
        add_action('admin_head', array($this, 'hide_console_none_admin'), 1);
        //hide wp version
        add_filter('the_generator', array($this, 'hide_wp_version'));
        //hide wp update notification
        add_filter('pre_site_transient_update_core', array($this, 'hide_wp_update_notification'));
        //hide plugins update notification
        add_filter('pre_site_transient_update_plugins', array($this, 'hide_wp_update_notification'));
        //hide themes update notification
        add_filter('pre_site_transient_update_themes', array($this, 'hide_wp_update_notification'));
        //disable visual tab on editor
        add_filter('user_can_richedit', array($this, 'disable_visual_tab_editor'));
        //ignore line break in wp editor
        remove_filter('the_content', 'wpautop');
        //hide admin bar for none admin users
        add_action('after_setup_theme', array($this, 'hide_admin_bar_for_none_admin_users'));
        //disable dashboard widgets
        add_action('wp_dashboard_setup', array($this, 'disable_dashboard_widgets'), 9999);
        //hide help tab in the admin dashboard
        add_action('admin_head', array($this, 'hide_help_tab_dashboard'));
        //update what editor role can see
        add_action('admin_head', array($this, 'update_what_editor_role_can_see'));
        //change login error message
        add_filter('login_errors', array($this, 'change_login_error_message'));
        //hide css files versions
        add_filter('style_loader_src', array($this, 'remove_wp_ver_css_js'), 9999);
        //hide js files versions
        add_filter('script_loader_src', array($this, 'remove_wp_ver_css_js'), 9999);
        //disable default xml sitemaps
        add_filter('wp_sitemaps_enabled', '__return_false');
        //remove widget from dashboard
        add_action('wp_dashboard_setup', array($this, 'remove_dashboard_widgets'));
        //limit login attempt
        add_filter('authenticate', array($this, 'limit_login_attempts'), 30, 3);
        //image optimizer
        add_filter('wp_handle_upload', 'optimize_uploaded_images');
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

    public function custom_excerpt_more()
    {
        return sprintf('<a href="%1$s" >%2$s</a>', get_permalink(get_the_ID()), '...');
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

    public function hide_wp_update_notification()
    {
        global $wp_version;
        if (!current_user_can('administrator')) {
            return (object)array('last_checked' => time(), 'version_checked' => $wp_version,);
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

    public function disable_dashboard_widgets()
    {
        global $wp_meta_boxes;
        $wp_meta_boxes['dashboard']['normal']['core'] = array();
        $wp_meta_boxes['dashboard']['side']['core'] = array();
    }

    public function hide_help_tab_dashboard()
    {
        if (is_admin()) {
            echo '<style type="text/css">
            #contextual-help-link-wrap { display: none !important; }
          </style>';
        }
    }

    public function update_what_editor_role_can_see()
    {
        $role_object = get_role('editor');
        $role_object->add_cap('edit_theme_options');
        if (current_user_can('editor')) {
            remove_submenu_page('themes.php', 'themes.php');
            remove_submenu_page('themes.php', 'widgets.php');
        }
        global $submenu;
        unset($submenu['themes.php'][6]);
    }

    public function hide_wp_version()
    {
        return '';
    }

    public function change_login_error_message()
    {
        return 'Wrong credential!';
    }

    public function remove_wp_ver_css_js($src)
    {
        if (strpos($src, 'ver='))
            $src = remove_query_arg('ver', $src);
        return $src;
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
        // set the number of login attempts based on IP
        $max_login_attempts = 5;

        // get the IP
        $client_ip = $_SERVER['REMOTE_ADDR'];
        // get the transient
        $login_attempts = get_transient('login_attempts_' . $client_ip);

        // check if transient is set, which means a failed login attempt has been made
        if ($login_attempts) {
            $login_attempts = json_decode($login_attempts, true);

            // check if login attempts exceeded max allowed
            if ($login_attempts['attempts'] >= $max_login_attempts) {
                $secs_to_wait = ($login_attempts['attempt_time'] + 60 * 60) - time();
                if ($secs_to_wait > 0) {
                    // if there's time left to wait, return an error message
                    return new WP_Error('too_many_attempts', 'Too many failed login attempts. Please wait ' . round($secs_to_wait / 60) . ' minutes before trying again.');
                }
            }
        }

        // if we're here, it means no transient is set or it expired, so let's try to login
        $user = get_user_by('login', $username);

        if (!$user) {
            // if no such user exists, increase the login attempts and set/update the transient
            if (!$login_attempts) {
                $login_attempts = array('attempts' => 1, 'attempt_time' => time());
            } else {
                $login_attempts['attempts']++;
            }

            set_transient('login_attempts_' . $client_ip, json_encode($login_attempts), 60 * 60);

            return new WP_Error('invalid_username', 'Invalid username. Please try again.');
        }

        // if we're here, it means the user exists, so let's check the password
        if (!wp_check_password($password, $user->user_pass, $user->ID)) {
            // if the password is wrong, increase the login attempts and set/update the transient
            if (!$login_attempts) {
                $login_attempts = array('attempts' => 1, 'attempt_time' => time());
            } else {
                $login_attempts['attempts']++;
            }

            set_transient('login_attempts_' . $client_ip, json_encode($login_attempts), 60 * 60);

            return new WP_Error('incorrect_password', 'Incorrect password. Please try again.');
        }

        // if we're here, it means the login is successful, so let's delete the transient
        delete_transient('login_attempts_' . $client_ip);

        return $user;
    }

    public function optimize_uploaded_images($image)
    {
        $image_path = $image['file'];
        $ext = pathinfo($image_path, PATHINFO_EXTENSION);

        if ($ext == 'jpg' || $ext == 'jpeg' || $ext == 'png') {
            if (extension_loaded('imagick') || class_exists("Imagick")) {
                $img = new Imagick($image_path);

                if ($ext == 'png') {
                    $img->setImageFormat('png8');
                }

                $img->optimizeImageLayers();
                $img->stripImage();
                $img->writeImage($image_path);
                $img->clear();
                $img->destroy();

            } else if (extension_loaded('gd')) {
                if ($ext == 'jpg' || $ext == 'jpeg') {
                    $img = imagecreatefromjpeg($image_path);
                    imagejpeg($img, $image_path, 80);
                } else if ($ext == 'png') {
                    $img = imagecreatefrompng($image_path);
                    imagealphablending($img, false);
                    imagesavealpha($img, true);
                    imagepng($img, $image_path, 8);
                }
                imagedestroy($img);
            }
        }

        return $image;
    }
}

new Base_General();