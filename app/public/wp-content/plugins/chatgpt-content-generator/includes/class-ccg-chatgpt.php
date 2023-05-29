<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_ChatGPT
{
    public function generate_content_form_chatgpt($topic, $chatgpt_api_key, $chatgpt_temperature, $chatgpt_max_tokens)
    {
        $custom_prompt = '
Write a comprehensible, SEO-friendly article between 500 - 1000 words on ' . $topic . '. Your writing should be in simple English and should not reveal any signs of AI generation. Include necessary tips and strategies relevant to the topic. The audience for this article includes entrepreneurs, business owners, and professional expertise. Craft an engaging and representative title, a brief synopsis of the article, and choose up to three suitable tags and two categories. The final content should be formatted as follows:
[title]Article Title[/title]
[excerpt]Article Summary[/excerpt]
[tags]Article Tags, comma-separated[/tags]
[categories]Article Categories, comma-separated[/categories]
[details]Article Details, including HTML tags such as p, heading, ul, span[/details]
Ensure to incorporate keywords and phrases that are relevant to the topic and the audiences interests for better SEO.
The tone of the article should be professional yet accessible, to appeal to a wide audience including business owners and entrepreneurs.';

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
            'timeout' => 180,
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

