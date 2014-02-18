argument
	e_coli_strains: sample array, "E coli samples you wish to do dilute"
end

information "Dilute cells and bring them to log phase"

dilution = 1.0/1000
total_V = 10.0 # ml

e_V = total_V*dilution*1000.0 # ul;
LB_V = (total_V-e_V/1000.0)  # ml

sample_count = length(e_coli_strains)
net_volume = sample_count *  total_V
lb_count = 1 # How to implement multiple aliquot count? 1+(net_volume-(net_volume%50))/50

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

step
	description: "Incubate 50 ml falcon tubes for 2 hours in 37°C incubator (B14.310)"
end

produce
	y = sample_count "log cells"
	release t_tubes
end
log
	return: {log_cells: y}
end
release concat(e_items, LB)
