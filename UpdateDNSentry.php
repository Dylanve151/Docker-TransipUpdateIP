<?php

/**
 * This is an example on how to update a single existing DNS entry for a specific domain
 */

use Transip\Api\Library\Entity\Domain\DnsEntry;

require_once (__DIR__ . '/Authenticate.php');

$domainName=$argv[1];

$dnsEntryName=$argv[2];
$dnsEntryExpire=$argv[3];
$dnsEntryType=$argv[4];
$dnsEntryValue=$argv[5];

//$domainName = trim(file_get_contents("/verbs/domainName"));

//$dnsEntryNames = explode(',',trim(file_get_contents("/verbs/dnsEntryNames")));
//$dnsEntryExpire = trim(file_get_contents("/verbs/dnsEntryExpire"));
//$dnsEntryType = trim(file_get_contents("/verbs/dnsEntryType"));

//$prev_publicIP = trim(file_get_contents("/verbs/prev_publicIP"));
//$publicIP = trim(file_get_contents("http://checkip.amazonaws.com/"));

$dnsEntry = new DnsEntry();
$dnsEntry->setName($dnsEntryName);
$dnsEntry->setExpire($dnsEntryExpire);
$dnsEntry->setType($dnsEntryType);
$dnsEntry->setContent($publicIP);

$api->domainDns()->updateEntry($domainName, $dnsEntry);
