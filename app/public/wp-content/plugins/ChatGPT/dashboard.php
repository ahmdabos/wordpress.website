<?php
function chatgpt_content_writer_dashboard() {
    global $wpdb;

    // Include header
    chatgpt_render_header();

    $table_name = $wpdb->prefix . 'chatgpt_content_writer';
    $results = $wpdb->get_results("SELECT * FROM $table_name");
    $api_token = $results[0]->api_token;
    $temperature = intval($results[0]->temperature);
    $max_tokens = intval($results[0]->max_tokens);

    $post_content = '';

    if (isset($_POST['goTest'])) {
        $text = sanitize_text_field($_POST['chatGptText']);
        $post_content = chatgpt_fetch_generated_text($api_token, $text, $temperature, $max_tokens);
    }

    if (isset($_POST['addBlog'])) {
        chatgpt_insert_new_post();
    }

    chatgpt_dashboard_form($post_content);
}

function chatgpt_fetch_generated_text($api_token, $text, $temperature, $max_tokens) {
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
    //var_dump($response);
    $httpcode = curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
    if (200 == $httpcode) {
        $json_array = json_decode($response, true);
        $choices = $json_array['choices'];
        return $choices[0]['text'];
    }
    return '';
}

function chatgpt_insert_new_post() {
    $title = sanitize_text_field($_POST['postTitle']);
    $content = sanitize_textarea_field($_POST['postContent']);
    $keywords = sanitize_text_field($_POST['postKeywords']);
    $category = intval($_POST['postCategory']);

    $my_post = array(
        'post_title' => $title,
        'post_content' => $content,
        'tags_input' => $keywords,
        'post_status' => 'publish',
        'post_author' => 1,
        'post_category' => array($category),
    );

    wp_insert_post($my_post);
}

function chatgpt_dashboard_form($post_content) {
?>
<form method="post">
    <br>
    <div class="mb-3">
        <label class="form-label">Text to be asked to Chat GPT</label>
        <textarea class="form-control" id="chatGptText" name="chatGptText" rows="3"></textarea>
    </div>
    <button type="submit" name="goTest" class="btn btn-secondary">Display result</button><br><br>
    <div class="mb-3">
        <label class="form-label">Title</label>
        <input type="text" name="postTitle" id="postTitle" class="form-control"/>
    </div>

    <div class="mb-3">
        <label class="form-label">Content</label>
        <textarea style="height:250px;" class="form-control" name="postContent" id="postContent"
                  rows="3"><?php echo $post_content; ?></textarea>
    </div>

    <div class="mb-3">
        <label class="form-label">Category</label>
        <select name="postCategory" id="postCategory" class="form-select">
            <?php
            $categories = get_categories(array(
                'hide_empty' => 0
            ));

            foreach ($categories as $category) {
                printf(
                    '<option value="%d">%s</option>',
                    esc_attr($category->term_id),
                    esc_html($category->name)
                );
            }
            ?>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Keywords</label>
        <textarea class="form-control" name="postKeywords" id="postKeywords" rows="3"></textarea>
    </div>

    <button type="submit" name="addBlog" class="btn btn-success">Create Blog Post</button>
</form>
    <?php
}
