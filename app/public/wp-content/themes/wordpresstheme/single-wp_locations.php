<?php get_header(); ?>

    <div class="static-page">
        <section class="news-sec" data-aos="fade-up" data-aos-duration="900" data-aos-delay="800">
            <div class="page-head">
                <div class="container">
                    <div class="breadcrumbs-wrap">

                    </div>
                    <h2 class="main-title"></h2>
                </div>
            </div>
            <div class="page-content">
                <div class="container">
                    <?php the_content(); ?>
                </div>
            </div>
        </section>
    </div>
<?php get_footer(); ?>