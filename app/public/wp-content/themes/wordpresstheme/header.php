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
</head>
<body <?php body_class($lang); ?>>
<header data-aos="fade-down" data-aos-duration="700" data-aos-delay="700">
    <div class="container">
        <div class="wrap">
            <div class="main-menu">
                <?php
                if ($lang == 'en') {
                    $menuitems = wp_get_nav_menu_items(10);
                } else {
                    $menuitems = wp_get_nav_menu_items(11);
                }
                ?>
                <ul class="manu-item">
                    <?php foreach ($menuitems as $menu) { ?>
                        <?php if ($menu->menu_item_parent == 0) { ?>
                            <li class="first"><a href="<?php echo $menu->url ?>"><?php echo $menu->title ?></a>
                                <?php
                                if (\Functions\start::getPageChildren($menu->object_id)) {
                                    ?>
                                    <div class="sub-menu">
                                        <ul class="menu-items">
                                            <?php foreach ($menuitems as $smenu) { ?>
                                                <?php if ($smenu->menu_item_parent == $menu->ID) { ?>
                                                    <li class="second"><a
                                                            href="<?php echo $smenu->url ?>"><?php echo $smenu->title ?></a>
                                                    </li>
                                                <?php }
                                            } ?>
                                        </ul>
                                    </div>

                                <?php } ?>


                            </li>
                        <?php } ?>
                    <?php } ?>
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
                echo $langSwitcher[$otherLangSwitcher]['url']; ?>" class="ar"
                   title="<?php _t('go_to_language'); ?>">  <?php _t('lang_switcher'); ?> <i class="fi-glob"></i></a>
            </div>
        </div>
    </div>
</header>


