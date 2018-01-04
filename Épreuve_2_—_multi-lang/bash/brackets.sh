#!/bin/bash
OPEN_BRACKETS=('(' '{' '[')
CLOSE_BRACKETS=(')' '}' ']')

indexOf() {
	array=("$@")
	stop=1
	for (( i = 1; i < 4 && ${stop} != 0; i++ )); do
		if [[ ${array[i]} == ${array[0]} ]]; then
			echo ${i}
			stop=0
		fi
	done
	if [[ ${stop} == 1 ]]; then
		echo -1
	fi
}

checkBrackets() {
	array=("$@")
	openBrackets=('')
	openCursor=0
	closeBrackets=('')
	closeCursor=1023

	for (( i = 1; i <= ${array[0]}; i++ )); do
		openIndex=$(indexOf "${array[i]}" "${OPEN_BRACKETS[@]}")
		closeIndex=$(indexOf "${array[i]}" "${CLOSE_BRACKETS[@]}")
		if [[ ${openIndex} != -1 ]]; then
			openBrackets[${openCursor}]=$array[i]
			let "openCursor++"
		elif [[ ${closeIndex} != -1 ]]; then
			let "closeCursor--"
			closeBrackets[$closeCursor]=$array[i]
		fi
	done

	stop=1
	let "test = 1023 - openCursor"
	if [[ ${test} != ${closeCursor} ]]; then
		echo "NO"
		stop=0
	fi

	for (( i = 0; i < ${openCursor} && ${stop} != 0 ; i++ )); do
		openIndex=$(indexOf "${openBrackets[i]}" "${OPEN_BRACKETS[@]}")
		if [[ ${openIndex} != -1 ]]; then
			if [[ ${closeBrackets[closeCursor]} != ${CLOSE_BRACKETS[openIndex]} ]]; then
				echo "NO"
				stop=0
			fi
			let "closeCursor++"
		fi
	done
	if [[ ${stop} == 1 ]]; then
		echo "YES"
	fi
}

# test avec la chaîne « (] »
# problème -> réponse = YES
table=('(' ']')
result=$(checkBrackets '2' "${table[@]}")
echo $result
