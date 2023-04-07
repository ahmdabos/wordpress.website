<?php

namespace Functions;

use DateTime;
use WP_Query;

class Start
{
    public static function breadcrumbs()
    {
        global $post;
        if (get_locale() == 'en') {
            $home = 'Home';
        } else {
            $home = 'الرئيسة';
        }
        echo '<ul class="breadcrumb-wrap">';
        echo '<li><a href="' . get_home_url() . '">' . $home . '</a></li>';
        if ($post->post_parent) {
            $anc = get_post_ancestors($post->ID);
            $anc = array_reverse($anc);
            if (!isset($parents)) $parents = null;
            foreach ($anc as $ancestor) {
                $parents .= '<li><a href="' . get_permalink($ancestor) . '">' . get_the_title($ancestor) . '</a></li>';
            }
            echo $parents;
            echo '<li>' . get_the_title() . ' </li>';
        } else {
            echo '<li>' . get_the_title() . ' </li>';
        }
        echo '</ul>';
    }

    public static function pagination($pages = '', $range = 2)
    {
        $showitems = ($range * 2) + 1;
        global $paged;
        if (empty($paged)) {
            $paged = 1;
        }
        if ($pages == '') {
            global $wp_query;
            $pages = $wp_query->max_num_pages;
            if (!$pages) {
                $pages = 1;
            }
        }
        if (1 != $pages) {
            if ($paged > 2 && $paged > $range + 1 && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . get_pagenum_link(1) . "'><i class=\"icon fi-long-arrow-left\"></i><span>Prev</span></a></li>";
            }
            if ($paged > 1 && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . get_pagenum_link($paged - 1) . "'><i class=\"icon fi-long-arrow-left\"></i><span></span></a></li>";
            }
            for ($i = 1; $i <= $pages; $i++) {
                if (1 != $pages && (!($i >= $paged + $range + 1 || $i <= $paged - $range - 1) || $pages <= $showitems)) {

                    echo ($paged == $i) ? "<li class=\"page-item active\"><a class=\"page-link\" href=''>" . $i . "</a></li>" :
                        "<li class=\"page-item\"><a class=\"page-link\" href='" . get_pagenum_link($i) . "' class='inactive' >" . $i . "</a></li>";
                }
            }
            if ($paged < $pages && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . get_pagenum_link($paged + 1) . "'><span></span> <i class=\"icon fi-long-arrow-right\"></i></a></li>";
            }
            if ($paged < $pages - 1 && $paged + $range - 1 < $pages && $showitems < $pages) {
                echo "<li class=\"page-item\"><a class=\"page-link\" href='" . get_pagenum_link($pages) . "'><span>Next</span> <i class=\"icon fi-long-arrow-right\"></i></a></li>";
            }

        }
    }

    public function register()
    {
        // enqueue scripts
        add_action('wp_enqueue_scripts', array($this, 'enqueueScripts'));
    }

    public function enqueueScripts()
    {
        wp_enqueue_style('site', get_template_directory_uri() . '/assets/css/site.css', array(), time(), 'all');
        wp_enqueue_script("jquery");
        wp_enqueue_script('jquery', get_template_directory_uri() . '/assets/js/jquery.min.js', array(''), time(), true);
        wp_enqueue_script('bootstrap', get_template_directory_uri() . '/assets/js/bootstrap.min.js', array('jquery'), time(), true);
        wp_enqueue_script('jquery-ui', get_template_directory_uri() . '/assets/js/jquery-ui.js', array('jquery'), time(), true);
        wp_enqueue_script('owl-carousel', get_template_directory_uri() . '/assets/js/owl.carousel.min.js', array('jquery'), time(), true);
        wp_enqueue_script('popper', get_template_directory_uri() . '/assets/js/popper.min.js', array('jquery'), time(), true);
        wp_enqueue_script('main', get_template_directory_uri() . '/assets/js/main.js', array('jquery'), time(), true);
    }

