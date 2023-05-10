<?php
if (!defined('ABSPATH')) {
    exit;
}
class CH_Settings {
    public function register_settings() {
        register_setting('ch_settings', 'ch_chatgpt_api_key');
        register_setting('ch_settings', 'ch_chatgpt_temperature');
        register_setting('ch_settings', 'ch_chatgpt_max_tokens');

    }

    public function create_admin_page() {
        add_menu_page(
            'ChatGPT Helper',
            'ChatGPT Helper',
            'manage_options',
            'chatgpt_helper',
            [$this, 'render_settings_page']
        );
    }

    public function render_settings_page() {
        ?>
        <div class="wrap">
            <h1>ChatGPT Helper</h1>
            <form method="post" action="options.php">
                <?php
                settings_fields('ch_settings');
                do_settings_sections('ch_settings')
                ?>
                <table class="form-table">
                    <tr valign="top">
                        <th scope="row">ChatGPT API Key</th>
                        <td><input type="text" name="ch_chatgpt_api_key" value="<?php echo esc_attr(get_option('ch_chatgpt_api_key')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">ChatGPT Temperature</th>
                        <td><input type="text" name="ch_chatgpt_temperature" value="<?php echo esc_attr(get_option('ch_chatgpt_temperature', '0.7')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">ChatGPT Max Tokens</th>
                        <td><input type="text" name="ch_chatgpt_max_tokens" value="<?php echo esc_attr(get_option('ch_chatgpt_max_tokens', '1500')); ?>" /></td>
                    </tr>
                </table>
                <?php
                submit_button();
                ?>
            </form>
        </div>
        <?php
    }
}
