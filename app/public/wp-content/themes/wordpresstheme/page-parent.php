<?php
/**
 * Template Name: Parent Page
 */
get_header();
?>
<?php
if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <div class="static-page">
            <section class="programs-sec sub-page contact-sec knowledge-hub-sec community-sec we-serve-sec dc-focus dc-strategy" data-aos="fade-up" data-aos-duration="900" data-aos-delay="800">
                <div class="page-head">
                    <div class="container">
                        <div class="breadcrumbs-wrap">
                            <?php \Functions\Start::breadcrumbs(); ?>
                        </div>
                        <h2 class="main-title"><?php the_title() ?></h2>
                    </div>
                </div>
                <div class="generic-content-box">
                    <div class="container">
                        <div class="row">
                            <?php
                            $args = array(
                                'post_type' => 'page',
                                'posts_per_page' => -1,
                                'post_parent' => get_the_ID(),
                                'order' => 'ASC',
                                'orderby' => 'menu_order',
                                'post_status' => 'publish',
                            );
                            $initiatives_list = new WP_Query($args);
                            if ($initiatives_list->have_posts()) : ?>
                                <?php while ($initiatives_list->have_posts()) : $initiatives_list->the_post(); ?>
                                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                        <div class="img-item-box-2">
                                            <a href="<?php the_permalink(); ?>" class="img-box">
                                                <?php if (get_the_post_thumbnail()): ?>
                                                    <img src="<?php the_post_thumbnail_url(); ?>" alt="<?php the_title() ?>" title="<?php the_title() ?>">
                                                <?php else: ?>
                                                    <img src="<?php echo get_template_directory_uri() ?>/assets/images/general-thumbnail.jpg" alt="<?php the_title() ?>" title="<?php the_title() ?>">
                                                <?php endif; ?>
                                            </a>
                                            <div class="content">
                                                <h4 class="title"><a href="<?php the_permalink(); ?>"><?php the_title() ?></a></h4>

                                                <div class="action-link">
                                                    <a href="<?php the_permalink(); ?>" class="action-box"><?php _t('read_more'); ?> <i class="fi-arrow-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                <?php endwhile;
                            endif;
                            wp_reset_query();
                            ?>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    <?php endwhile; ?>
<?php endif; ?>
<?php
get_footer();
