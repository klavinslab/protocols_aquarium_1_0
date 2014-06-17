function g(x)
  return x
end

function f()

  a = 0

  if false
    a = g(1)
  elsif false
    a = g(2)
  else
    a = g(3)
  end

  return a

end

x = f()

step
  description: "Done: x=%{x}"
end
