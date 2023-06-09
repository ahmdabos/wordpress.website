<?php
/**
 * @package Polylang
 */

/**
 * Manages the static front page and the page for posts on admin side
 *
 * @since 1.8
 */
class PLL_Admin_Static_Pages extends PLL_Static_Pages {
	protected $links;

	/**
	 * Constructor: setups filters and actions
	 *
	 * @since 1.8
	 *
	 * @param object $polylang
	 */
	public function __construct( &$polylang ) {
		parent::__construct( $polylang );

		$this->links = &$polylang->links;

		// Removes the editor and the template select dropdown for pages for posts
		add_filter( 'use_block_editor_for_post', array( $this, 'use_block_editor_for_post' ), 10, 2 ); // Since WP 5.0
		add_action( 'add_meta_boxes', array( $this, 'add_meta_boxes' ), 10, 2 );

		// Add post state for translations of the front page and posts page
		add_filter( 'display_post_states', array( $this, 'display_post_states' ), 10, 2 );

		// Refresh language cache when a static front page has been translated
		add_action( 'pll_save_post', array( $this, 'pll_save_post' ), 10, 3 );

		// Checks if chosen page on front is translated
		add_filter( 'pre_update_option_page_on_front', array( $this, 'update_page_on_front' ), 10, 2 );
		add_filter( 'customize_validate_page_on_front', array( $this, 'customize_validate_page_on_front' ), 10, 2 );

		// Prevents WP resetting the option
		add_filter( 'pre_update_option_show_on_front', array( $this, 'update_show_on_front' ), 10, 2 );

		add_action( 'admin_notices', array( $this, 'notice_must_translate' ) );
	}

	/**
	 * Don't use the block editor for the translations of the pages for posts
	 *
	 * @since 2.5
	 *
	 * @param bool    $use_block_editor Whether the post can be edited or not.
	 * @param WP_Post $post             The post being checked.
	 * @return bool
	 */
	public function use_block_editor_for_post( $use_block_editor, $post ) {
		if ( 'page' === $post->post_type ) {
			add_filter( 'option_page_for_posts', array( $this, 'translate_page_for_posts' ) );

			if ( ( get_option( 'page_for_posts' ) == $post->ID ) && empty( $post->post_content ) ) {
				return false;
			}
		}

		return $use_block_editor;
	}

	/**
	 * Removes the editor for translations of the pages for posts
	 * Removes the page template select dropdown in page attributes metabox too
	 *
	 * @since 2.2.2
	 *
	 * @param string $post_type Current post type
	 * @param object $post      Current post
	 */
	public function add_meta_boxes( $post_type, $post ) {
		if ( 'page' === $post_type ) {
			add_filter( 'option_page_for_posts', array( $this, 'translate_page_for_posts' ) );

			if ( ( get_option( 'page_for_posts' ) == $post->ID ) && empty( $post->post_content ) ) {
				add_action( 'edit_form_after_title', '_wp_posts_page_notice' );
				remove_post_type_support( $post_type, 'editor' );
			}
		}
	}

	/**
	 * Add post state for translations of the front page and posts page
	 *
	 * @since 1.8
	 *
	 * @param array  $post_states An array of post display states.
	 * @param object $post        The current post object.
	 * @return array
	 */
	public function display_post_states( $post_states, $post ) {
		if ( in_array( $post->ID, $this->model->get_languages_list( array( 'fields' => 'page_on_front' ) ) ) ) {
			$post_states['page_on_front'] = __( 'Front Page', 'polylang' );
		}

		if ( in_array( $post->ID, $this->model->get_languages_list( array( 'fields' => 'page_for_posts' ) ) ) ) {
			$post_states['page_for_posts'] = __( 'Posts Page', 'polylang' );
		}

		return $post_states;
	}

