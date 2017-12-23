def check_bracket(bracket)
  if $characters.pop() != bracket
    puts "NO"
    exit!
  end
end

$characters = []

for char in ARGV[0].split('')
  case char
    when "(" then $characters.push("(")
    when ")" then check_bracket("(")
    when "{" then $characters.push("{")
    when "}" then check_bracket("{")
    when "[" then $characters.push("[")
    when "]" then check_bracket("[")
  end
end

puts $characters.empty? ? "YES" : "NO"