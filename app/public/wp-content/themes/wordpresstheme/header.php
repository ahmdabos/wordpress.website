<?php
$lang = get_locale();
include 'languages/language-' . $lang . '.php';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php wp_title('|', true, 'right'); bloginfo('name'); ?></title>
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo get_template_directory_uri(); ?>/assets/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?php echo get_template_directory_uri(); ?>/assets/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo get_template_directory_uri(); ?>/assets/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="<?php echo get_template_directory_uri(); ?>/assets/img/favicon/site.webmanifest">
    <?php
    if (is_single() || is_page()) {
        if (have_posts()) : while (have_posts()) : the_post();
            $excerpt = get_the_excerpt();
            echo '<meta name="description" content="' . $excerpt . '">';
        endwhile; endif;
        rewind_posts();
    }
    ?>
    <?php wp_head(); ?>
</head>
<body <?php body_class($lang); ?>>
<header>
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
            </div>
            <div class="dc-right">
                <a href="<?php $otherLangSwitcher = (pll_current_language() == 'en') ? 'ar' : 'en';
                $langSwitcher = pll_the_languages(array('raw' => 1));
                echo $langSwitcher[$otherLangSwitcher]['url']; ?>" class="ar" title="<?php _t('go_to_language'); ?>">  <?php _t('lang_switcher'); ?> <i class="fi-glob"></i></a>
            </div>
        </div>
    </div>
</header>
