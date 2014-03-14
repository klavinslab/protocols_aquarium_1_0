require "plankton/standard.pl"

argument
  x: number array
end

print("x[:a][0]",x[:a][0])

log
  return: x
end
