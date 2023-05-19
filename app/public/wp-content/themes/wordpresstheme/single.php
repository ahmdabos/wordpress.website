<?php
get_header();
?>
<?php
while (have_posts()) :
    the_post();
endwhile;
?>

<img src="<?php echo get_the_post_thumbnail_url() ?>">
<?php
get_footer();