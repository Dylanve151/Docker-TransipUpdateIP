<?php

/**
 * This is an example on how to update a single existing DNS entry for a specific domain
 */

use Transip\Api\Library\Entity\Domain\DnsEntry;

require_once (__DIR__ . '/Authenticate.php');

$domainName = trim(file_get_contents("/verbs/domainName"));

$dnsEntryNames = trim(file_get_contents("/verbs/dnsEntryNames"));
$dnsEntryExpire = trim(file_get_contents("/verbs/dnsEntryExpire"));
$dnsEntryType = trim(file_get_contents("/verbs/dnsEntryType"));

$prev_publicIP = trim(file_get_contents("/verbs/prev_publicIP"));
$new_publicIP = trim(file_get_contents("http://checkip.amazonaws.com/"));

if($publicIP <> $prev_publicIP) {
	foreach($dnsEntryNames as &$dnsEntryName) {
        // Create a DNS entry object
        $dnsEntry = new DnsEntry();
        $dnsEntry->setName($dnsEntryName);
        $dnsEntry->setExpire($dnsEntryExpire);
        $dnsEntry->setType($dnsEntryType);
        $dnsEntry->setContent($new_publicIP);

        // Apply entry
        $api->domainDns()->updateEntry($domainName, $dnsEntry);
	}
	unset($dnsEntryName);
        file_put_contents("/verbs/prev_publicIP", $new_publicIP);
}
