argument
	e_coli_strains: sample array, "E coli samples you wish to do dilute" # unique list
end

information "Dilute cells and bring them to log phase"

dilution = 1.0/8
total_V = 20 # ml -- too high?

e_V = total_V*dilution # ml;
LB_V = (total_V-e_V)  # ml

sample_count = length(e_coli_strains)
net_volume = sample_count *  total_V
lb_count = 1+net_volume/50 # Bug: will ask for extra lb aliquot if net_volume is a multiple of 50 ml

take
	e_items = item e_coli_strains
	t_tubes = sample_count "20 ml Test Tubes" # -- glask flask?
	LB     = lb_count "50 mL LB liquid aliquot (sterile)"
end

step
	description: "Label test tubes"
	note: "Label each 20 ml test tube from 1-%{sample_count}"
end

i = 0
while i < sample_count
	e = e_coli_strains[i]
	i = i + 1
	step
		description: "Dilute E. coli cells from sample %{e}"
		check: "Add %{LB_V} ml of LB media to test tube %{i} (round to the nearest .1 ml)" # -- large pipetter?
		check: "Add %{e_V} ml of e. coli sample %{e} to test tube %{i}."
		bullet: "You should end up with %{total_V} ml of liquid in the falcon tube"
	end
end

i=0
log_cell_tubes = []
while i < sample_count
	produce
		y = 1 "20 mL Test Tubes" from e_items[i]
		release t_tubes[i]
		location: "B13.425"
		data
			from: e_items[i][:id]
			original_id: e_items[i][:id]
		end
		note: "Incubate tube %{i} for 2 hours in 37°C incubator (B13.425)"
	end
	log_cell_tubes = append(log_cell_tubes, y[:id])
	i = i+1
end
log
	return: {log_cells: log_cell_tubes}
end
release concat(e_items, LB)
