import sys

def checkBracket(bracket):
	if characters.pop() != bracket:
		print("NO")
		sys.exit(0)

characters = []
chars = sys.argv[1]

for char in chars:
	if char == "(":
		characters.append("(")
	elif char == ")":
		checkBracket("(")
	elif char == "{":
		characters.append("{")
	elif char == "}":
		checkBracket("{")
	elif char == "[":
		characters.append("[")
	elif char == "]":
		checkBracket("[")

if not characters:
	print("YES")
else:
	print("NO")