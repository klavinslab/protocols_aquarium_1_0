#Author: Chris Takahashi
#input json file should have the following field(s)
#input[:logCultures]: the list of strains that diluted into 25ml of culture
#
#eg if 
#  input[:logCultures] = [123,555,555] then three 25ml logphase flasks 
#  will be made one with strain 123 and two with strain 555.

argument
  json_file: string "path to json parameter file"
end

if json_file=""
  json_file = "recombineering/test.json"
end

information "Dilute cells and bring them to log phase"

take
	strains = item unique(strainIDs)
end

nstrains = length(unique(strains))

#count how any of each strain
strainCounts = {}
foreach strain in unique(strains)
  strainCounts[strain]=0
end
foreach strain in unique(strains)
  strainCounts[strain]=strainCounts[strain]+1
end

#count how many flasks we need
#each flask can hold 25ml ~= 6 4ml cultures
flaskCounts = {}
nflasks = 0
foreach strain in unique(strains)
  flaskCounts[strain] = ceil(strainCounts[strain]/6.0)
  nflasks = nflasks+ flaskCounts[strain]
end

take
	flasks = nflasks "125 mL Baffled Flask"
end


#TODO: move this loop inside step
foreach strain in unique(strains)
  n_f = flaskCounts[strain]
  strain_id = strain[:id]
  step
	  description: "Label flasks"
    bullet: "label %{n_f} flask(s) 'diluted from %{strain_id}' "
  end
end

step
  description: "add 25ml of LB to each flask"
  note: "go to the media bay and using the steriological pipette, transfer 25ml LB into each flask"
end

#TODO: move into step
  foreach strain in unique(strains)
step
	description: "Dilute E. coli cells from each sample"
    check: "transfer 35ul from the tube %{strain} to the flask you just labeled 'diluted from %{strain}'"
end
  end

foreach strain in unique(strains)
  produce 
    output = flaskCounts[strain] "Overnight suspension" from strain 
  end
end

#i=0
#log_cell_tubes = []
#while i < sample_count
#	produce
#		y = 1 "20 mL Test Tubes" from e_items[i]
#		release t_tubes[i]
#		location: "B13.125"
#		data
#			from: e_items[i][:id]
#			original_id: e_items[i][:id]
#		end
#		note: "Incubate tube %{i} for 2 hours in 30°C incubator (B13.125)"
#	end
#	log_cell_tubes = append(log_cell_tubes, y[:id])
#	i = i+1
#end
#log
#	return: {log_cells: log_cell_tubes}
#end
release strains
