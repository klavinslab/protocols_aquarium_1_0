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
id_strings = []
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
  id_strings = append(id_strings, output)

  fid = output[:id]
  step
    description: "Label flasks"
    note: "label a flask '%{fid}' "
  end

end

step
  note: "produced %{log_cell_flasks}"
end

step
  description: "add 25ml of LB to each flask"
  note: "go to the media bay and using the steriological pipette, transfer 25ml LB into each flask"
end

step
  description: "Dilute overnights into flasks"
  foreach flask in id_strings 
    check: "Transfer 350  &micro;l of overnight " + to_string(flask[:data][:from]) + "to flask " + to_string(flask[:id])
  end
  note: "By the end of this step each each flask should have gotten 350 &micro;l of overnight culture.  If not make a note here."
end

step
  description: "Incubate flasks"
  foreach flask in id_strings
    bullet: "Place falsk " + to_string(flask[:id]) + " into SI4"
  end
  note: "Place all flasks above into the 30C shaker incubator (SI4)"
end

log
  return: {log_cells: log_cell_flasks}
end


release strains
