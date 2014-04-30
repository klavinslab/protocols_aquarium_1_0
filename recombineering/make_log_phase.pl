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

ind = 0
log_cell_flasks = []
foreach strain in strains
  sid = strain[:id]
  produce silently
    output = 1 "Overnight suspension" from strain 
    release [flasks[ind]]
    location: "SI4"
    data
      from: sid
    end
  end
  ind = ind+1
  log_cell_flasks = append(log_cell_flasks, output[:id])

  fid = output[:id]
  step
    description: "Label flasks"
    note: "label a flask '%{fid}' "
  end

end

step
  description: "add 25ml of LB to each flask"
  note: "go to the media bay and using the steriological pipette, transfer 25ml LB into each flask"
end

step
  foreach flask in log_cell_flasks
    fid = flask[:id]
    sourceID = flask[:data][:from]
    check: "Transfer 350 &micro;l of overnight %{sourceID} to flask %{fid}"
  end
  note: "By the end of this step each each flask should have gotten 350 ul of overnight culture.  If not make a note here."
end

####
if 0

step
	description: "Dilute E. coli cells from each sample"
    foreach strain in unique(strainIDs)
      check: "For each overnight with with ID %{strain} transfer 350 ul to the flask(s) you just labeled 'diluted from %{strain}'"
    end
    note: "By the end of this step each each flask should have gotten 350 ul of overnight culture"
end


ind = 0
log_cell_flasks = []
foreach strain in strains
  sid = strain[:id]
  produce 
    output = 1 "Overnight suspension" from strain 
    note: "Tape over or cross out your old label 'diluted from %{sid}' and replace it with the item number above"
    warning: "The flask you are labeling should be the one you previously labeled 'diluted from %{sid}'"
    release [flasks[ind]]
    location: "SI4"
  end
  ind = ind+1
  log_cell_flasks = append(log_cell_flasks, output[:id])
end

end
####
step
  description: "Incubate flasks"
  foreach flask in log_cell_flasks
    fid = flask[:id]
    bullet: "Place falsk %{fid} into SI4"
  end
  note: "Place all flasks above into the 30C shaker incubator (SI4)"
end

log
  return: {log_cells: log_cell_flasks}
end


release strains
