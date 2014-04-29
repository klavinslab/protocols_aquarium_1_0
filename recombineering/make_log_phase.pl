#Author: Chris Takahashi
#input json file should have the following field(s)
#[:logCultures]: the list of strains that diluted into 25ml of culture
#
#eg if 
#  in[:logCultures] = [123,555,555] then three 25ml logphase flasks 
#  will be made one with strain 123 and two with strain 555.

argument
  json_file: string, "path to json parameter file"
end

if json_file==""
  json_file = "recombineering/test.json"
end

input
  ins = json_file
end
strainIDs = ins[:logCultures]

information "Dilute cells and bring them to log phase"

nflasks = length(strainIDs)
take
	strains = item unique(strainIDs)
	flasks = nflasks "125 mL Baffled Flask"
end


step
  description: "Label flasks"
  foreach strain in strainIDs
    bullet: "label a flask 'diluted from %{strain}' "
  end
end

step
  description: "add 25ml of LB to each flask"
  note: "go to the media bay and using the steriological pipette, transfer 25ml LB into each flask"
end

step
	description: "Dilute E. coli cells from each sample"
    foreach strain in unique(strainIDs)
      check: "For each overnight with with ID %{strain} transfer 350 ul to the flask(s) you just labeled 'diluted from %{strain}'"
    end
    note: "By the end of this step each each flask should have gotten 350 ul of overnight culture"
end

ind = 0
log_cell_tubes = []
foreach strain in strains
  produce 
    output = 1 "Overnight suspension" from strain 
    release [flasks[ind]]
    location: "SI4"
  end
  ind = ind+1
  log_cell_tubes = append(log_cell_tubes, output[:id])
end

log
  return: {log_cells: log_cell_tubes}
end


release strains
