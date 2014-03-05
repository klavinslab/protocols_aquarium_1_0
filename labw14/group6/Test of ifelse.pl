argument
  primer1: sample, "Choose the first primer."
end
  
take
  primer_stock1 = item primer1
end

if id %{primer1} == 1361
  step
    description: "do this."
  end
else
  step
    description: "abort."
  end
end
