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
                fetch('<?php echo esc_url_raw(rest_url('ccg/v1/create_post/')); ?>', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-WP-Nonce': '<?php echo wp_create_nonce('wp_rest'); ?>'
                    },
                    body: JSON.stringify({
                        topics: jQuery('#topics').val()
                    })
                })
                    .then(response => response.json())
                    .then(responses => {
                        submitButton.prop('disabled', false);
                        pleaseWait.remove();
                        responses.forEach(function (response) {
                            if (response.success) {
                                add_admin_notice(response.message, false);
                            } else {
                                add_admin_notice('Error: ' + response.message, true);
                            }
                        });
                    })
                    .catch((error) => {
                        console.error('Error:', error);
                    });
            });

        </script>
        <?php
    }
}
