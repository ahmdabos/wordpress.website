<?php
if (!defined('ABSPATH')) {
    exit;
}

$customTaxonomy = new Base_Custom_Taxonomy();
$customTaxonomyList = [
    /*[
        'singular_name' => 'News Category',
        'plural_name' => 'News Categories',
        'post_type' => 'news',
        'slug' => "news_category"],*/
];
$customTaxonomy->createCustomTaxonomy($customTaxonomyList);

class Base_Custom_Taxonomy
{
    public $args = array();
    public $customTaxonomies = array();
    public $ct = array();

    public function createCustomTaxonomy(array $customTaxonomies)
    {
        $this->customTaxonomies = $customTaxonomies;
        add_action('init', array($this, 'setCustomTaxonomy'), 0);
    }

    public function setCustomTaxonomy()
    {
        foreach ($this->customTaxonomies as $ct) {
            $this->ct = $ct;
            $this->args = array(
                'hierarchical' => true,
                'labels' => array(
                    'name' => ucfirst($this->ct['plural_name']),
                    'singular_name' => ucfirst($this->ct['singular_name']),
                    'search_items' => 'Search ' . ucfirst($this->ct['plural_name']),
                    'all_items' => 'All ' . ucfirst($this->ct['plural_name']),
                    'parent_item' => 'Parent ' . ucfirst($this->ct['singular_name']),
                    'parent_item_colon' => 'Parent ' . ucfirst($this->ct['singular_name']) . ':',
                    'edit_item' => 'Edit ' . ucfirst($this->ct['singular_name']),
                    'update_item' => 'Update ' . ucfirst($this->ct['singular_name']),
                    'add_new_item' => 'Add New ' . ucfirst($this->ct['singular_name']),
                    'new_item_name' => 'New ' . ucfirst($this->ct['singular_name']) . ' Name',
                    'menu_name' => ucfirst($this->ct['singular_name']),
                ),
                'show_ui' => true,
                'show_in_rest' => true,
                'query_var' => true,
                'show_admin_column' => true,
                'rewrite' => ['slug' => ucfirst($this->ct['slug'])],
            );
            register_taxonomy($this->ct['slug'], [$this->ct['post_type']], $this->args);
        };
    }
}

