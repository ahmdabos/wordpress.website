<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Create_Post
{
    private $generate_content;

    public function __construct($generate_content)
    {
        $this->generate_content = $generate_content;
    }


    public function create_post($topics)
    {
        require_once(ABSPATH . 'wp-admin/includes/file.php');
        require_once(ABSPATH . 'wp-admin/includes/image.php');
        require_once(ABSPATH . 'wp-admin/includes/media.php');
        $topics = explode("\n", $topics);
        $results = array();
        foreach ($topics as $index => $topic) {
            $generated_data = $this->generate_content->generate_content($topic);
            if ($generated_data['status'] == 'success') {
                $generated_data = $generated_data["content"];

                $category_ids = array();
                if (isset($generated_data['post_categories'])) {
                    foreach ($generated_data['post_categories'] as $category_name) {
                        $category = get_term_by('name', $category_name, 'category');
                        if (!$category) {
                            $new_category = wp_insert_term($category_name, 'category');
                            $category_ids[] = $new_category['term_id'];
                        } else {
                            $category_ids[] = $category->term_id;
                        }
                    }
                    $post_date = date_i18n('Y-m-d H:i:s', strtotime('+' . $index + 1 . ' day'));
                    $post_data = array(
                        'post_status' => 'future',
                        'post_date' => $post_date,
                    );
                    if (isset($generated_data['post_title'])) {
                        $post_data['post_title'] = $generated_data['post_title'];
                    }
                    if (isset($generated_data['post_content'])) {
                        $post_data['post_content'] = $generated_data['post_content'];
                    }
                    if (isset($generated_data['post_excerpt'])) {
                        $post_data['post_excerpt'] = $generated_data['post_excerpt'];
                    }
                    if (!empty($category_ids)) {
                        $post_data['post_category'] = $category_ids;
                    }

                    $post_id = wp_insert_post($post_data);
                    if (isset($generated_data['post_tags'])) {
                        wp_set_post_tags($post_id, $generated_data['post_tags']);
                    }

                    if (!empty($generated_data['post_image'])) {
                        $tmp = download_url($generated_data['post_image']);

                        if (is_wp_error($tmp)) {
                            $results[] = array(
                                'status' => 'error',
                                'message' => 'Error downloading image: ' . $tmp->get_error_message()
                            );
                            continue;
                        } else {
                            $file_array = array(
                                'name' => basename($generated_data['post_image']) . '.jpg',
                                'tmp_name' => $tmp,
                            );

                            $attachment_id = media_handle_sideload($file_array, $post_id);

                            if (is_wp_error($attachment_id)) {
                                $results[] = array(
                                    'status' => 'error',
                                    'message' => 'Error setting featured image: ' . $attachment_id->get_error_message()
                                );
                                continue;
                            } else {
                                set_post_thumbnail($post_id, $attachment_id);
                            }
                        }
                    }

                    if ($post_id) {
                        $results[] = array(
                            'status' => 'success',
                            'message' => 'Post created successfully',
                            'content' => $generated_data
                        );
                    } else {
                        $results[] = array(
                            'status' => 'error',
                            'message' => 'Error creating the post'
                        );
                    }
                }
            } else {
                $results[] = array(
                    'status' => 'error',
                    'message' => $generated_data['message']
                );
            }
        }
        return $results;


    }

}
