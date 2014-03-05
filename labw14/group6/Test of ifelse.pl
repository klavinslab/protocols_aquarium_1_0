argument
  primer1: sample, "Choose the first primer."
end
  
take
  primer_stock1 = item primer1
end

x = "id %{primer1}
if x == 1631
  step
    description: "do this."
  end
else
  step
    description: "abort."
  end
end
