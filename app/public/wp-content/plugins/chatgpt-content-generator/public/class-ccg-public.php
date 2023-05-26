<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Public
{
    public function __construct()
    {
        add_action('rest_api_init', array($this, 'register_rest_route'));
    }


    public function register_rest_route()
    {
        register_rest_route('ccg/v1', '/create_post/', array(
            'methods' => 'POST',
            'callback' => array($this, 'handle_create_post'),
        ));
    }

    public function handle_create_post(WP_REST_Request $request)
    {
        if (!wp_verify_nonce($request->get_header('X_WP_Nonce'), 'wp_rest')) {
            return new WP_Error('invalid_nonce', 'Invalid security nonce.', array('status' => 403));
        }
        if (isset($request['topics'])) {
            $topics = wp_kses_post($request['topics']);
            $topics = explode("\n", $topics);

            $content = new CCG_ChatGPT();
            $image = new CCG_Fetch_Image();
            $full_content = new CCG_Generate_Content($content, $image);
            $create_post = new CCG_Create_Post($full_content);

            $responses = array();

            foreach ($topics as $index => $topic) {
                $create_post_response = $create_post->create_post($topic, $index);
                if ($create_post_response['status'] === 'success') {
                    $responses[] = array('success' => true, 'message' => $create_post_response['message']);
                } else {
                    $responses[] = array('error' => false, 'message' => $create_post_response['message']);
                }
            }

            return new WP_REST_Response($responses, 200);

        } else {
            return new WP_Error('no_topics', 'Topics not provided', array('status' => 400));
        }
    }


}
