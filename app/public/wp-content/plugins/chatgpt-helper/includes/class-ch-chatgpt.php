<?php
if (!defined('ABSPATH')) {
    exit;
}

class CH_ChatGPT
{
    public function generate_content_form_chatgpt($topic, $chatgpt_api_key, $chatgpt_temperature, $chatgpt_max_tokens)
    {
        if (!$topic) {
            return array('status' => 'error', 'message' => 'Topic not provided');
        }
        $custom_prompt = 'Write between 20 words an informative and easy-to-understand, SEO-friendly article on ' . $topic . '. Include general tips and strategies related to the article if needed.Make sure the content is well-structured, and contains relevant keywords, Integrate general tips and strategies related to the article';

        $chatgpt_url = 'https://api.openai.com/v1/chat/completions';
        $model = 'gpt-3.5-turbo';
        $header = array(
            'Authorization' => 'Bearer ' . $chatgpt_api_key,
            'Content-type' => 'application/json; charset=utf-8',

        );
        $params = json_encode(
            array(
                'messages' => array(
                    array(
                        'role' => 'system',
                        'content' => $custom_prompt,
                    ),
                    array(
                        'role' => 'user',
                        'content' => 'Generate the article, please.',
                    ),
                ),
                'model' => $model,
                'temperature' => $chatgpt_temperature,
                'max_tokens' => $chatgpt_max_tokens,
            )
        );
        $args = array(
            'headers' => $header,
            'body' => $params,
            'timeout' => 100,
        );
        $response = wp_remote_post($chatgpt_url, $args);
        if (is_wp_error($response)) {
            return array('status' => 'error', 'message' => $response->get_error_message());
        }
        $httpcode = wp_remote_retrieve_response_code($response);
        if (200 == $httpcode) {
            $json_array = json_decode(wp_remote_retrieve_body($response), true);
            $choices = $json_array['choices'];
            return array('status' => 'success', 'content' => $choices[0]['message']['content']);
        }
        return array('status' => 'error', 'message' => 'Failed to fetch content from ChatGPT');
    }
}

