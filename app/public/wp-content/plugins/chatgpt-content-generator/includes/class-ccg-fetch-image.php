<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Fetch_Image
{
    public function fetch_pixabay_image($api_key, $query)
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';
        $url = "https://pixabay.com/api/?key=" . $api_key . "&q=" . urlencode($query) . "&&image_type=photo&orientation=horizontal&per_page=5&page=1&pretty=true&safesearch=true";

        $attempts = 0;
        while ($attempts < 10) {
            $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name", ARRAY_A);
            $response = wp_remote_get($url);

            if (is_wp_error($response)) {
                add_action('admin_notices', function ($response) {
                    echo '<div class="notice notice-error is-dismissible"><p>Pixabay API error: ' . $response->get_error_message() . '</p></div>';
                });
                return '';
            }

            $response_body = wp_remote_retrieve_body($response);
            $json_array = json_decode($response_body, true);
            if (isset($json_array['hits']) && isset($json_array['hits'][0])) {
                $image_url = $json_array['hits'][0]['largeImageURL'];
                $image_id = $json_array['hits'][0]['id'];

                $image_exists = false;
                foreach ($fetched_image_ids as $fetched_image) {
                    if ($fetched_image['image_id'] == $image_id && $fetched_image['source'] == 'pixabay') {
                        $image_exists = true;
                        break;
                    }
                }

                if ($image_exists) {
                    $image_url = '';
                    $attempts++;
                } else {
                    $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'pixabay'));
                    break;
                }
            } else {
                return '';
            }
        }

        return $image_url;

    }

    public function fetch_unsplash_image($api_key, $query)
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';
        $url = "https://api.unsplash.com/search/photos?query=" . urlencode($query) . "&client_id=" . $api_key . "&per_page=10&page=5&orientation=landscape&content_filter=high";

        $attempts = 0;
        while ($attempts < 10) {
            $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name", ARRAY_A);
            $response = wp_remote_get($url);

            if (is_wp_error($response)) {
                add_action('admin_notices', function ($response) {
                    echo '<div class="notice notice-error is-dismissible"><p>Unsplash API error: ' . $response->get_error_message() . '</p></div>';
                });
                return '';
            }

            $response_body = wp_remote_retrieve_body($response);
            $json_array = json_decode($response_body, true);

            if (isset($json_array['results']) && !empty($json_array['results'])) {
                $random_index = array_rand($json_array['results']);
                $image_url = $json_array['results'][$random_index]['urls']['full'];
                $image_id = $json_array['results'][$random_index]['id'];

                $image_url = strtok($image_url, '?');

                $image_exists = false;
                foreach ($fetched_image_ids as $fetched_image) {
                    if ($fetched_image['image_id'] == $image_id && $fetched_image['source'] == 'unsplash') {
                        $image_exists = true;
                        break;
                    }
                }

                if ($image_exists) {
                    $image_url = '';
                    $attempts++;
                } else {
                    $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'unsplash'));
                    break;
                }
            } else {
                return '';
            }
        }

        return $image_url;
    }

    public function fetch_image($unsplash_api_key, $pixabay_api_key, $query)
    {
        $image_url = $this->fetch_pixabay_image($pixabay_api_key, $query);
        if (empty($image_url)) {
            $image_url = $this->fetch_unsplash_image($unsplash_api_key, $query);
        }
        if ($image_url !== '') {
            return array('status' => 'success', 'image_url' => $image_url);
        } else {
            return array('status' => 'error', 'message' => 'Failed to fetch image');
        }
    }
}