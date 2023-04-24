jQuery(document).ready(function ($) {
    $("#generateContent").on("click", function () {
        const text = $("#chatGptText").val();

        if (!text) {
            alert("Please provide text to generate content.");
            return;
        }
        $.ajax({
            type: "POST",
            url: chatgpt_ajax_object.ajax_url,
            data: {
                action: "chatgpt_generate_content",
                text: text
            },
            success: function (response) {
                if (response.success) {
                    if (typeof tinyMCE !== "undefined" && tinyMCE.get("content")) {
                        tinyMCE.get("content").setContent(response.data);
                    } else {
                        $("#content").val(response.data);
                    }
                } else {
                    alert("Failed to generate content. Please try again.");
                }
            },
            error: function () {
                alert("An error occurred. Please try again.");
            }
        });
    });
});