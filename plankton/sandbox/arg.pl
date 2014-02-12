argument
  p: sample("Plasmid") array
end

take
  q = 1 "1 L Bottle"
end

i = info("1 L Bottle")

step
  description: "Thanks"
  note: "info = %{i}"
end

release q
