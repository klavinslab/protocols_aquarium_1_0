mystring = "Hello World!"

step
  description: "The message below should be 'Hello World!'"
  note: "%{mystring}"
end

substring = mystring[2..6]


# This doesn't work! Produces blank line. Should substrings be evaluated like ruby expressions?
step
  description: "The message below should be 'World!'"
  note: "%{substring}"
end
