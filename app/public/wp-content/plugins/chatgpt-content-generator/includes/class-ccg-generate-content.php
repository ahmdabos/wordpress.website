<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Generate_Content
{
    private $chatgpt;
    private $image;

    public function __construct($chatgpt, $image)
    {
        $this->chatgpt = $chatgpt;
        $this->image = $image;
    }

    public function generate_content($topic)
    {
        $shutterstock_client_id = get_option('ccg_shutterstock_client_id');
        $shutterstock_client_secret = get_option('ccg_shutterstock_client_secret');
        $unsplash_api_key = get_option('ccg_unsplash_api_key');
        $pixabay_api_key = get_option('ccg_pixabay_api_key');
        $chatgpt_api_key = get_option('ccg_chatgpt_api_key');
        $chatgpt_temperature = floatval(get_option('ccg_chatgpt_temperature', '0.7'));
        $chatgpt_max_tokens = intval(get_option('ccg_chatgpt_max_tokens', '100'));

        $generated_text = $this->chatgpt->generate_content_form_chatgpt($topic, $chatgpt_api_key, $chatgpt_temperature, $chatgpt_max_tokens);

        if ($generated_text["status"] == 'success') {
            preg_match('/\[title\](.*?)\[\/title\]/s', $generated_text["content"], $title_matches);
            preg_match('/\[details\](.*)/s', $generated_text["content"], $content_matches);
            preg_match('/\[excerpt\](.*?)\[\/excerpt\]/s', $generated_text["content"], $excerpt_matches);
            preg_match('/\[tags\](.*?)\[\/tags\]/s', $generated_text["content"], $tags_matches);
            preg_match('/\[categories\](.*?)\[\/categories\]/s', $generated_text["content"], $categories_matches);

            $generated_title = $title_matches[1] ?? '';
            $generated_content = $content_matches[1] ?? '';
            $generated_excerpt = $excerpt_matches[1] ?? '';
            $generated_tags = !empty($tags_matches[1]) ? explode(',', $tags_matches[1]) : array();
            $generated_categories = !empty($categories_matches[1]) ? explode(',', $categories_matches[1]) : array();

            $query_term = '';
            if (!empty($generated_categories)) {
                $query_term = $generated_categories[0];
            } elseif (!empty($generated_tags)) {
                $query_term = $generated_tags[0];
            } else {
                $query_term = $generated_title;
            }

            $image_result = $this->image->fetch_image($shutterstock_client_id,$shutterstock_client_secret,$unsplash_api_key, $pixabay_api_key, $query_term);

            if ($image_result['status'] === 'error') {
                return $image_result['message'];

            }

            $generated_image_url = $image_result['message'];

            $post_data = array(
                'post_title' => $generated_title,
                'post_content' => $generated_content,
                'post_excerpt' => $generated_excerpt,
                'post_tags' => $generated_tags,
                'post_categories' => $generated_categories,
                'post_image' => $generated_image_url,
            );

            return array('status' => 'success', 'content' => $post_data);
        } else {
            return array('status' => 'error', 'message' => $generated_text["message"]);
        }

    }
}