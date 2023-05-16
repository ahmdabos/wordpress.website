<?php

namespace Functions;

class Start
{

    public static function breadcrumbs()
    {
        global $post;

        if (get_locale() == 'en') {
            $home = 'Home';
        } else {
            $home = 'الرئيسة';
        }

        echo '<ul class="breadcrumb-wrap">';
        echo '<li><a href="' . esc_url(get_home_url()) . '">' . $home . '</a></li>';

        if ($post->post_parent) {
            $anc = get_post_ancestors($post->ID);
            $anc = array_reverse($anc);

            if (!isset($parents)) {
                $parents = null;
            }

            foreach ($anc as $ancestor) {
                $parents .= '<li><a href="' . esc_url(get_permalink($ancestor)) . '">' . get_the_title($ancestor) . '</a></li>';
            }

            echo $parents;
            echo '<li>' . get_the_title() . ' </li>';
        } else {
            echo '<li>' . get_the_title() . ' </li>';
        }

        echo '</ul>';
    }

    public static function pagination($pages = '', $range = 2)
    {
        $showitems = ($range * 2) + 1;

        global $paged;
        if (empty($paged)) {
            $paged = 1;
        }
        if ($pages == '') {
            global $wp_query;
            $pages = $wp_query->max_num_pages;
            if (!$pages) {
                $pages = 1;
            }
        }

        if (1 != $pages) {
            if ($paged > 2 && $paged > $range + 1 && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . esc_url(get_pagenum_link(1)) . "'><i class=\"icon fi-long-arrow-left\"></i><span>Prev</span></a></li>";
            }

            if ($paged > 1 && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . esc_url(get_pagenum_link($paged - 1)) . "'><i class=\"icon fi-long-arrow-left\"></i><span></span></a></li>";
            }

            for ($i = 1; $i <= $pages; $i++) {
                if (1 != $pages && (!($i >= $paged + $range + 1 || $i <= $paged - $range - 1) || $pages <= $showitems)) {
                    echo ($paged == $i) ? "<li class=\"page-item active\"><a class=\"page-link\" href=''>" . $i . "</a></li>" :
                        "<li class=\"page-item\"><a class=\"page-link\" href='" . esc_url(get_pagenum_link($i)) . "' class='inactive' >" . $i . "</a></li>";
                }
            }

            if ($paged < $pages && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . esc_url(get_pagenum_link($paged + 1)) . "'><span></span> <i class=\"icon fi-long-arrow-right\"></i></a></li>";
            }

            if ($paged < $pages - 1 && $paged + $range - 1 < $pages && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . esc_url(get_pagenum_link($pages)) . "'><span>Next</span> <i class=\"icon fi-long-arrow-right\"></i></a></li>";
            }
        }
    }

    public function register()
    {
        //register css and js
        add_action('wp_enqueue_scripts', array($this, 'enqueueScripts'));
        //style login page
        add_action('login_enqueue_scripts', array($this, 'style_login_page'));
    }

    public function enqueueScripts()
    {
        wp_register_style('site', get_template_directory_uri() . '/assets/css/site.css', array(), time(), 'all');
        wp_enqueue_style('site');

        wp_register_script('jquery-custom', get_template_directory_uri() . '/assets/js/jquery.min.js', array(), time(), true);
        wp_enqueue_script("jquery-custom");

        wp_register_script('bootstrap', get_template_directory_uri() . '/assets/js/bootstrap.min.js', array('jquery-custom'), time(), true);
        wp_enqueue_script('bootstrap');

        wp_register_script('jquery-ui', get_template_directory_uri() . '/assets/js/jquery-ui.js', array('jquery-custom'), time(), true);
        wp_enqueue_script('jquery-ui');

        wp_register_script('owl-carousel', get_template_directory_uri() . '/assets/js/owl.carousel.min.js', array('jquery-custom'), time(), true);
        wp_enqueue_script('owl-carousel');

        wp_register_script('popper', get_template_directory_uri() . '/assets/js/popper.min.js', array('jquery-custom'), time(), true);
        wp_enqueue_script('popper');
        wp_register_script('main', get_template_directory_uri() . '/assets/js/main.js', array('jquery-custom'), time(), true);
        wp_enqueue_script('main');
    }




    public function style_login_page()
    { ?>
        <style type="text/css">
            body.login {
                background: #fff;
            }

            body.login .wp-core-ui .button-primary {
                background: #316ea1;
                border-color: #286191;
            }

            body.login div#login h1 a {
                width: 60%;

                background-image: url(<?php echo get_stylesheet_directory_uri(); ?>/assets/images/logo.png);
                background-size: contain;
                margin: 0 auto 0;
            }

            #loginform input[type="text"], .login form input[type="password"] {
                border: 3px solid #2c5d86;
            }

            #loginform {
                background: #ffffff !important;
                box-shadow: 3px 3px 8px #336793 !important;
            }
        </style>

    <?php }



}
