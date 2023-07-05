<?php
$lang = 'en';
include 'languages/language-' . $lang . '.php';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php wp_title('|', true, 'right');
        bloginfo('name'); ?></title>
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">


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


<header id="header" class="header d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="<?php echo esc_url(home_url('/')); ?>" class="logo d-flex align-items-center">
            <h1>Website Title<span>.</span></h1>
        </a>
        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
        <nav id="navbar" class="navbar">
            <ul>
                <?php
                if ($lang == 'en') {
                    $menu_items = wp_get_nav_menu_items(10);
                } else {
                    $menu_items = wp_get_nav_menu_items(11);
                }
                ?>

                <?php
                foreach ($menu_items as $menu_item) {
                    if (!$menu_item->menu_item_parent) {
                        echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a>';
                        $submenu_items = array_filter($menu_items, function ($item) use ($menu_item) {
                            return $item->menu_item_parent == $menu_item->ID;
                        });
                        if (!empty($submenu_items)) {
                            echo '<ul><li  class="dropdown"><a href="' . $menu_item->url . '">' . $menu_item->title . '</a>';
                            foreach ($submenu_items as $submenu_item) {
                                echo '<li class="second"><a href="' . $submenu_item->url . '">' . $submenu_item->title . '</a></li>';
                            }
                            echo '</ul>';
                        }
                        echo '</li>';
                    }
                }
                ?>
            </ul>
        </nav>
    </div>
</header>


