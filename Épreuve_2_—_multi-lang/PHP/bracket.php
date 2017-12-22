<?php

$characters = [];
$chars = str_split($argv[1]);

foreach($chars as $char) {
	switch($char) {
		case '(':
			array_push($characters, '(');
			break;
		case ')':
			checkBracket('(');
			break;
		case '{':
			array_push($characters, '{');
			break;
		case '}':
			checkBracket('{');
			break;
		case '[':
			array_push($characters, '[');
			break;
		case ']':
			checkBracket('[');
			break;	
	}
}

if (empty($characters)) {
	echo "YES";
} else {
	echo "NO";
}

function checkBracket($bracket) {
	global $characters;
	if (array_pop($characters) != $bracket) {
		echo "NO";
		exit(0);
	}
}