<?php get_header(); ?>
<?php

if (isset($_POST['newsIdSet'])) {
    echo $_POST['newsIdSet'];
    if (!$_COOKIE["like_news_" . the_ID()] == "1") {
        $news_likes = (float)get_field('news_likes');
        update_post_meta(get_the_ID(), 'news_likes', 1 + $news_likes);
    }
}
if (isset($_POST['newsIdRemove'])) {
    echo $_POST['newsIdSet'];
    if (!$_COOKIE["like_news_" . the_ID()] == "1") {
        $news_likes = (float)get_field('news_likes');
        update_post_meta(get_the_ID(), 'news_likes', $news_likes - 1);
    }
}
?>

        <section class="news-sec">
            <div class="page-head">
                <div class="container">
                    <div class="breadcrumbs-wrap">
                        <ul class="breadcrumb-wrap">

                            <li><a href="<?php echo get_home_url() ?>"><?php _t('home'); ?></a></li>
                            <li><a href="<?php if (get_locale() == 'en') {
                                    echo get_permalink(312);
                                } else {
                                    echo get_permalink(383);
                                } ?>"><?php _t('news'); ?></a></li>
                            <li><?php the_title() ?></li>
                        </ul>
                    </div>
                    <h2 class="main-title"><?php _t('news') ?></h2>
                </div>
            </div>
            <div class="page-content">
                <div class="container">
                    <h3 class="title"><?php the_title() ?></h3>
                    <div class="news-details">
                        <div class="details-card">
                            <div class="news-img">
                                <img src="<?php the_post_thumbnail_url(); ?>" alt="<?php the_title() ?>" title="<?php the_title() ?>"/>
                            </div>
                            <div class="news-content">
                                <div class="top">
                                    <div class="date"><span><?php _t('published_on') ?>&nbsp;<?php echo get_the_date() ?></span></div>
                                    <p><?php the_content(); ?></p>
                                </div>
                                <div class="bottom">
                                    <div class="card-action">
                                        <ul>
                                            <li>
                                                <a href="javascript:void(0)" title="<?php _t('like') ?>" class="like likeNews" data-newsid="<?php echo get_the_ID() ?>"
                                                   data-likesid="<?php echo get_field('news_likes'); ?>">
                                                    <i class="fi-like"></i>
                                                    <span><?php echo get_field('news_likes') ?> &nbsp;<?php _t('like') ?></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                                                        <a class="a2a_dd action sub secondary right" href="https://www.addtoany.com/share" title="<?php _t('share') ?>"><i
                                                                    class="fi-share"></i><span><?php _t('share') ?></span> </a>
                                                    </div>
                                                    <script async src="https://static.addtoany.com/menu/page.js"></script>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <script>
        jQuery(document).ready(function ($) {
            var newsId = $('.likeNews').data('newsid');
            var likeNewsCookie = getCookie("like_news_" + newsId);
            if (likeNewsCookie == "1") {
                $('.likeNews').find('i').removeClass();
                $('.likeNews').find('i').addClass('fi-fill-like')
            }
            if (likeNewsCookie == "0" || !likeNewsCookie) {
                $('.likeNews').find('i').removeClass();
                $('.likeNews').find('i').addClass('fi-like')
            }
            $('.likeNews').on('click', function () {
                var newsId = $(this).data('newsid');
                if ($(this).find('i').hasClass('fi-like')) {
                    console.log('newsId' + newsId);
                    setCookie("like_news_" + newsId, "1", 1000);
                    $(this).find('i').removeClass('fi-like');
                    $(this).find('i').addClass('fi-fill-like')

                    $.ajaxSetup({
                        beforeSend: function (xhr, options) {
                            options.url = window.location.href;
                        }
                    });
                    var ajaxurl = window.location.href, data = {'newsIdSet': newsId};
                    $.post(ajaxurl, data, function (response) {
                        console.log(response);
                    });

                } else {
                    setCookie("like_news_" + newsId, "0", 1000);
                    $(this).find('i').removeClass('fi-fill-like');
                    $(this).find('i').addClass('fi-like')


                    $.ajaxSetup({
                        beforeSend: function (xhr, options) {
                            options.url = window.location.href;
                        }
                    });
                    var ajaxurl1 = window.location.href, data1 = {'newsIdRemove': newsId};
                    $.post(ajaxurl1, data1, function (response) {

                    });
                }
            });

            function getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }


        });
    </script>
<?php get_footer(); ?>