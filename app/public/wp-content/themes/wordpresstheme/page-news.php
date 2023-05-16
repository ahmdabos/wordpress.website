<?php
get_header();
/**
 * Template Name: News
 */
?>

<div class="static-page">
    <section class="news-sec">
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
                <div class="news-content box-f">
                    <div class="row" id="listing"></div>
                    <div class="pagination-wrapper">
                        <ul class="list-item">
                            <li class="prev control left"><a href="javascript:void(0)" id="previous-item"><i class="fi-arrow-l"></i>
                                    <span><?php _t('previous'); ?></span></a></li>
                            <li><span class="page-number"><span class="current-page"></span> <?php _t('of'); ?> <span
                                        id="total-pages"> <?php _t('pages'); ?></span></span></li>
                            <li class="next control right"><a href="javascript:void(0)" id="next-item"><span><?php _t('next'); ?></span> <i
                                        class="fi-arrow-r"></i> </a></li>
                        </ul>
                        <span class="page-count"><?php _t('total_items'); ?> : <span id="total-items"></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php get_footer(); ?>
<script>
    jQuery(document).ready(function ($) {
        var lang = 'en', noItems = 'No results found!', read_more = 'Read more', page = 1;
        if (window.location.href.indexOf('/en/') !== -1) {
            lang = 'en';
            noItems = 'No results found!';
            read_more = 'Read more';
            published_on = 'Published on';
            var monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
        } else {
            lang = 'ar';
            noItems = 'لم يتم العثور على نتائج!';
            read_more = 'إقرأ المزيد';
            published_on = 'تاريخ النشر ';
            var monthNames = ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو",
                "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"];
        }

        getListing(page);

        function getListing(page) {
            var content = '', featuredmedia = '';
            var request = $.ajax({
                url: '/wp-json/wp/v2/news?_embed&orderby=' + 'date' + '&order=desc&per_page=9&page=' + page + '&lang=' + lang,
                method: "GET",
                dataType: "json",
                async: false,
            });
            request.done(function (data, textStatus, jqXHR) {
                if (data.length > 0) {
                    $('#pagination-wrapper').show();
                    console.log(data);
                    $.each(data, function (index, value) {
                        if (value.featured_media !== 0) {
                            featuredmedia = value._embedded["wp:featuredmedia"][0].source_url;
                        } else {
                            featuredmedia = '';
                        }
                        content +=

                            '<div class="col-lg-4 col-md-6 col-sm-12 mb-4">' +
                            '<div class="news-card left">' +
                            '<div class="news-img">' +
                            '<a href="' + value.link + '">' +
                            '<img src="' + featuredmedia + '" alt="' + value.title.rendered + '" title="' + value.title.rendered + '">' +
                            '</a>' +
                            '</div>' +
                            '<div class="news-content">' +
                            '<div class="top">' +
                            '<div class="date"><span>' + published_on + ' ' + value.date + '</span></div>' +
                            '<h4 class="title"><a href="' + value.link + '">' + value.title.rendered + '</a></h4>' +
                            '</div>' +
                            '<div class="bottom">' +
                            '<div class="action-link">' +
                            '<a href="' + value.link + '" class="action-box">' + read_more + '</a>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                    });
                    $('#listing').html(content);
                    var show_per_page = 9;
                    var number_of_items = jqXHR.getResponseHeader("X-WP-Total");
                    var number_of_pages = Math.ceil(number_of_items / show_per_page);
                    $('.current-page').text(page);
                    $('#total-pages').text(number_of_pages);
                    $('#total-items').text(number_of_items);
                    $('#listing').children().css('display', 'none');
                    $('#listing').children().slice(0, show_per_page).css('display', 'inline-block');
                } else {
                    $('#pagination-wrapper').hide();
                    $('#listing').html(noItems);
                }
            });
            request.fail(function (jqXHR, textStatus) {
                console.log(textStatus)
            });

        }

        $(document).on("change", "#enter-page-number", function () {
            go_to_page($(this).val())
        });
        $(document).on("click", "#first-item", function () {
            first();
        });
        $(document).on("click", "#previous-item", function () {
            previous();
        });
        $(document).on("click", "#next-item", function () {
            next();
        });
        $(document).on("click", "#last-item", function () {
            last();
        });


        function go_to_page(page_num) {
            $('#enter-page-number').val(page_num);
            page_num = parseInt(page_num);
            var show_per_page = parseInt($('#show_per_page').val(), 0);
            start_from = page_num * show_per_page;
            end_on = start_from + show_per_page;
            $('#listing').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');
            getListing(page_num);
            $("html, body").animate({scrollTop: "100"}, 2000);
        }

        function previous() {
            var currentPage = parseInt($('.current-page').text());
            if (currentPage > 1)
                go_to_page(currentPage - 1);
        }

        function next() {
            var currentPage = parseInt($('.current-page').text());
            var totalPages = parseInt($('#total-pages').text());
            if (currentPage < totalPages)
                go_to_page(currentPage + 1);
        }

        function first() {
            go_to_page(1);
        }

        function last() {
            var totalPages = parseInt($('#total-pages').text());
            go_to_page(totalPages);
        }
    });
</script>
