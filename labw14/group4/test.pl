dilution = 1.0/71
total_V = 18 # ml -- too high?

e_V_ml = (total_V*dilution)  # ml;
e_V_ul = ceil(e_V_ml * 1000) # uL
LB_V = floor( (total_V-e_V) * 10) / 10.0 # ml

step
		description: "Dilute E. coli cells from sample %{e}"
		check: "Add %{LB_V} ml of LB media to test tube %{i} (round to the nearest .1 ml)" # -- large pipette?
		check: "Add %{e_V_ul} μl of e. coli sample %{e} to test tube %{i}."
		bullet: "You should end up with %{total_V} ml of liquid in the test tube"
	end
