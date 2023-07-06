<?php
/**
 * Template Name: Home
 */
get_header();
?>
<div class="swiper hero">
    <div class="swiper-wrapper">
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
                <div class="swiper-slide" style="background:#3f3b37;">
                    <div class="info d-flex align-items-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-12 text-center">
                                    <h2 data-aos="fade-down"><?php echo esc_html(get_the_title()); ?></h2>
                                    <p data-aos="fade-up"><?php the_content(); ?></p>
                                    <a data-aos="fade-up" data-aos-delay="200" href="#" class="btn-get-started">Get Started</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide" style="background:#373f39;">
                    <div class="info d-flex align-items-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-12 text-center">
                                    <h2 data-aos="fade-down"><?php echo esc_html(get_the_title()); ?></h2>
                                    <p data-aos="fade-up"><?php the_content(); ?></p>
                                    <a data-aos="fade-up" data-aos-delay="200" href="#" class="btn-get-started">Get Started</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php endif; ?>
        <?php wp_reset_postdata(); ?>
    </div>
    <div class="swiper-pagination"></div>
</div>
<?php
get_footer();
?>
