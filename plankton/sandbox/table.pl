step
  description: "A table should appear on this page"
  note: "Put the number of microliters specified in each tube"
  table: [
      [ "", "A", "B", "C" ], 
      [ "X", 1, 2, 3 ],
      [ "Y", 2, 3, 4 ],
      [ "Z", 4, 5, 6 ]
    ]
  warning: "Be careful"
end

L = [ "a", "b" ]
M = [ 1, 2, 3 ]

step
  foreach i in L
    foreach j in M
      check: "Do something to the tube labeled %{i}%{j}"
    end
  end
end
