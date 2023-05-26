<?php

class Base_Custom_Post_type
{
    public $args = array();
    public $customPostTypes = array();
    public $cpt = array();

    public function create_custom_post_type(array $customPostType)
    {
        $this->customPostTypes = $customPostType;
        add_action('init', array($this, 'set_custom_post_type'), 0);
    }

    public function set_custom_post_type()
    {
        foreach ($this->customPostTypes as $cpt) {
            $this->cpt = $cpt;
            $this->args = array(
                'label' => ucfirst($this->cpt['plural_name']),
                'labels' => array(
                    'name' => ucfirst($this->cpt['plural_name']),
                    'singular_name' => ucfirst($this->cpt['singular_name']),
                    'menu_name' => ucfirst($this->cpt['plural_name']),
                    'parent_item_colon' => 'Parent ' . ucfirst($this->cpt['singular_name']),
                    'all_items' => 'All ' . ucfirst($this->cpt['plural_name']),
                    'view_item' => 'View ' . ucfirst($this->cpt['singular_name']),
                    'add_new_item' => 'Add New ' . ucfirst($this->cpt['singular_name']),
                    'edit_item' => 'Edit ' . ucfirst($this->cpt['singular_name']),
                    'update_item' => 'Update ' . ucfirst($this->cpt['singular_name']),
                    'search_items' => 'Search ' . ucfirst($this->cpt['singular_name']),
                ),
                'supports' => $this->cpt['supports'],
                'taxonomies' => $this->cpt['taxonomies'],
                'hierarchical' => true,
                'public' => true,
                'show_ui' => true,
                'show_in_menu' => true,
                'menu_position' => $this->cpt['menu_position'],
                'show_in_admin_bar' => true,
                'show_in_nav_menus' => true,
                'can_export' => true,
                'has_archive' => false,
                'exclude_from_search' => false,
                'publicly_queryable' => $this->cpt['publicly_queryable'],
                'query_var' => true,

                'capability_type' => 'post',
                'show_in_rest' => true,
                'rewrite' => array(
                    'slug' => ($this->cpt['slug']) ? $cpt['slug'] : $this->cpt['singular_name'],
                    'with_front' => true,
                    'pages' => true,
                    'feeds' => true,
                ),


            );
            register_post_type($this->cpt['plural_name'], $this->args);

        }
    }
}

$customPostType = new Base_Custom_Post_type();
$customPostTypesList = [
    [
        'singular_name' => 'slider',
        'plural_name' => 'sliders',
        'slug' => 'events',
        'publicly_queryable' => false,
        'menu_position' => 19,
        'supports' => ['title', 'thumbnail', 'revisions', 'page-attributes', 'editor'],
        'taxonomies' => []
    ],
    [
        'singular_name' => 'news',
        'plural_name' => 'news',
        'slug' => 'news',
        'publicly_queryable' => true,
        'menu_position' => 19,
        'supports' => ['title', 'thumbnail', 'revisions', 'page-attributes', 'excerpt', 'editor'],
        'taxonomies' => []
    ]
];
$customPostType->create_custom_post_type($customPostTypesList);