<?php
if (!defined('ABSPATH')) {
    exit;
}

class CH_Generate_Content
{
    private $chatgpt;

    public function __construct($chatgpt)
    {
        $this->chatgpt = $chatgpt;
    }

    public function generate_content($topic)
    {

        $chatgpt_api_key = get_option('ch_chatgpt_api_key');
        $chatgpt_temperature = floatval(get_option('ch_chatgpt_temperature', '0.7'));
        $chatgpt_max_tokens = intval(get_option('ch_chatgpt_max_tokens', '100'));

        $chatgpt_response = $this->chatgpt->generate_content_form_chatgpt($topic, $chatgpt_api_key, $chatgpt_temperature, $chatgpt_max_tokens);

        if ($chatgpt_response["status"] == 'success') {
            return array('status' => 'success', 'message' => 'Content Generated Successfully', 'content' => $chatgpt_response["content"]);
        } else {
            return array('status' => 'error', 'message' => $chatgpt_response["message"]);
        }

    }
}