<?php
$requires = ['Start',];
foreach ($requires as $require) {
    require get_template_directory() . '/inc/' . $require . '.php';
}
use Functions\{Start};
$start = new Start();
$start->register();


