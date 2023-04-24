<?php
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
