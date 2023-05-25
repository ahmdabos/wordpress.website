<?php
if (!defined('ABSPATH')) {
    exit;
}
class CCG_Settings {
    public function register_settings() {
        register_setting('ccg_settings', 'ccg_chatgpt_api_key');
        register_setting('ccg_settings', 'ccg_chatgpt_temperature');
        register_setting('ccg_settings', 'ccg_chatgpt_max_tokens');
        register_setting('ccg_settings', 'ccg_unsplash_api_key');
        register_setting('ccg_settings', 'ccg_pixabay_api_key');
    }

    public function create_settings_page() {
        add_submenu_page(
            'chatgpt_content_generator',
            'Settings',
            'Settings',
            'manage_options',
            'chatgpt_content_generator_settings',
            [$this, 'render_settings_page']
        );
    }

    public function render_settings_page() {
        ?>
        <div class="wrap">
            <h1>ChatGPT Content Generator Settings</h1>
            <form method="post" action="options.php">
                <?php
                settings_fields('ccg_settings');
                do_settings_sections('ccg_settings')
                ?>
                <table class="form-table">


                    <tr valign="top">
                        <th scope="row">ChatGPT API Key</th>
                        <td><input type="text" name="ccg_chatgpt_api_key" value="<?php echo esc_attr(get_option('ccg_chatgpt_api_key')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">ChatGPT Temperature</th>
                        <td><input type="text" name="ccg_chatgpt_temperature" value="<?php echo esc_attr(get_option('ccg_chatgpt_temperature', '0.7')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">ChatGPT Max Tokens</th>
                        <td><input type="text" name="ccg_chatgpt_max_tokens" value="<?php echo esc_attr(get_option('ccg_chatgpt_max_tokens', '1500')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">Unsplash API Key</th>
                        <td><input type="text" name="ccg_unsplash_api_key" value="<?php echo esc_attr(get_option('ccg_unsplash_api_key')); ?>" /></td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">Pixabay API Key</th>
                        <td><input type="text" name="ccg_pixabay_api_key" value="<?php echo esc_attr(get_option('ccg_pixabay_api_key')); ?>" /></td>
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
