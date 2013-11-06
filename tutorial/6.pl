argument
  x: sample, "A Sample"
  y: object, "A container for the sample you will produce"
end

step
  description: "x = %{x} and y = %{y}"
end

take
  my_items = item x
end 

step
  description: "my_items = %{my_items}"
end

step
  description: "Enter a number"
  getdata
    z: number, "A number"
  end
end

produce
  r = 1 y from my_items[0]
  data
    datum: z
  end
end

release my_items

log
  return: r
end
