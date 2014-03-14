require "plankton/standard.pl"

argument
  x: generic
  y: generic
end

print("x",x)
print("y",y)

log
  return: { output: { a: x, b: y } }
end
