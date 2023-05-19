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
        $url = "https://pixabay.com/api/?key=" . $api_key . "&q=" . urlencode($query) . "&&image_type=photo&orientation=horizontal&pretty=true&safesearch=true";


        $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name", ARRAY_A);
        $response = wp_remote_get($url);

        if (is_wp_error($response)) {
            return array('status' => 'error', 'message' => $response->get_error_message());
        }

        $response_body = wp_remote_retrieve_body($response);
        $json_array = json_decode($response_body, true);

        if (isset($json_array['hits']) && isset($json_array['hits'][0])) {
            $image_url = $json_array['hits'][0]['webformatURL'];
            $image_id = $json_array['hits'][0]['id'];

            $image_exists = false;
            foreach ($fetched_image_ids as $fetched_image) {
                if ($fetched_image['image_id'] == $image_id && $fetched_image['source'] == 'pixabay') {
                    $image_exists = true;
                    break;
                }
            }

            if ($image_exists) {
                return array('status' => 'error', 'message' => 'null');
            } else {
                $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'pixabay'));

            }
        } else {
            return array('status' => 'error', 'message' => 'null');
        }


        return array('status' => 'success', 'message' => $image_url);

    }

    public function fetch_unsplash_image($api_key, $query)
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';
        $url = "https://api.unsplash.com/search/photos?query=" . urlencode($query) . "&client_id=" . $api_key . "&orientation=landscape&content_filter=high";


        $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name", ARRAY_A);
        $response = wp_remote_get($url);

        if (is_wp_error($response)) {
            return array('status' => 'error', 'message' => $response->get_error_message());
        }

        $response_body = wp_remote_retrieve_body($response);
        $json_array = json_decode($response_body, true);

        if (isset($json_array['results']) && !empty($json_array['results'])) {
            $random_index = array_rand($json_array['results']);
            $image_url = $json_array['results'][$random_index]['urls']['regular'];
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
                return array('status' => 'error', 'message' => 'null');

            } else {
                $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'unsplash'));

            }
        } else {
            return array('status' => 'error', 'message' => 'null');
        }


        return array('status' => 'success', 'message' => $image_url);
    }

    public function fetch_shutterstock_image($client_id, $client_secret, $query)
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'ccg_fetched_images';

        $fetched_image_ids = $wpdb->get_results("SELECT image_id, source FROM $table_name", ARRAY_A);

        $url = "https://api.shutterstock.com/v2/images/search?query=" . urlencode($query);

        $client = new GuzzleHttp\Client();
        $response = $client->request('GET', $url, [
            'headers' => [
                'Authorization' => 'Basic ' . base64_encode($client_id . ':' . $client_secret)
            ]
        ]);

        if ($response->getStatusCode() !== 200) {
            return array('status' => 'error', 'message' => 'Failed to fetch image from Shutterstock');
        }

        $body = $response->getBody();
        $json_array = json_decode($body, true);

        if (isset($json_array['data']) && isset($json_array['data'][0])) {
            $image_url = $json_array['data'][0]['assets']['preview']['url'];
            $image_id = $json_array['data'][0]['id'];

            $image_exists = false;
            foreach ($fetched_image_ids as $fetched_image) {
                if ($fetched_image['image_id'] == $image_id && $fetched_image['source'] == 'shutterstock') {
                    $image_exists = true;
                    break;
                }
            }

            if ($image_exists) {
                return array('status' => 'error', 'message' => 'null');
            } else {
                $wpdb->insert($table_name, array('url' => $image_url, 'image_id' => $image_id, 'source' => 'shutterstock'));
            }
        } else {
            return array('status' => 'error', 'message' => 'null');
        }

        return array('status' => 'success', 'message' => $image_url);
    }

    public function fetch_image($shutterstock_client_id, $shutterstock_client_secret, $unsplash_api_key, $pixabay_api_key, $query)
    {
        $response = $this->fetch_pixabay_image($pixabay_api_key, $query);
        //$response = $this->fetch_shutterstock_image($shutterstock_client_id, $shutterstock_client_secret, $query);
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