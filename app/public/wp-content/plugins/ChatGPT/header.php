<?php
function chatgpt_enqueue_styles_scripts() {
    // Turn off error reporting
    error_reporting(0);

    // Include Bootstrap CSS
    wp_enqueue_style('bootstrap-css', 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css', array(), '5.2.2');

    // Include Font Awesome CSS
    wp_enqueue_style('font-awesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css', array(), '4.7.0');

    // Include jQuery
    wp_enqueue_script('jquery', 'https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js', array('jquery-core'), '3.6.0', true);

    // Include Chart.js
    wp_enqueue_script('chart-js', 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js', array(), '2.5.0', true);
}

add_action('admin_enqueue_scripts', 'chatgpt_enqueue_styles_scripts');

function chatgpt_render_header() {
    ?>
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="?page=chatgpt-content-writer-dashboard">ChatGPT Content Generator</a>
        </div>
    </nav>
    <?php
}
