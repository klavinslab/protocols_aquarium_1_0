step
  description: "While loop test"
end
  
A = [ 1, 2, 3 ]
B = [ { x: "A" }, { x: "Y" } ]

a = 0

foreach a in A
  foreach b in B
    c = b[:x]
    step
      description: "In foreach loop"
      note: "a = %{a}, b = %{b}, c = %{c}"  
    end
  end
end

step
   description: "Done"
   note: "a = %{a}"
end
