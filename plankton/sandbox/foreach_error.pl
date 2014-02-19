step
  description: "What to expect"
  note: "This protocol should raise an exception because the variable x is defined in the
         scope of the while loop and so later reference to it doesn't work."
end

A = [ 1, 2, 3 ]

foreach a in A
  x = x + a
end

step
  description: "x = %{x}"
end

