function g(n)

  local a = 0

  if n > 0
    a = n*g(n-1)
  else
    a = 1
  end

  return a

end

x = g(5)

step
 description: "After calling g: x = %{x}"
end