    public function timeToElapsed($datetime, $full = false)
    {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);
        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;
        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }

        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    }

    public function youtubeFeed(array $args)
    {
        if (empty($args['channelId']) || empty($args['key'])) {
            return '';
        }
        $channelId = $args['channelId'];
        $key = $args['key'];
        $limit = $args['limit'];
        $feeds = array();

        $youtubeAPI = file_get_contents('https://www.googleapis.com/youtube/v3/search?channelId=' . $channelId . '&key=' . $key . '&part=snippet&order=date&maxResults=' . $limit);
        $youtubeVideos = json_decode($youtubeAPI)->items;

        foreach ($youtubeVideos as $youtubeVideo) {
            $feeds[] = array(
                "videoId" => $youtubeVideo->id->videoId,
                "thumbnail_url" => $youtubeVideo->snippet->thumbnails->high->url,
                "video_title" => $youtubeVideo->snippet->title,
                "video_description" => $youtubeVideo->snippet->description,
                "published_time" => $youtubeVideo->snippet->publishTime
            );

        }
        return $feeds;
    }

    public function instagramFeed(array $args)
    {
        if (empty($args['instagramFields']) || empty($args['instagramToken'])) {
            return '';
        }
        $instagramFields = $args['instagramFields'];
        $instagramToken = $args['instagramToken'];
        $instagramLimit = $args['instagramLimit'];
        $feeds = array();
        $instagramJsonFeedURL = "https://graph.instagram.com/me/media?fields={$instagramFields}&access_token={$instagramToken}&limit={$instagramLimit}";
        $instagramJsonFeed = @file_get_contents($instagramJsonFeedURL);
        $instagramContents = json_decode($instagramJsonFeed, true, 512, JSON_BIGINT_AS_STRING);

        foreach ($instagramContents["data"] as $post) {
            $feeds[] = array(
                "username" => isset($post["username"]) ? $post["username"] : "",
                "caption" => isset($post["caption"]) ? $post["caption"] : "",
                "media_url" => isset($post["media_url"]) ? $post["media_url"] : "",
                "permalink" => isset($post["permalink"]) ? $post["permalink"] : "",
                "media_type" => isset($post["media_type"]) ? $post["media_type"] : "",
                "thumbnail_url"=>isset($post["thumbnail_url"]) ? $post["thumbnail_url"] : "",
            );
        }
        return $feeds;

    }

    public function twitterFeed(array $args)
    {
        if (empty($args['screen_name']) || empty($args['oauth_access_token']) || empty($args['oauth_access_token_secret']) || empty($args['consumer_key']) || empty($args['consumer_secret'])) {
            return '';
        }
        $screen_name = $args['screen_name'];
        $limit = $args['limit'];
        $oauth_access_token = $args['oauth_access_token'];
        $oauth_access_token_secret = $args['oauth_access_token_secret'];
        $consumer_key = $args['consumer_key'];
        $consumer_secret = $args['consumer_secret'];
        $feeds = array();
        $url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
        $twitterRequestMethod = 'GET';
        $twitter = new TwitterAPIExchange(array(
            'oauth_access_token' => $oauth_access_token,
            'oauth_access_token_secret' => $oauth_access_token_secret,
            'consumer_key' => $consumer_key,
            'consumer_secret' => $consumer_secret
        ));
        $response = $twitter->setGetfield('?screen_name=' . $screen_name . '&count=' . $limit)
            ->buildOauth($url, $twitterRequestMethod)
            ->performRequest();


        $valid_data = json_decode($response);

        foreach ($valid_data as $key => $value) {
            $feeds[] = array(
                "name" => $value->user->name,
                "screenName" => $value->user->screen_name,
                "createdDate" => $this->timeToElapsed($value->created_at),
                "tweet" => $value->text
            );
        }
        return $feeds;

    }


    public static function getPageChildren($page_id, $post_type = 'page')
    {
        $custom_wp_query = new WP_Query();
        $all_wp_pages = $custom_wp_query->query(array('post_type' => $post_type, 'posts_per_page' => -1));
        $page_children = get_page_children($page_id, $all_wp_pages);
        return $page_children;
    }


}














