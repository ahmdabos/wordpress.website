<?php
/*
Plugin Name: TinyPNG Image Compressor and WebP Converter
Description: This is a custom plugin to compress all kind of images that will be uploaded to the website and convert it to WebP format.
Version: 1.0
Author: Ahmed Abbous
Author URI: https://yourwebsite.com/
*/

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

if (!class_exists('TinyPNG_Compressor_WebP_Converter')) {

    class TinyPNG_Compressor_WebP_Converter
    {
        // TinyPNG API Key
        private $api_key = 'yxBjr148PBrQXYdG58l1C7649r8f5xRx';

        public function __construct()
        {
            require_once ABSPATH . 'wp-content/plugins/compress-images/vendor/autoload.php';
            \Tinify\setKey($this->api_key);
            add_filter('wp_handle_upload', array($this, 'compress_and_convert_image'), 10, 2);
        }

        public function compress_and_convert_image($file)
        {
            if ($file['type'] == 'image/jpeg' || $file['type'] == 'image/png') {

                $filepath = $file['file'];
                $fileinfo = pathinfo($filepath);

                try {
                    $source = \Tinify\fromFile($filepath);
                    $converted = $source->convert(array("type" => ["image/webp", "image/png"]));
                    $extension = $converted->result()->extension();
                    $newFilePath = $fileinfo['dirname'] . '/' . $fileinfo['filename'] . '.' . $extension;
                    $converted->toFile($newFilePath);
                    if ($newFilePath !== $filepath) {
                        unlink($filepath);
                    }

                    $file['file'] = $newFilePath;
                    $file['url'] = str_replace(WP_CONTENT_DIR, WP_CONTENT_URL, $newFilePath);
                    $file['type'] = 'image/' . $extension;
                } catch (\Tinify\Exception $e) {
                    error_log('Error during compression or conversion to WebP: ' . $e->getMessage());
                }
            }

            return $file;
        }
    }

    new TinyPNG_Compressor_WebP_Converter();
}
