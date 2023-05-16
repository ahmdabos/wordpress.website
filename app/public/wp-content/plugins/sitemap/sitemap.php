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
    // Initialize XML output
    $xml = new DOMDocument('1.0', 'UTF-8');
    $xml->formatOutput = true;

    // Create the root <urlset> element
    $urlset = $xml->createElement('urlset');
    $urlset->setAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
    $xml->appendChild($urlset);

    // Fetch posts, pages, custom post types, and categories
    $query_args = array(
        'post_type' => array('post', 'page', 'your_custom_post_type'),
        'post_status' => 'publish',
        'posts_per_page' => -1,
    );
    $query = new WP_Query($query_args);

    // Loop through each post and add it to the sitemap
    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();

            // Create <url> element
            $url = $xml->createElement('url');

            // Create <loc> element and set the URL
            $loc = $xml->createElement('loc', get_permalink());
            $url->appendChild($loc);

            // Create <lastmod> element and set the last modified date
            $lastmod = $xml->createElement('lastmod', get_the_modified_time('Y-m-d\TH:i:s\Z'));
            $url->appendChild($lastmod);

            // Create <changefreq> element and set the change frequency
            $changefreq = $xml->createElement('changefreq', 'weekly');
            $url->appendChild($changefreq);

            // Add <url> element to <urlset>
            $urlset->appendChild($url);
        }
    }

    // Fetch categories
    $categories = get_categories();

    // Loop through each category and add it to the sitemap
    foreach ($categories as $category) {
        // Create <url> element
        $url = $xml->createElement('url');

        // Create <loc> element and set the URL
        $loc = $xml->createElement('loc', get_category_link($category));
        $url->appendChild($loc);

        // Create <lastmod> element and set the last modified date (optional)
        // $lastmod = $xml->createElement('lastmod', '2023-05-01');
        // $url->appendChild($lastmod);

        // Create <changefreq> element and set the change frequency (optional)
        // $changefreq = $xml->createElement('changefreq', 'weekly');
        // $url->appendChild($changefreq);

        // Add <url> element to <urlset>
        $urlset->appendChild($url);
    }

    // Restore global post data
    wp_reset_postdata();

    // Output the XML
    header('Content-Type: text/xml; charset=utf-8');
    echo $xml->saveXML();
    exit;
}
