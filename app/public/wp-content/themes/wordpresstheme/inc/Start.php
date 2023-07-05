<?php

namespace Functions;

class Start
{

    public function register()
    {

        //style login page
        add_action('login_enqueue_scripts', array($this, 'style_login_page'));
        //register css and js
        add_action('wp_enqueue_scripts', array($this, 'enqueue_scripts'));
        //add defer to all js
        add_filter('script_loader_tag', array($this, 'add_defer_attribute'), 10, 2);
    }

    public static function breadcrumbs()
    {
        global $post;
        $breadcrumbs = array();

        $front_page_id = get_option('page_on_front');
        $home = get_the_title($front_page_id);

        $breadcrumbs[] = array(
            'url' => esc_url(get_home_url()),
            'title' => $home
        );

        if ($post->post_parent) {
            $anc = get_post_ancestors($post->ID);
            $anc = array_reverse($anc);

            foreach ($anc as $ancestor) {
                $breadcrumbs[] = array(
                    'url' => esc_url(get_permalink($ancestor)),
                    'title' => get_the_title($ancestor)
                );
            }

            $breadcrumbs[] = array(
                'url' => null,
                'title' => get_the_title()
            );
        } else {
            $breadcrumbs[] = array(
                'url' => null,
                'title' => get_the_title()
            );
        }

        return $breadcrumbs;
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

    public function enqueue_scripts()
    {
        wp_register_style('main', get_template_directory_uri() . '/assets/css/main.css', array(), time(), 'all');
        wp_enqueue_style('main');

        wp_register_style('bootstrap.min', get_template_directory_uri() . '/assets/vendor/bootstrap/css/bootstrap.min.css', array(), time(), 'all');
        wp_enqueue_style('bootstrap.min');

        wp_register_style('bootstrap-icons', get_template_directory_uri() . '/assets/vendor/bootstrap-icons/bootstrap-icons.css', array(), time(), 'all');
        wp_enqueue_style('bootstrap-icons');
        wp_register_style('all.min', get_template_directory_uri() . '/assets/vendor/fontawesome-free/css/all.min.css', array(), time(), 'all');
        wp_enqueue_style('all.min');
        wp_register_style('aos', get_template_directory_uri() . '/assets/vendor/aos/aos.css', array(), time(), 'all');
        wp_enqueue_style('aos');
        wp_register_style('glightbox.min', get_template_directory_uri() . '/assets/vendor/glightbox/css/glightbox.min.css', array(), time(), 'all');
        wp_enqueue_style('glightbox.min');
        wp_register_style('swiper-bundle.min', get_template_directory_uri() . '/assets/vendor/swiper/swiper-bundle.min.css', array(), time(), 'all');
        wp_enqueue_style('swiper-bundle.min');

        wp_register_script('bootstrap.bundle.min', get_template_directory_uri() . '/assets/vendor/bootstrap/js/bootstrap.bundle.min.js', array(), time(), true);
        wp_enqueue_script("bootstrap.bundle.min");
        wp_register_script('aos', get_template_directory_uri() . '/assets/vendor/aos/aos.js', array(), time(), true);
        wp_enqueue_script("aos");
        wp_register_script('glightbox.min', get_template_directory_uri() . '/assets/vendor/glightbox/js/glightbox.min.js', array(), time(), true);
        wp_enqueue_script("glightbox.min");
        wp_register_script('isotope.pkgd.min', get_template_directory_uri() . '/assets/vendor/isotope-layout/isotope.pkgd.min.js', array(), time(), true);
        wp_enqueue_script("isotope.pkgd.min");
        wp_register_script('swiper-bundle.min', get_template_directory_uri() . '/assets/vendor/swiper/swiper-bundle.min.js', array(), time(), true);
        wp_enqueue_script("swiper-bundle.min");
        wp_register_script('purecounter_vanilla', get_template_directory_uri() . '/assets/vendor/purecounter/purecounter_vanilla.js', array(), time(), true);
        wp_enqueue_script("purecounter_vanilla");
        wp_register_script('main', get_template_directory_uri() . '/assets/js/main.js', array(), time(), true);
        wp_enqueue_script('main');
    }

    public function add_defer_attribute($tag, $handle)
    {
        $scripts_to_defer = array('bootstrap.bundle.min', 'aos', 'glightbox.min', 'isotope.pkgd.min', 'swiper-bundle.min', 'purecounter_vanilla', 'main');

        foreach ($scripts_to_defer as $defer_script) {
            if ($defer_script === $handle) {
                return str_replace(' src', ' defer="defer" src', $tag);
            }
        }
        return $tag;
    }

    public function style_login_page()
    { ?>
        <style>
            .login .language-switcher {
                display: none !important;
            }

            .login .button-primary {
                background: #000000 !important;
                border-color: #000000 !important;;
            }

            body.login div#login h1 a {
                width: 60%;
                background-image: url(<?php echo get_stylesheet_directory_uri(); ?>/assets/images/logo.png);
                background-size: contain;
                margin: 0 auto 0;
            }

            #loginform input[type="text"], .login form input[type="password"] {
                border: 3px solid #000000;
            }

            #loginform {
                background: #ffffff !important;
                box-shadow: 3px 3px 8px #000000 !important;
            }
        </style>

    <?php }


}
