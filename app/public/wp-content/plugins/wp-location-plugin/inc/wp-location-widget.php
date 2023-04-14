<?php

defined('ABSPATH') or die('Nope, not accessing this');

class WP_Location_Widget extends WP_Widget {
    public function __construct() {
        parent::__construct(
            'wp_location_widget',
            'WP Location Widget',
            array('description' => 'A widget that displays your locations')
        );
        add_action('widgets_init', array($this, 'register_wp_location_widgets'));
    }

    public function form($instance) {
        $location_id = isset($instance['location_id']) ? $instance['location_id'] : 'default';
        $number_of_locations = isset($instance['number_of_locations']) ? $instance['number_of_locations'] : 5;

        echo $this->generate_widget_form($location_id, $number_of_locations);
    }

    public function update($new_instance, $old_instance) {
        return array(
            'location_id' => $new_instance['location_id'],
            'number_of_locations' => $new_instance['number_of_locations']
        );
    }

    public function widget($args, $instance) {
        global $wp_simple_locations;

        $arguments = array();

        if ($instance['location_id'] != 'default') {
            $arguments['location_id'] = $instance['location_id'];
        }

        if ($instance['number_of_locations'] != 'default') {
            $arguments['number_of_locations'] = $instance['number_of_locations'];
        }

        $html = $args['before_widget'];
        $html .= $args['before_title'] . 'Locations' . $args['after_title'];
        $html .= $wp_simple_locations->get_locations_output($arguments);
        $html .= $args['after_widget'];

        echo $html;
    }

    public function register_wp_location_widgets() {
        register_widget('WP_Location_Widget');
    }

    private function generate_widget_form($location_id, $number_of_locations) {
        $locations = get_posts(array(
            'posts_per_page' => -1,
            'post_type' => 'wp_locations'
        ));

        ob_start();
        ?>
        <p>Select your options below</p>
        <p>
            <label for="<?php echo $this->get_field_name('location_id'); ?>">Location to display</label>
            <select class="widefat" name="<?php echo $this->get_field_name('location_id'); ?>"
                    id="<?php echo $this->get_field_id('location_id'); ?>" value="<?php echo $location_id; ?>">
                <option value="default">All Locations</option>
                <?php
                foreach ($locations as $location) {
                    $selected = $location->ID == $location_id ? 'selected' : '';
                    echo "<option {$selected} value='{$location->ID}'>" . get_the_title($location->ID) . "</option>";
                }
                ?>
            </select>
        </p>
        <p>
        <small>If you want to display multiple locations select how many below</small><br/>
        <label for="<?php echo $this->get_field_id('number_of_locations'); ?>">Number of Locations</label>
    <select class="widefat" name="<?php echo $this->get_field_name('number_of_locations'); ?>"
            id="<?php echo $this->get_field_id('number_of_locations'); ?>"
            value="<?php echo $number_of_locations; ?>">
        <?php
        $options = array('default', 1, 2, 3, 4, 5, 10);
        foreach ($options as $option) {
                  $selected = $option == $number_of_locations ? 'selected' : '';
                    $label = $option == 'default' ? 'All Locations' : $option;
                    echo "<option {$selected} value='{$option}'>{$label}</option>";
                }
        ?>
    </select>
        </p>
        <?php
        return ob_get_clean();
    }
}

new WP_Location_Widget;
