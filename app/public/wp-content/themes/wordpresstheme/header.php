<?php
$lang = get_locale();
include 'languages/language-' . $lang . '.php';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<?php echo get_template_directory_uri() ?>/assets/images/favicon.png" type="image/x-icon">
    <?php wp_head(); ?>
    <!-- Google Tag Manager -->
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
            var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-NHWWPG');</script>
    <!-- End Google Tag Manager -->
</head>
<body data-gr-c-s-loaded="true" <?php body_class($lang); ?>>
<div class="loader-wrapper">
    <div class="loader">
        <div class="preloader_inner">0</div>
    </div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<header data-aos="fade-down" data-aos-duration="700" data-aos-delay="700">
    <div class="container">
        <div class="wrap">
            <div class="dc-logo">
                <a href="<?php echo esc_url(home_url('/')); ?>"><img src="<?php echo get_template_directory_uri() ?>/assets/images/logo.png" alt="<?php bloginfo('name'); ?>" title="<?php bloginfo('name'); ?>"/></a>
            </div>
            <div class="main-menu">
                <?php
                if ($lang == 'en') {
                    $menu_items = wp_get_nav_menu_items(10);
                } else {
                    $menu_items = wp_get_nav_menu_items(11);
                }
                ?>
                <ul class="manu-item">
                    <?php
                    foreach ($menu_items as $menu_item) {
                        if (!$menu_item->menu_item_parent) {
                            echo '<li class="first"><a href="' . $menu_item->url . '">' . $menu_item->title . '</a>';
                            $submenu_items = array_filter($menu_items, function($item) use ($menu_item) {
                                return $item->menu_item_parent == $menu_item->ID;
                            });
                            if (!empty($submenu_items)) {

                                echo ' <div class="sub-menu">
                                        <ul class="menu-items">';
                                foreach ($submenu_items as $submenu_item) {
                                    echo '<li class="second"><a href="' . $submenu_item->url . '">' . $submenu_item->title . '</a></li>';
                                }
                                echo '</ul></div>';
                            }
                            echo '</li>';
                        }
                    }
                    ?>
                </ul>
                <div class="burger-nav burger-icons">
                    <div>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>

            <div class="dc-right">
                <a href="<?php $otherLangSwitcher = (pll_current_language() == 'en') ? 'ar' : 'en';
                $langSwitcher = pll_the_languages(array('raw' => 1));
                echo $langSwitcher[$otherLangSwitcher]['url']; ?>" class="ar" title="<?php _t('go_to_language'); ?>">  <?php _t('lang_switcher'); ?> <i class="fi-glob"></i></a>
            </div>
        </div>
    </div>
</header>