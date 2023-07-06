<?php
get_header();
/**
 * Template Name: News
 */
?>
<main id="main">

    <div class="breadcrumbs d-flex align-items-center" style="background:#a65eff">
        <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">
            <h2><?php the_title() ?></h2>
            <?php \Functions\Start::breadcrumbs() ?>
        </div>
    </div>

    <section id="blog" class="blog">
        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div id="listing" class="row gy-4 posts-list"></div>

            <div class="blog-pagination">
                <ul class="justify-content-center">
                    <li class=""><a href="javascript:void(0)" id="previous-item"><i class="fi-arrow-l"></i>
                            <span>Previous</span></a></li>
                    <li><span class="page-number"><span class="current-page"></span> of <span
                                id="total-pages"> pages</span></span></li>
                    <li class=""><a href="javascript:void(0)" id="next-item"><span>Next</span> <i
                                class="fi-arrow-r"></i> </a></li>
                </ul>
                <span class="page-count">Total items : <span id="total-items"></span>
            </div>


        </div>
    </section>

</main>



<?php get_footer(); ?>
<script>
    jQuery(document).ready(function ($) {
        var lang = 'en', noItems = 'No results found!', read_more = 'Read more', page = 1;
        if (window.location.href.indexOf('/en/') !== -1) {
            lang = 'en';
            noItems = 'No results found!';
            read_more = 'Read more';
        } else {
            lang = 'ar';
            noItems = 'لم يتم العثور على نتائج!';
            read_more = 'إقرأ المزيد';

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
                            '<div class="col-xl-4 col-md-6">' +
                            '<div class="post-item position-relative h-100">' +
                            '<div class="post-img position-relative overflow-hidden">' +
                            '<img src="' + featuredmedia + '" class="img-fluid" alt="' + value.title.rendered + '" title="' + value.title.rendered + '">' +
                            '</div>' +
                            '<div class="post-content d-flex flex-column">' +
                            '<h3 class="post-title">' + value.title.rendered + '</h3>' +
                            '<p>' + value.excerpt.rendered + '</p>' +
                            '<a href="' + value.link + '" class="readmore stretched-link"><span>Read More</span><i class="bi bi-arrow-right"></i></a>' +
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
