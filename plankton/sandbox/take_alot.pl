argument
  s: sample array
  t: sample
  o: object
end

take
  note: "Put the items on your workbench, with sample tubes placed in a test tube rack."
  x = item s
  y = item t
  z = 1 o 
end

step
  description: "Results"
  note: "x = %{x}"
  note: "y = %{y}"
  note: "z = %{z}"
end

release concat(concat(x, y), z)
