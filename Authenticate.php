<?php

use \Transip\Api\Library\TransipAPI;

require_once(__DIR__ . '/vendor/autoload.php');

// Your login name on the TransIP website.
$login = trim(file_get_contents("/verbs/TransipUsername"));

// If the generated token should only be usable by whitelisted IP addresses in your Controlpanel
$generateWhitelistOnlyTokens = trim(file_get_contents("/verbs/WhitelistIPonly"));

// One of your private keys; these can be requested via your Controlpanel
$privateKey = trim(file_get_contents("/verbs/PrivateKey"));

$api = new TransipAPI(
       $login,
       $privateKey,
       $generateWhitelistOnlyTokens
);// Set all generated tokens to read only mode (optional)$api->setReadOnlyMode(false);

// Create a test connection to the api
//$response = $api->test()->test();
//
//if ($response === true) {
//   echo 'API connection successful!';
//}
