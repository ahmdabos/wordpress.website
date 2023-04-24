
<?php

header("Access-Control-Allow-Origin: *");

$api_key = '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';
$url = "https://api.openai.com/v1/engine/davinci/completions";
if(isset($_POST['prompt'])) {
    $prompt = $_POST['prompt'];
    $data = array(
        'prompt' => $prompt,
        'temperature' => 0.5,
        'max_tokens' => 200,
    );
    $data_json = json_encode($data);
    $api_key = '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';
    $url = "https://api.openai.com/v1/engine/davinci/completions";
    $headers = array(
        'Content-Type: application/json',
        'Authorization: Bearer ' . $api_key,
    );
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_json);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    $response = curl_exec($ch);
    curl_close($ch);
    $result = json_decode($response);
    if(isset($result->choices[0]->text)) {
        $completion = $result->choices[0]->text;
        echo $completion;
    } else {
        echo "Error: Unable to generate text completion.";
    }
}