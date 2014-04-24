argument
	e_coli_strains: sample array, "E coli samples you wish to do dilute" # unique list
end
unique_e_coli_strains = unique(e_coli_strains)

information "Dilute cells and bring them to log phase"

dilution = 1.0/71
total_V = 18 # ml -- too high?

e_V_ml = (total_V*dilution)  # ml;
e_V_micro = ceil(e_V_ml * 1000) # uL
LB_V = floor( (total_V-e_V_ml) * 10) / 10.0 # ml

sample_count = length(unique_e_coli_strains)
net_volume = sample_count *  total_V
lb_count = 1+net_volume/50 # Bug: will ask for extra lb aliquot if net_volume is a multiple of 50 ml

take
	e_items = item unique_e_coli_strains
	t_tubes = sample_count "250 mL Baffled Flask" # -- glass flask?
	LB     = lb_count "50 mL LB liquid aliquot (sterile)"
end

step
	description: "Label test tubes"
	note: "Label each flask from 1-%{sample_count}"
end

i = 0
while i < sample_count
	e = unique_e_coli_strains[i]
	i = i + 1
	step
		description: "Dilute E. coli cells from sample %{e}"
		check: "Add %{LB_V} ml of LB media to flask %{i}" # -- large pipette?
		check: "Add %{e_V_micro} μl of e. coli sample %{e} to flask %{i}"
		bullet: "You should end up with approximately %{total_V} ml of liquid in the test tube"
	end
end

i=0
log_cell_tubes = []
while i < sample_count
  tube_no = i+1
	produce
		y = 1 "250 mL Baffled Flask" from e_items[i]
		release t_tubes[i]
		location: "B13.125"
		data
			from: e_items[i][:id]
			original_id: e_items[i][:id]
		end
		note: "Incubate tube %{tube_no} for 2 hours in 30°C incubator (B13.125)"
	end
	log_cell_tubes = append(log_cell_tubes, y[:id])
	i = i+1
end
log
	return: {log_cells: log_cell_tubes}
end
release concat(e_items, LB)
