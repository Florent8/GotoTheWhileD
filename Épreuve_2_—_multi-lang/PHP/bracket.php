<?php

$characters = [];
$chars = str_split($argv[1]);
$openBrackets = ['(', '{', '['];
$closeBrackets = [')', '}', ']'];

foreach($chars as $char) {
	if (in_array($char, $openBrackets)) {
		array_push($characters, $char);
	} else if (in_array($char, $closeBrackets)) {
		checkBracket($openBrackets[array_keys($closeBrackets, $char)[0]]);
	}
}

echo empty($characters) ? "YES" : "NO";

function checkBracket($bracket) {
	global $characters;
	if (array_pop($characters) != $bracket) {
		echo "NO";
		exit(0);
	}
}