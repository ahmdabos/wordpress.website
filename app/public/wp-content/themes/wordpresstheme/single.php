<?php
get_header();
?>
    <section>
        <div class="page-head">
            <div class="container">
                <div class="breadcrumbs-wrap">

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
/*
now the issue somehow fixed, by enabling the visual editor
i can see in my page every paragraph wrapped with p tag, but also the subtitles also wrapped with p tag
i want an automated way to wrap the subtitle with h2 tag


in my page i have logo, i have post title, i have subtites
what is the best tags to use for it in regards best practice seo
 */