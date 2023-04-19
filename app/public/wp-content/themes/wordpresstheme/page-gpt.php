<?php
/**
 * Template Name: GPT
 */
get_header();
?>
<?php
if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <div class="static-page ">
            <section class="programs-sec sub-page contact-sec knowledge-hub-sec community-sec we-serve-sec dc-focus dc-strategy" data-aos="fade-up" data-aos-duration="900" data-aos-delay="800">
                <div class="page-head">
                    <div class="container">
                        <div class="breadcrumbs-wrap">
                            <?php \Functions\Start::breadcrumbs(); ?>
                        </div>
                        <h2 class="main-title"><?php the_title() ?></h2>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">
                        <style>
                            .chat-container {
                                max-width: 600px;
                                margin: 0 auto;
                                padding: 20px;
                                background-color: #f8f8f8;
                                border: 1px solid #ccc;
                                border-radius: 5px;
                            }
                            .chat-messages {
                                max-height: 300px;
                                overflow-y: auto;
                                margin-bottom: 10px;
                            }
                            .message {
                                padding: 8px;
                                margin-bottom: 10px;
                                border-radius: 5px;
                            }
                            .user-message {
                                background-color: #e0f7fa;
                            }
                            .bot-message {
                                background-color: #fff9c4;
                            }
                        </style>

                        <body>
                        <div class="chat-container">
                            <div class="chat-messages" id="chat-messages"></div>
                            <form id="chat-form">
                                <input type="text" id="user-input" placeholder="Type your message..." autocomplete="off" required>
                                <button type="submit">Send</button>
                            </form>
                        </div>


                        <script>
                            jQuery(document).ready(function ($) {
                                const chatForm = $('#chat-form');
                                const userInput = $('#user-input');
                                const chatMessages = $('#chat-messages');

                                const addMessage = (message, sender) => {
                                    const messageElem = $('<div>').addClass(`message ${sender}-message`).text(message);
                                    chatMessages.append(messageElem);
                                    chatMessages.scrollTop(chatMessages[0].scrollHeight);
                                };

                                chatForm.on('submit', function (event) {
                                    event.preventDefault();
                                    const userMessage = userInput.val().trim();
                                    if (!userMessage) return;

                                    addMessage(userMessage, 'user');
                                    userInput.val('');

                                    $.ajax({
                                        url: 'https://wordpress.website/wp-content/themes/wordpresstheme/chatgpt-api.php',
                                        method: 'POST',
                                        dataType: 'json',
                                        contentType: 'application/json',
                                        data: JSON.stringify({
                                            message: userMessage,
                                            conversation: $('#chat-messages').text() // Send the entire conversation history
                                        }),
                                        success: function (response) {
                                            if (response.message) {
                                                addMessage(response.message, 'bot');
                                            } else {
                                                addMessage('Error: Could not fetch the response.', 'bot');
                                            }
                                        },
                                        error: function () {
                                            addMessage('Error: Could not communicate with the server.', 'bot');
                                        }
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
            </section>
        </div>
    <?php endwhile; ?>
<?php endif; ?>
<?php
get_footer();
?>




