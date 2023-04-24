<?php
/**
 * Plugin Name: ChatGPT
 * Description: ChatGPT Content Generator
 * Version: 1.0
 * Author: Future Internet
 * Author URI: https://future-internet.com
 */

defined('ABSPATH') || exit;

function chatgpt_content_writer_init(){
    add_action('admin_menu', 'chatgpt_content_writer_register_menu_pages');
    add_action('plugins_loaded', 'chatgpt_content_writer_create_database_table');
    add_action('admin_enqueue_scripts', 'chatgpt_enqueue_styles_scripts');
    add_action('add_meta_boxes', 'chatgpt_add_meta_box');
    add_action('wp_ajax_chatgpt_generate_content', 'chatgpt_ajax_generate_content');
}

function chatgpt_enqueue_styles_scripts($hook){
    if ('post.php' !== $hook && 'post-new.php' !== $hook) {
        return;
    }
    wp_register_script('chatgpt-custom-js', plugins_url('js/chatgpt-custom.js', __FILE__), array('jquery'), '1.0', true);
    wp_localize_script('chatgpt-custom-js', 'chatgpt_ajax_object', array('ajax_url' => admin_url('admin-ajax.php')));
    wp_enqueue_script('chatgpt-custom-js');
}

function chatgpt_add_meta_box(){
    add_meta_box('chatgpt-meta-box', 'ChatGPT Content Generator', 'chatgpt_meta_box_callback', 'post');
}

function chatgpt_meta_box_callback(){
    ?>
    <div class="mb-3">
        <label class="form-label">Text to be asked to Chat GPT</label>
        <textarea class="form-control" id="chatGptText" name="chatGptText" rows="3"></textarea>
    </div>
    <button type="button" id="generateContent" class="btn btn-secondary">Generate Content</button>
    <br><br>
    <?php
}

function chatgpt_ajax_generate_content()
{
    if (!isset($_POST['text'])) {
        wp_send_json_error('Text not provided');
    }

    $text = sanitize_text_field($_POST['text']);

    // Fetch plugin settings
    global $wpdb;
    $table_name = $wpdb->prefix . 'chatgpt_content_writer';
    $results = $wpdb->get_results("SELECT * FROM $table_name");
    $api_token = $results[0]->api_token;
    $temperature = intval($results[0]->temperature);
    $max_tokens = intval($results[0]->max_tokens);

    $generated_text = chatgpt_fetch_generated_text($api_token, $text, $temperature, $max_tokens);
    if (!empty($generated_text)) {
        wp_send_json_success($generated_text);
    } else {
        wp_send_json_error('Failed to generate content');
    }
}

function chatgpt_fetch_generated_text($api_token, $text, $temperature, $max_tokens){
    $header = array(
        'Authorization: Bearer ' . $api_token,
        'Content-type: application/json; charset=utf-8',
    );
    $params = json_encode(
        array(
            'prompt' => $text,
            'model' => 'text-davinci-003',
            'temperature' => $temperature,
            'max_tokens' => $max_tokens,
        )
    );
    $curl = curl_init('https://api.openai.com/v1/completions');
    $options = array(
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => $header,
        CURLOPT_POSTFIELDS => $params,
        CURLOPT_RETURNTRANSFER => true,
    );
    curl_setopt_array($curl, $options);
    $response = curl_exec($curl);
    $httpcode = curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
    if (200 == $httpcode) {
        $json_array = json_decode($response, true);
        $choices = $json_array['choices'];
        return $choices[0]['text'];
    }
    return '';
}

function chatgpt_content_writer_register_menu_pages(){
    add_menu_page(
        'Chat GPT',
        'Chat GPT',
        'manage_options',
        'chatgpt-content-writer-settings',
        'chatgpt_content_writer_render_settings',
        'dashicons-admin-users',
        999
    );
}

function chatgpt_content_writer_settings()
{
    global $wpdb;

    $table_name = $wpdb->prefix . 'chatgpt_content_writer';

    // Fetch settings from database
    $results = $wpdb->get_results("SELECT * FROM $table_name");
    $getApiToken = $results[0]->api_token ?? '';
    $getTemperature = $results[0]->temperature ?? '';
    $getMaxTokens = $results[0]->max_tokens ?? '';
    $getLanguage = $results[0]->language ?? 'en';

    // Update settings if form is submitted
    if (isset($_POST['submit'])) {
        $temperatureValue = sanitize_text_field($_POST['temperatureValue']);
        $apiToken = sanitize_text_field($_POST['apiToken']);
        $maxTokens = sanitize_text_field($_POST['maxTokens']);


        if ($results) { // Update settings
            $id = $results[0]->id;
            $wpdb->update(
                $table_name,
                array(
                    'api_token' => $apiToken,
                    'temperature' => $temperatureValue,
                    'max_tokens' => $maxTokens,
                ),
                array(
                    'id' => $id,
                )
            );
            echo "<script>location.reload();</script>";
        } else { // Insert new settings
            $wpdb->insert(
                $table_name,
                array(
                    'api_token' => $apiToken,
                    'temperature' => $temperatureValue,
                    'max_tokens' => $maxTokens,
                ),
                array('%s', '%s', '%s', '%s')
            );
            echo "<script>location.reload();</script>";
        }
    }

    chatgpt_settings_form($getApiToken, $getTemperature, $getMaxTokens);
}

function chatgpt_settings_form($apiToken, $temperature, $maxTokens)
{
    ?>
    <form method="post">
        <br>
        <div class="mb-3">
            <label class="form-label">ChatGPT API:</label>
            <input type="text" id="apiToken" name="apiToken" class="form-control"
                   value="<?php echo esc_attr($apiToken); ?>"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Temperature<b
                    id="temperatureTextValue"><?php echo esc_html($temperature); ?></b></label><br>

            <input onchange="updateTemperature();" type="range" class="form-range" min="0" max="1" step="0.1"
                   id="temperatureValue" name="temperatureValue" value="<?php echo esc_attr($temperature); ?>">
        </div>
        <div class="mb-3">
            <label class="form-label">Max Tokens</label>
            <input type="number" id="maxTokens" name="maxTokens" class="form-control"
                   value="<?php echo esc_attr($maxTokens); ?>"/>
        </div>
        <button type="submit" name="submit" class="btn btn-primary">Save Settings</button>
    </form>
    <?php
}

function chatgpt_content_writer_render_settings(){
    chatgpt_content_writer_settings();
}

function chatgpt_content_writer_create_database_table(){
    global $wpdb;

    $table_name = $wpdb->prefix . 'chatgpt_content_writer';

    $sql = "CREATE TABLE $table_name (
		id int(11) NOT NULL AUTO_INCREMENT,
		api_token tinytext NOT NULL,
		temperature tinytext NOT NULL,
		max_tokens tinytext NOT NULL,
		PRIMARY KEY  (id)
	) ENGINE=InnoDB $wpdb->charset COLLATE=$wpdb->collate;";

    require_once ABSPATH . 'wp-admin/includes/upgrade.php';
    dbDelta($sql);
}

add_action('plugins_loaded', 'chatgpt_content_writer_init');
