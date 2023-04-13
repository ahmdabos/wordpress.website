<?php
$requires = ['Base', 'Start', 'CustomPostType', 'CustomTaxonomy'];
foreach ($requires as $require) {
    require get_template_directory() . '/inc/' . $require . '.php';
}

use Functions\{Base, Start, CustomPostType, CustomTaxonomy};

$customPostTypesList = array(
    array(
        'singular_name' => 'slider',
        'plural_name' => 'sliders',
        'slug' => 'events',
        'publicly_queryable'=>false,
        'menu_position' => 19,
        'supports' => ['title', 'thumbnail', 'revisions', 'page-attributes', 'editor'],
        'taxonomies' => []
    ),
    array(
        'singular_name' => 'news',
        'plural_name' => 'news',
        'slug' => 'news',
        'publicly_queryable'=>true,
        'menu_position' => 19,
        'supports' => ['title', 'thumbnail', 'revisions', 'page-attributes', 'excerpt', 'editor'],
        'taxonomies' => []
    )
);
$customTaxonomyList = array();

$base = new Base();
$start = new Start();
$customPostType = new CustomPostType();
$customTaxonomy = new CustomTaxonomy();
$base->register();
$start->register();
$customPostType->createCustomPostType($customPostTypesList);
$customTaxonomy->createCustomTaxonomy($customTaxonomyList);