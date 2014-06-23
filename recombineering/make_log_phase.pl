#Author: Chris Takahashi
#input json file should have the following field(s)
#[:logCultures]: the list of strains that diluted into 25ml of culture
#
#eg if 
#  in[:logCultures] = [123,555,555] then three 25ml logphase flasks 
#  will be made one with strain 123 and two with strain 555.

argument
  params: generic, "task we're running"
end

strainIDs = params[:logCultures]
#TODO: remove logCultures field and instead count from strains field

information "Dilute cells and bring them to log phase"

nflasks = length(strainIDs)
take
	strains = item unique(strainIDs)
	flasks = nflasks "250 mL Baffled Flask"
end

ind = 0
log_cell_flasks = []
produced_flasks = []
log_ids = []
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
  produced_flasks = append(produced_flasks, output)

  fid = output[:id]
  fids = append(fids,fid)
end

step
  description: "Label flasks"
  foreach f in fids
    check: "label a flask '%{f}' "
  end
end

step
  description: "add 25ml of LB to each flask"
  note: "go to the media bay and using the steriological pipette, transfer 25ml LB into each flask"
end

step
  description: "Dilute overnights into flasks"
  foreach flask in produced_flasks 
    check: "Transfer 350  &micro;L of overnight " + to_string(flask[:data][:from]) + " to flask " + to_string(flask[:id])
  end
  note: "By the end of this step each each flask should have gotten 350 &micro;l of overnight culture.  If not make a note here."
end

step
  description: "Incubate flasks"
  foreach flask in produced_flasks
    bullet: "Place falsk " + to_string(flask[:id]) + " into SI4"
  end
  note: "Place all flasks above into the 30C shaker incubator (SI4)"
end

step
  description: "Prepare a heat bath"
  bullet: "Locate and plug in the hot water bath."
  bullet: "Press the button on the left labled 'I/O' to turn on the controller."
  bullet: "Set the middle temperature to 42 C"
  note: "Press the refresh button until a flashing tempurature appears and the leftmost thermometer is illumminated."
  note: "Use the up and down arrows to set the tempurature of the heat bath to 42 C."
  image: "heat_bath"
end

step
  description: "Prepare the centrifuges"
  note: "Find both the large centrifuge C3 at B15.410 and the smaller centrifuge C2 at B5.335 and adjust the temperature setings to 4C.  Make sure the lids are closed when you're done as they won't refrigerate when open."
end

log
  return: {log_cells: log_cell_flasks}
end


release strains
