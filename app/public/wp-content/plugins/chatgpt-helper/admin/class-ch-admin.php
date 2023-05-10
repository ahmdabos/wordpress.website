<?php
if (!defined('ABSPATH')) {
    exit;
}

class CH_Admin
{
    public function create_meta_boxes()
    {
        add_meta_box(
            'chatgpt_helper',
            'ChatGPT Helper',
            [$this, 'render_meta_boxes'],
            'post',
            'side'
        );
    }

    public function render_meta_boxes()
    {
        new CH_Public();

        ?>
        <div>
            <h2>ChatGPT Helper</h2>
            <div id="cg-admin-notice"></div>
            <label for="chatgpt-action">Select Action:</label>
            <select id="chatgpt-action" name="chatgpt-action">
                <option value="">-- Select --</option>
                <option value="create-new">Create New</option>
            </select>
            <div id="chatgpt-options" style="display: none;">
                <label for="topic">Enter Topic:</label>
                <textarea id="topic" name="topic" rows="10" cols="100" class="large-text code"></textarea>
                <p class="submit">
                    <input type="submit" value="Go" class="button button-primary" id="submit">
                </p>
            </div>
        </div>

        <script>
            function add_admin_notice(message, isError) {
                const noticeClass = isError ? 'notice-error' : 'notice-success';
                const noticeHtml = `<div class="notice ${noticeClass} is-dismissible"><p>${message}</p></div>`;
                jQuery('#cg-admin-notice').html(noticeHtml);
            }

            jQuery('#chatgpt-action').on('change', function () {
                if (jQuery(this).val() === 'create-new') {
                    jQuery('#chatgpt-options').show();
                } else {
                    jQuery('#chatgpt-options').hide();
                }
            });
            jQuery('#submit').on('click', function (event) {
                event.preventDefault();
                jQuery.post(ajaxurl, {
                    action: 'ccg_create_post',
                    topic: jQuery('#topic').val()
                }, function (response) {
                    if (response.success) {
                        add_admin_notice(response.data.message, false);
                        var generated_data = response.data.content;
                        if (typeof tinyMCE !== 'undefined') {
                            tinyMCE.get('content').setContent(generated_data);
                        } else {
                            jQuery('#content').val(generated_data);
                        }
                    } else {
                        add_admin_notice('Error: ' + response.data, true);
                    }
                });
            });
        </script>
        <?php
    }


}
