<?php
/*
Plugin Name: Contact Form
Description: A simple contact form plugin for WordPress.
Version: 1.0
Author: Ahmad
*/
function contact_form_shortcode() {
    ob_start();
    if (isset($_POST['submit'])) {
        // Sanitize form data
        $name = sanitize_text_field($_POST['name']);
        $email = sanitize_email($_POST['email']);
        $message = sanitize_textarea_field($_POST['message']);

        // Validate email address
        if (!is_email($email)) {
            $error_message = 'Invalid email address';
        } else {
            // Send email to admin
            $to = get_option('admin_email');
            $subject = 'New contact form submission';
            $body = "Name: $name\n\nEmail: $email\n\nMessage: $message";
            $headers = "From: $name <$email>";

            if (wp_mail($to, $subject, $body, $headers)) {
                // Save form submission to database
                global $wpdb;
                $table_name = $wpdb->prefix . 'contact_form_submissions';
                $wpdb->insert(
                    $table_name,
                    array(
                        'name' => $name,
                        'email' => $email,
                        'message' => $message,
                        'created_at' => current_time('mysql'),
                    )
                );

                $success_message = get_option('contact_form_success_message');
                if (!$success_message) {
                    $success_message = 'Thank you for your message. We will get back to you as soon as possible.';
                }
                echo '<div class="notice notice-success">' . $success_message . '</div>';
            } else {
                $error_message = 'Failed to send email. Please try again later.';
            }
        }
        if (!empty($error_message)) {
            echo '<div class="notice notice-error">' . $error_message . '</div>';
        }
    } else {
        ?>
        <form action="" method="post" id="contact-form">
            <p>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
            </p>
            <p>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
            </p>
            <p>
                <label for="message">Message:</label>
                <textarea id="message" name="message"></textarea>
            </p>
            <p>
                <input type="submit" name="submit" value="Submit">
            </p>
        </form>
        <?php
    }
    return ob_get_clean();
}
add_shortcode('contact_form', 'contact_form_shortcode');

// Create database table to store form submissions
function contact_form_install() {
    global $wpdb;
    $table_name = $wpdb->prefix . 'contact_form_submissions';
    $charset_collate = $wpdb->get_charset_collate();
    $sql = "CREATE TABLE $table_name (
        id bigint(20) NOT NULL AUTO_INCREMENT,
        name varchar(255) NOT NULL,
        email varchar(255) NOT NULL,
        message text NOT NULL,
        created_at datetime NOT NULL,
        PRIMARY KEY  (id)
    ) $charset_collate;";
    require_once ABSPATH . 'wp-admin/includes/upgrade.php';
    dbDelta($sql);
}
register_activation_hook(__FILE__, 'contact_form_install');

// Enqueue AJAX script
function contact_form_enqueue_scripts() {
    wp_enqueue_script('contact-form-script', plugins_url('contact-form.js', __FILE__), array('jquery'), '1.0', true);
    wp_localize_script('contact-form-script', 'contact_form_ajax_obj', array(
        'ajax_url' => admin_url('admin-ajax.php'),
    ));
}
add_action('wp_enqueue_scripts', 'contact_form_enqueue_scripts');

// Handle AJAX request
add_action('wp_ajax_nopriv_contact_form_submit', 'contact_form_submit');
add_action('wp_ajax_contact_form_submit', 'contact_form_submit');
function contact_form_submit() {
    // Check if form has been submitted
    if (isset($_POST['submit'])) {
        // Sanitize form data
        $name = sanitize_text_field($_POST['name']);
        $email = sanitize_email($_POST['email']);
        $message = sanitize_textarea_field($_POST['message']);

        // Validate email address
        if (!is_email($email)) {
            wp_send_json_error('Invalid email address');
        } else {
            // Send email to admin
            $to = get_option('admin_email');
            $subject = 'New contact form submission';
            $body = "Name: $name\n\nEmail: $email\n\nMessage: $message";
            $headers = "From: $name <$email>";

            if (wp_mail($to, $subject, $body, $headers)) {
                // Save form submission to database
                global $wpdb;
                $table_name = $wpdb->prefix . 'contact_form_submissions';
                $wpdb->insert(
                    $table_name,
                    array(
                        'name' => $name,
                        'email' => $email,
                        'message' => $message,
                        'created_at' => current_time('mysql'),
                    )
                );

                $success_message = get_option('contact_form_success_message');
                if (!$success_message) {
                    $success_message = 'Thank you for your message. We will get back to you as soon as possible.';
                }
                wp_send_json_success($success_message);
            } else {
                wp_send_json_error('Failed to send email. Please try again later.');
            }
        }
    }
    wp_die();
}