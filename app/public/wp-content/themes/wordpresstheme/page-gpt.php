<?php
/**
 * Template Name: GPT
 */
get_header();
?>
<?php
if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <div class="static-page ">
            <section class="programs-sec sub-page contact-sec knowledge-hub-sec community-sec we-serve-sec dc-focus dc-strategy" data-aos="fade-up" data-aos-duration="900" data-aos-delay="800">
                <div class="page-head">
                    <div class="container">
                        <div class="breadcrumbs-wrap">
                            <?php \Functions\Start::breadcrumbs(); ?>
                        </div>
                        <h2 class="main-title"><?php the_title() ?></h2>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">
                    <?php
                    $api_key = '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';
                   $url = 'https://api.openai.com/v1/chat/completions';
$headers = array(
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $api_key
);
$body = array(
    'model' => 'davinci',
    'prompt' => 'Hello, how are you?',
    'temperature' => 0.7,
    'max_tokens' => 50
);

$response = wp_remote_post($url, array(
    'headers' => $headers,
    'body' => json_encode($body)
));

if (is_wp_error($response)) {
    echo 'An error occurred. Please try again.';
} else {
    $response_data = json_decode(wp_remote_retrieve_body($response), true);
    var_dump($response_data);
    if (isset($response_data['choices'][0]['text'])) {
        $answer = $response_data['choices'][0]['text'];

        echo trim($answer);
    } else {
        echo 'Error: Unable to generate text completion.';
    }
}
?>

                    </div>
                </div>
            </section>
        </div>
    <?php endwhile; ?>
<?php endif; ?>
<?php
get_footer();
?>




