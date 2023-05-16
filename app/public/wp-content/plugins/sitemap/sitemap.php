<?php

/**
 * Plugin Name: Sitemap
 * Description: This is a plugin to generate a sitemap.xml file.
 * Version: 1.0
 * Author: Ahmed Abbous
 * Author URI: https://innovatingweb.com
 */

// Hook for adding admin menus
add_action('admin_menu', 'mt_add_pages');

// action function for above hook
function mt_add_pages()
{
    add_menu_page(__('Test Settings', 'menu-test'), __('Test Settings', 'menu-test'), 'manage_options', 'testsettings', 'mt_settings_page');
}

// mt_settings_page() displays the page content for the Test settings submenu
function mt_settings_page()
{
    echo "<h2>" . __('Test Settings', 'menu-test') . "</h2>";
}

// Add a rewrite rule and flush on plugin activation
register_activation_hook(__FILE__, 'my_sitemap_plugin_activate');
function my_sitemap_plugin_activate()
{
    my_sitemap_plugin_rewrite_rule();
    flush_rewrite_rules();
}

// Flush on plugin deactivation
register_deactivation_hook(__FILE__, 'my_sitemap_plugin_deactivate');
function my_sitemap_plugin_deactivate()
{
    flush_rewrite_rules();
}

// Create a new rewrite rule
function my_sitemap_plugin_rewrite_rule()
{
    add_rewrite_rule('sitemap.xml$', 'index.php?my_sitemap_plugin=1', 'top');
}

// Register the custom query var
add_filter('query_vars', 'my_sitemap_plugin_query_vars');
function my_sitemap_plugin_query_vars($vars)
{
    $vars[] = 'my_sitemap_plugin';
    return $vars;
}

// If this is the sitemap.xml page, generate the sitemap
add_action('template_redirect', 'my_sitemap_plugin_template_redirect');
function my_sitemap_plugin_template_redirect()
{
    global $wp_query;

    if (!isset($wp_query->query_vars['my_sitemap_plugin'])) {
        return;
    }

    my_sitemap_plugin_generate_sitemap();
    exit;
}

// Generate the sitemap
function my_sitemap_plugin_generate_sitemap() {
    // Fetch posts, pages, and custom post types
    $post_types = get_post_types(array('public' => true), 'names');
    $exclude_types = array('post', 'page'); // Exclude default post types

    // Remove excluded types
    $custom_post_types = array_diff($post_types, $exclude_types);

    // Fetch posts, pages, and custom post types
    $args = array(
        'post_type' => $custom_post_types,
        'post_status' => 'publish',
        'posts_per_page' => -1,
    );
    $query = new WP_Query($args);

    // Fetch categories
    $categories = get_categories();

    // Start outputting XML
    header('Content-Type: application/xml; charset=utf-8');
    echo '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL;
    echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . PHP_EOL;

    // Output posts, pages, and custom post types
    while ($query->have_posts()) {
        $query->the_post();
        $post_url = get_permalink();
        $post_date = get_the_modified_date('Y-m-d\TH:i:sP');

        echo '<url>' . PHP_EOL;
        echo '<loc>' . $post_url . '</loc>' . PHP_EOL;
        echo '<lastmod>' . $post_date . '</lastmod>' . PHP_EOL;
        echo '</url>' . PHP_EOL;
    }

    // Output categories
    foreach ($categories as $category) {
        $category_url = get_category_link($category->term_id);

        echo '<url>' . PHP_EOL;
        echo '<loc>' . $category_url . '</loc>' . PHP_EOL;
        echo '</url>' . PHP_EOL;
    }

    // End XML output
    echo '</urlset>';
    exit;
}

