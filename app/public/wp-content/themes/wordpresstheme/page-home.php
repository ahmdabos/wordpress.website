<?php
/**
 * Template Name: Home
 */
get_header();
?>
<section id="hero" class="hero">
    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
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
                <div class="carousel-item active" style="background-image: url(assets/img/hero-carousel/hero-carousel-2.jpg)">
                    <div class="info d-flex align-items-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-12 text-center">
                                    <h2 data-aos="fade-down"><?php echo esc_html(get_the_title()); ?></h2>
                                    <p data-aos="fade-up"><?php the_content(); ?></p>
                                    <a data-aos="fade-up" data-aos-delay="200" href="#get-started" class="btn-get-started">Get Started</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php endif; ?>
        <?php wp_reset_postdata(); ?>
        <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>
    </div>
</section>
<section class="home-banner">
    <div class="main-banner owl-carousel owl-theme"></div>
</section>
<?php
get_footer();
?>
