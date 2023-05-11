<?php
if (!defined('ABSPATH')) {
    exit;
}

class CCG_Admin
{
    public function create_main_menu_page()
    {
        add_menu_page(
            'ChatGPT Content Generator',
            'ChatGPT Content Generator',
            'manage_options',
            'chatgpt_content_generator',
            [$this, 'render_main_menu_page']
        );
    }

    public function render_main_menu_page()
    {
        new CCG_Public();

        ?>
        <div class="wrap">
            <h1>ChatGPT Content Generator</h1>
            <div id="ccg-admin-notice"></div>
            <form id="ccg-form" method="post">
                <table class="form-table">
                    <tbody>
                    <tr>
                        <th scope="row">
                            <label for="topics">Provide topics list</label>
                        </th>
                        <td>
                            <textarea id="topics" name="topics" rows="10" cols="100" class="large-text code"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <p class="submit">
                    <input type="submit" value="Generate Content" class="button button-primary">
                </p>
            </form>
        </div>
        <script>
            function add_admin_notice(message, isError) {
                const noticeClass = isError ? 'notice-error' : 'notice-success';
                const noticeHtml = `<div class="notice ${noticeClass} is-dismissible"><p>${message}</p></div>`;
                jQuery('#ccg-admin-notice').html(noticeHtml);
            }

            jQuery('#ccg-form').on('submit', function (event) {
                event.preventDefault();
                var submitButton = jQuery(this).find('input[type="submit"]');
                submitButton.prop('disabled', true);
                var pleaseWait = jQuery('<span> Please wait...</span>');
                submitButton.after(pleaseWait);
                jQuery.post(ajaxurl, {
                    action: 'ccg_create_post',
                    topics: jQuery('#topics').val()
                }, function (responses) {
                    submitButton.prop('disabled', false);
                    pleaseWait.remove();
                    responses.forEach(function (response) {
                        if (response.success) {
                            add_admin_notice(response.message, false);
                        } else {
                            add_admin_notice('Error: ' + response.message, true);
                        }
                    });
                }).fail(function (jqXHR, textStatus, errorThrown) {
                    console.log('AJAX error:', textStatus, errorThrown);
                });

            });
        </script>
        <?php
    }
}
