
dilution = 1.0/71
total_V = 18 # ml -- too high?

e_V = total_V*dilution # ml;
LB_V = (total_V-e_V) # ml

step
  description: "Hello"
  note: "dilution = %{dilution}"
  note: "e_V = %{e_V}"
  note: "LB_v = %{LB_V}"
end
