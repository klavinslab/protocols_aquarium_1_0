argument
  x: sample
end

take
  y = item x
end

produce
  z = 1 "Thing" from y[0]
  release y[0]
end
