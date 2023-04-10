<?php
/**
 * Template Name: Home
 */

get_header();
?>
    <section class="home-banner" data-aos="fade-up" data-aos-duration="700" data-aos-delay="800">
        <div class="main-banner owl-carousel owl-theme">

            <?php
            $slider_args = array(
                'post_type' => 'sliders',
                'post_status' => 'publish',
                'posts_per_page' => 5,
                'order' => 'DESC',
                'orderby' => 'menu_order'
            );
            $slider_query = new WP_Query($slider_args);
            ?>
            <?php
            if ($slider_query->have_posts()) :
                while ($slider_query->have_posts()) :
                    $slider_query->the_post();
                    ?>
                    <div class="item">
                        <div class="banner-wrap">
                            <div class="container">
                                <div class="banner-content">
                                    <h1><?php the_title(); ?></h1>
                                    <?php the_content(); ?>
                                </div>
                            </div>
                        </div>
                        <img class="banner-img" src="<?php the_post_thumbnail_url() ?>" alt="<?php the_title() ?>"
                             title="<?php the_title() ?>"/>
                    </div>
                <?php endwhile; ?>
            <?php endif; ?>
            <?php wp_reset_postdata(); ?>
        </div>
        <div class="particle-network-animation"></div>
    </section>
    <!-- about -->
    <section class="ambition-focus" data-aos="fade-up" data-aos-duration="700" data-aos-delay="800">
        <div class="container">
            <div class="row">
                <?php
                $about_args = array(
                    'post_type' => 'page',
                    'posts_per_page' => 1,
                    'post__in' => array(18)
                );
                $about_query = new WP_Query($about_args);
                if ($about_query->have_posts()) : ?>
                    <?php while ($about_query->have_posts()) : $about_query->the_post(); ?>
                        <div class="col-lg-6 col-md-12">
                            <div class="focus-wrap focus-content box-f box-r-40">
                                <?php the_content(); ?>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="focus-wrap focus-title box-f box-l-40">
                                <?php the_excerpt(); ?>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endif;
                wp_reset_postdata(); ?>
            </div>
        </div>
    </section>
<?php
get_footer();

