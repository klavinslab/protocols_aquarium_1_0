step
  description: "About to produce an item"
end

produce silently
  x = 1 "Primer Aliquot" of "IAA1-Nat-F"
end

step
  description: "Done"
  note: "x = %{x}"
end
