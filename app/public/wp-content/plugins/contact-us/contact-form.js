jQuery(document).ready(function($) {
    $('#contact-form').submit(function(e) {
        e.preventDefault();
        var name = $('#name').val();
        var email = $('#email').val();
        var message = $('#message').val();
        $.ajax({
            type: 'POST',
            url: contact_form_ajax_obj.ajax_url,
            data: {
                action: 'contact_form_submit',
                name: name,
                email: email,
                message: message,
                submit: true,
            },
            success: function(response) {
                if (response.success) {
                    $('#contact-form').html('<div class="notice notice-success">' + response.data + '</div>');
                } else {
                    $('#contact-form').prepend('<div class="notice notice-error">' + response.data + '</div>');
                }
            },
            error: function(response) {
                $('#contact-form').prepend('<div class="notice notice-error">Failed to submit form. Please try again later.</div>');
            },
        });
    });
});