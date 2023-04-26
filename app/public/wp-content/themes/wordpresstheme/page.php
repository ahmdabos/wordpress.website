<?php
get_header();
?>
<?php
if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <div class="static-page ">
            <section class="programs-sec sub-page contact-sec knowledge-hub-sec community-sec we-serve-sec dc-focus dc-strategy" data-aos="fade-up" data-aos-duration="900" data-aos-delay="800">
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
                        <?php the_content(); ?>
                    </div>
                </div>
            </section>
        </div>
    <?php endwhile; ?>
<?php endif; ?>
<?php
get_footer();