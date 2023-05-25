<?php
get_header();
?>
    <section>
        <div class="page-head">
            <div class="container">
                <div class="breadcrumbs-wrap">
                    <?php
                    $breadcrumbs = \Functions\Start::breadcrumbs();
                    echo '<ul class="breadcrumb-wrap">';
                    foreach($breadcrumbs as $crumb) {
                        if ($crumb['url']) {
                            echo '<li><a href="' . $crumb['url'] . '">' . $crumb['title'] . '</a></li>';
                        } else {
                            echo '<li>' . $crumb['title'] . '</li>';
                        }
                    }
                    echo '</ul>';

                    ?>
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