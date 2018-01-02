import sys

def checkBracket(bracket):
	if characters.pop() != bracket:
		print("NO")
		sys.exit(0)

characters = []
chars = sys.argv[1]
openBrackets = ['(', '{', '[']
closeBrackets = [')', '}', ']']

for char in chars:
	if char in openBrackets:
		characters.append(char)
	elif char in closeBrackets:
		checkBracket(openBrackets[closeBrackets.index(char)])

if not characters:
	print("YES")
else:
	print("NO")