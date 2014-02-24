argument
	e_coli_strains: sample array, "E coli samples you wish to do dilute" # unique list
end

information "Dilute cells and bring them to log phase"

dilution = 1.0/8
total_V = 20 # ml

e_V = total_V*dilution*1000.0 # ul;
LB_V = (total_V-e_V/1000.0)  # ml

sample_count = length(e_coli_strains)
net_volume = sample_count *  total_V
lb_count = 1+net_volume/50 # Bug: will ask for extra lb aliquot if net_volume is a multiple of 50 ml

take
	e_items = item e_coli_strains
	t_tubes = sample_count "50 ml Falcon Tube"
	LB     = lb_count "50 mL LB liquid aliquot (sterile)"
end

step
	description: "Label falcon tubes"
	note: "Label each 50 ml falcon tube from 1-%{sample_count}"
end

i = 0
while i < sample_count
	e = e_coli_strains[i]
	i = i + 1
	step
		description: "Dilute E. coli cells from sample %{e}"
		check: "Add %{LB_V} ml of LB media to falcon tube %{i} (round to the nearest .1 ml)"
		check: "Add %{e_V} ul of e. coli sample %{e} to falcon tube %{i}."
		bullet: "You should end up with %{total_V} ml of liquid in the falcon tube"
	end
end

i=0
log_cell_tubes = []
while i < sample_count
	produce
		y = 1 "log cells" from e_items[i]
		release t_tubes[i]
		location: "B14.310"
		data
			from: e_items[i][:id]
			original_id: e_items[i][:id]
		end
		note: "Incubate tube %{i} for 2 hours in 37°C incubator (B14.310)"
	end
	log_cell_tubes = concat(log_cell_tubes, y)
	i = i+1
end
log
	return: {log_cells: log_cell_tubes}
end
release append(e_items, LB)
