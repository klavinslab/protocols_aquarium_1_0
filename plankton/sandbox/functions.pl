function g(n)

  if n > 0
    return n*g(n-1)
  else
    return 1
  end

end

x = g(5)

step
 description: "After calling g: x = %{x}"
end

