dilution = 1.0/71
total_V = 18 # ml -- too high?

e_V = total_V*dilution # ml;
LB_V = (total_V-e_V) # ml
lb_round = floor((LB_V * 10)) /10

e_V_micro = floor(e_V * 1000) /1000 # in uL

step
  description: "Hello"
  note: "dilution = %{dilution}"
  note: "e_V = %{e_V}"
  note: "e_V_micro = %{e_V_micro}"
  note: "LB_v = %{lb_round}"
end
