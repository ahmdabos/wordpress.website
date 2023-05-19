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

    public function create_post($topic,$index)
    {
        require_once(ABSPATH . 'wp-admin/includes/file.php');
        require_once(ABSPATH . 'wp-admin/includes/image.php');
        require_once(ABSPATH . 'wp-admin/includes/media.php');

        $generated_data = $this->generate_content->generate_content($topic,$index);
        if ($generated_data['status'] == 'success') {
            if ($generated_data['content']) {
                $content_data = $generated_data["content"];
                $category_ids = array();
                if (isset($content_data['post_categories'])) {
                    foreach ($content_data['post_categories'] as $category_name) {
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
                    if (isset($content_data['post_title'])) {
                        $post_data['post_title'] = $content_data['post_title'];
                    }
                    if (isset($content_data['post_content'])) {
                        $post_data['post_content'] = $content_data['post_content'];
                    }
                    if (isset($content_data['post_excerpt'])) {
                        $post_data['post_excerpt'] = $content_data['post_excerpt'];
                    }
                    if (!empty($category_ids)) {
                        $post_data['post_category'] = $category_ids;
                    }

                    $post_id = wp_insert_post($post_data);
                    if (isset($content_data['post_tags'])) {
                        wp_set_post_tags($post_id, $content_data['post_tags']);
                    }

                    if (!empty($content_data['post_image'])) {

                        $tmp = download_url($content_data['post_image']);

                        if (is_wp_error($tmp)) {
                            return array(
                                'status' => 'error',
                                'message' => 'Error downloading image: ' . $tmp->get_error_message()
                            );
                        } else {
                            $file_array = array(
                                'name' => basename($content_data['post_image']) . '.jpg',
                                'tmp_name' => $tmp,
                            );

                            $attachment_id = media_handle_sideload($file_array, $post_id);

                            if (is_wp_error($attachment_id)) {
                                return array(
                                    'status' => 'error',
                                    'message' => 'Error setting featured image: ' . $attachment_id->get_error_message()
                                );;
                            } else {
                                set_post_thumbnail($post_id, $attachment_id);
                            }
                        }
                    }

                    if ($post_id) {
                        return array(
                            'status' => 'success',
                            'message' => 'Post created successfully'
                        );
                    } else {
                        return array(
                            'status' => 'error',
                            'message' => 'Error creating the post'
                        );
                    }
                }
            }else {
                return array(
                    'status' => 'error',
                    'message' => 'ChatGPT content empty'
                );
            }
        } else {
            return array(
                'status' => 'error',
                'message' => $generated_data['message']
            );
        }

    }
}
