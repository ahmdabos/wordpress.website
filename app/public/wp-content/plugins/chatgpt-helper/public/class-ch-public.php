<?php
if (!defined('ABSPATH')) {
    exit;
}

class CH_Public
{
    public function __construct()
    {
        add_action('wp_ajax_ccg_create_post', [$this, 'ajax_create_post']);
        add_action('wp_ajax_nopriv_ccg_create_post', [$this, 'ajax_create_post']);
    }
    public function ajax_create_post()
    {
        if (isset($_POST['topic'])) {
            $topic = wp_kses_post($_POST['topic']);
            $chatgpt = new CH_ChatGPT();
            $generate_content = new CH_Generate_Content($chatgpt);
            $generated_content = $generate_content->generate_content($topic);
                if ($generated_content['status'] === 'success') {
                    wp_send_json_success(array(
                        'content' => $generated_content['content'],
                        'message' => $generated_content['message']
                    ));
                } else {
                    wp_send_json_error($generated_content['message']);
                }
        }
        else {
            wp_send_json_error('Topic not provided');
        }
    }
}
