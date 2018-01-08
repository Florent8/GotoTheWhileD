let http = require('http');

let server = http.createServer(function(req, res) {
	let chars = process.argv[2].split('')
  	let characters = []
	let openBrackets = ['(', '{', '[']
	let closeBrackets = [')', '}', ']']

	chars.forEach((char) => {
		if (openBrackets.indexOf(char) !== -1) {
			characters.push(char)
		} else if (closeBrackets.indexOf(char) !== -1) {
			checkBracket(openBrackets[closeBrackets.indexOf(char)])
		}
	})

	console.log(characters.length === 0 ? "YES" : "NO")
	res.writeHead(200);
	res.end(characters.length === 0 ? "YES" : "NO")
	process.exit(0)

	function checkBracket(bracket) {
		if (characters.pop() != bracket) {
			console.log("NO")
			res.end("NO")
			process.exit(1)
		}
	}
});

server.listen(8000);