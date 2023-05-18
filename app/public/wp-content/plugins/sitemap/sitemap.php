<?php

/**
 * Plugin Name: Sitemap
 * Description: This is a plugin to generate a sitemap.xml file.
 * Version: 1.0
 * Author: Ahmed Abbous
 * Author URI: https://innovatingweb.com
 */

register_activation_hook(__FILE__, 'my_sitemap_plugin_activate');
function my_sitemap_plugin_activate()
{
    my_sitemap_plugin_rewrite_rule();
    flush_rewrite_rules();
}
register_deactivation_hook(__FILE__, 'my_sitemap_plugin_deactivate');
function my_sitemap_plugin_deactivate()
{
    flush_rewrite_rules();
}
function my_sitemap_plugin_rewrite_rule()
{
    add_rewrite_rule('sitemap.xml$', 'index.php?my_sitemap_plugin=1', 'top');
}
add_filter('query_vars', 'my_sitemap_plugin_query_vars');
function my_sitemap_plugin_query_vars($vars)
{
    $vars[] = 'my_sitemap_plugin';
    return $vars;
}
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
function my_sitemap_plugin_generate_sitemap()
{
    $xml = new DOMDocument('1.0', 'UTF-8');
    $xml->formatOutput = true;
    $urlset = $xml->createElement('urlset');
    $urlset->setAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
    $xml->appendChild($urlset);

    $query_args = array(
        'post_type' => array('post', 'page', 'your_custom_post_type'),
        'post_status' => 'publish',
        'posts_per_page' => -1,
    );
    $query = new WP_Query($query_args);
    if ($query->have_posts()) {
        while ($query->have_posts()) {
            $query->the_post();
            $url = $xml->createElement('url');
            $loc = $xml->createElement('loc', htmlspecialchars(get_permalink()));
            $url->appendChild($loc);
            $lastmod = $xml->createElement('lastmod', get_the_modified_time('Y-m-d\TH:i:s\Z'));
            $url->appendChild($lastmod);
            $changefreq = $xml->createElement('changefreq', 'weekly');
            $url->appendChild($changefreq);
            $urlset->appendChild($url);
        }
    }
    $categories = get_categories();
    foreach ($categories as $category) {
        $url = $xml->createElement('url');

        $loc = $xml->createElement('loc', htmlspecialchars(get_category_link($category)));
        $url->appendChild($loc);

        $urlset->appendChild($url);
    }
    wp_reset_postdata();
    header('Content-Type: text/xml; charset=utf-8');
    echo $xml->saveXML();
    exit;
}
