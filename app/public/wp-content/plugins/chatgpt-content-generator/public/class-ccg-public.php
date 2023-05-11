<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Public
{
    public function __construct()
    {
        add_action('wp_ajax_ccg_create_post', [$this, 'ajax_create_post']);
        add_action('wp_ajax_nopriv_ccg_create_post', [$this, 'ajax_create_post']);
    }
    public function ajax_create_post()
    {
        if (isset($_POST['topics'])) {
            $topics = wp_kses_post($_POST['topics']);
            $topics = explode("\n", $topics);

            $content = new CCG_ChatGPT();
            $image = new CCG_Fetch_Image();
            $full_content = new CCG_Generate_Content($content, $image);
            $create_post = new CCG_Create_Post($full_content);

            $responses = array();

            foreach ($topics as $topic) {
                $create_post_response = $create_post->create_post($topic);
                if ($create_post_response['status'] === 'success') {
                    $responses[] = array('success' => true, 'message' => $create_post_response['message']);
                } else {
                    $responses[] = array('error' => false, 'message' => $create_post_response['message']);
                }
            }

            wp_send_json($responses);

        }
        else {
            wp_send_json_error('Topics not provided');
        }
    }


}
