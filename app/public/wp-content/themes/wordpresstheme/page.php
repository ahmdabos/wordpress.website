<?php
get_header();
?>
    <section>
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
<?php
get_footer();