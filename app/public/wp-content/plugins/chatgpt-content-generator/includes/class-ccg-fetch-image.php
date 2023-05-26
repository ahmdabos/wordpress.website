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
        $url = "https://pixabay.com/api/?key=" . $api_key . "&q=" . urlencode($query) . "&&image_type=photo&orientation=horizontal&pretty=true&safesearch=true&per_page=30"; // fetch 30 images at once

        $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name WHERE source = 'pixabay'", ARRAY_A);
        $fetched_image_ids = array_column($fetched_image_ids, 'image_id'); // get only the ids for easier comparison

        $response = wp_remote_get($url);

        if (is_wp_error($response)) {
            return array('status' => 'error', 'message' => $response->get_error_message());
        }

        $response_body = wp_remote_retrieve_body($response);
        $json_array = json_decode($response_body, true);

        if (isset($json_array['hits']) && !empty($json_array['hits'])) {
            $filtered_results = array_filter($json_array['hits'], function($hit) use ($fetched_image_ids) {
                // remove images that already exist in the database
                return !in_array($hit['id'], $fetched_image_ids);
            });

            if (empty($filtered_results)) {
                return array('status' => 'error', 'message' => 'All fetched images already exist in the database.');
            }

            // randomly select an image from the filtered results
            $random_index = array_rand($filtered_results);
            $selected_image = $filtered_results[$random_index];

            $image_url = $selected_image['webformatURL'];
            $image_id = $selected_image['id'];

            $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'pixabay'));

            return array('status' => 'success', 'message' => $image_url);
        } else {
            return array('status' => 'error', 'message' => 'Could not fetch image from Pixabay, returned null.');
        }
    }


    public function fetch_unsplash_image($api_key, $query)
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';
        $url = "https://api.unsplash.com/search/photos?query=" . urlencode($query) . "&client_id=" . $api_key . "&orientation=landscape&content_filter=high&per_page=30"; // fetch 30 images at once

        $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name WHERE source = 'unsplash'", ARRAY_A);
        $fetched_image_ids = array_column($fetched_image_ids, 'image_id'); // get only the ids for easier comparison

        $response = wp_remote_get($url);

        if (is_wp_error($response)) {
            return array('status' => 'error', 'message' => $response->get_error_message());
        }

        $response_body = wp_remote_retrieve_body($response);
        $json_array = json_decode($response_body, true);

        if (isset($json_array['results']) && !empty($json_array['results'])) {
            $filtered_results = array_filter($json_array['results'], function($result) use ($fetched_image_ids) {
                // remove images that already exist in the database
                return !in_array($result['id'], $fetched_image_ids);
            });

            if (empty($filtered_results)) {
                return array('status' => 'error', 'message' => 'All fetched images already exist in the database.');
            }

            // randomly select an image from the filtered results
            $random_index = array_rand($filtered_results);
            $selected_image = $filtered_results[$random_index];

            $image_url = $selected_image['urls']['regular'];
            $image_id = $selected_image['id'];

            $image_url = strtok($image_url, '?');

            $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'unsplash'));

            return array('status' => 'success', 'message' => $image_url);
        } else {
            return array('status' => 'error', 'message' => 'could not fetch image from unsplash, return null');
        }
    }



    public function fetch_image($unsplash_api_key, $pixabay_api_key, $query)
    {
        $response = $this->fetch_pixabay_image($pixabay_api_key, $query);
        if ($response['status'] == 'error') {
            $response = $this->fetch_unsplash_image($unsplash_api_key, $query);
        }
        if ($response['status'] == 'error') {
            return array('status' => 'error', 'message' => $response['message']);
        } else {
            return array('status' => 'success', 'message' => $response['message']);
        }
    }
}