	/**
	 * Refresh language cache when a static front page has been translated
	 *
	 * @since 1.8
	 *
	 * @param int    $post_id      Not used
	 * @param object $post         Not used
	 * @param array  $translations
	 */
	public function pll_save_post( $post_id, $post, $translations ) {
		if ( in_array( $this->page_on_front, $translations ) ) {
			$this->model->clean_languages_cache();
		}
	}

	/**
	 * Prevents choosing an untranslated static front page
	 * Displays an error message
	 *
	 * @since 1.6
	 *
	 * @param int $page_id New page on front page id
	 * @param int $old_id  Old page on front page_id
	 * @return int
     */
    public function update_page_on_front($page_id, $old_id)
    {
        if (!$this->is_page_translated($page_id)) {
            $page_id = $old_id;
            add_settings_error('reading', 'pll_page_on_front_error', __('The chosen static front page must be translated in all languages.', 'polylang'));
        }

        return $page_id;
    }

    /**
     * Checks if a page is translated in all languages
     *
     * @param int $page_id
     * @return bool
     * @since 2.2
     *
     */
    protected function is_page_translated($page_id)
    {
        if ($page_id) {
            $translations = count($this->model->post->get_translations($page_id));
            $languages = count($this->model->get_languages_list());

            if ($languages > 1 && $translations != $languages) {
                return false;
            }
        }

        return true;
    }

    /**
     * Displays an error message in the customizer when choosing an untranslated static front page
     *
     * @param object $validity WP_Error object
     * @param int $page_id New page on front page id
     * @return object
     * @since 2.2
     *
     */
	public function customize_validate_page_on_front( $validity, $page_id ) {
		if ( ! $this->is_page_translated( $page_id ) ) {
			return new WP_Error( 'pll_page_on_front_error', __( 'The chosen static front page must be translated in all languages.', 'polylang' ) );
		}

		return $validity;
	}

	/**
	 * Prevents WP resetting the option if the admin language filter is active for a language with no pages
	 *
	 * @since 1.9.3
	 *
	 * @param string $value
	 * @param string $old_value
	 * @return string
	 */
	public function update_show_on_front( $value, $old_value ) {
		if ( ! empty( $GLOBALS['pagenow'] ) && 'options-reading.php' === $GLOBALS['pagenow'] && 'posts' === $value && ! get_pages() && get_pages( array( 'lang' => '' ) ) ) {
			$value = $old_value;
		}
		return $value;
	}

	/**
	 * Add a notice to translate the static front page if it is not translated in all languages
	 * This is especially useful after a new language is created.
	 * The notice is not dismissible and displayed on the Languages pages and the list of pages.
	 *
	 * @since 2.6
	 */
	public function notice_must_translate() {
		$screen = get_current_screen();

		if ( 'toplevel_page_mlang' === $screen->id || 'edit-page' === $screen->id ) {
			$message = $this->get_must_translate_message();

			if ( ! empty( $message ) ) {
				printf(
					'<div class="error"><p>%s</p></div>',
					$message // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
				);
			}
		}
	}

	/**
	 * Returns the message asking to translate the static front page in all languages.
	 *
	 * @since 2.8
	 *
	 * @return string
	 */
	public function get_must_translate_message() {
		$message = '';

		if ( $this->page_on_front ) {
			$untranslated = array();

			foreach ( $this->model->get_languages_list() as $language ) {
				if ( ! $this->model->post->get( $this->page_on_front, $language ) ) {
					$untranslated[] = sprintf(
						'<a href="%s">%s</a>',
						esc_url( $this->links->get_new_post_translation_link( $this->page_on_front, $language ) ),
						esc_html( $language->name )
					);
				}
			}

			if ( ! empty( $untranslated ) ) {
				$message = sprintf(
					/* translators: %s is a comma separated list of native language names */
					esc_html__( 'You must translate your static front page in %s.', 'polylang' ),
					implode( ', ', $untranslated ) // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
				);
			}
		}

		return $message;
	}
}
