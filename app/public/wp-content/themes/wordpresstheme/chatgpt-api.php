
<?php
header('Content-Type: application/json');

$request_body = file_get_contents('php://input');
$json_data = json_decode($request_body, true);

$user_message = $json_data['message'] ?? '';
$conversation = $json_data['conversation'] ?? '';

$api_key = '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';
$headers = [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $api_key
];

$openai_url = 'https://api.openai.com/v1/chat/gpt-4/completions';

$formatted_prompt = "You are a helpful assistant.\n\nUser: " . $conversation . "\nUser: " . $user_message . "\nAssistant:";

$data = [
    'prompt' => $formatted_prompt,
    'max_tokens' => 150,
    'n' => 1,
    'stop' => ["\n"]
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $openai_url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Only add this line if you still have issues with SSL/TLS in your local environment

$response = curl_exec($ch);
$response_data = json_decode($response, true);
curl_close($ch);

if (isset($response_data['choices'][0]['text'])) {
    $bot_message = trim($response_data['choices'][0]['text']);
    echo json_encode(['message' => $bot_message]);
} else {
    if (isset($response_data['error'])) {
        $error_message = $response_data['error']['message'];
        echo json_encode(['error' => "OpenAI API error: $error_message"]);
    } else {
        echo json_encode(['error' => 'Unknown error while processing the API response.']);
    }
}