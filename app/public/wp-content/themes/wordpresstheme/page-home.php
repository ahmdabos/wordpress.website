<?php
/**
 * Template Name: Home
 */

get_header();
?>

<section class="home-banner">
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
                                <h1><?php echo esc_html(get_the_title()); ?></h1>
                                <?php the_content(); ?>
                            </div>
                        </div>
                    </div>
                    <img class="banner-img" src="<?php echo esc_url(get_the_post_thumbnail_url()); ?>" alt="<?php echo esc_attr(get_the_title()); ?>" title="<?php echo esc_attr(get_the_title()); ?>"/>
                </div>
            <?php endwhile; ?>
        <?php endif; ?>
        <?php wp_reset_postdata(); ?>
    </div>
</section>
<?php
get_footer();
?>
