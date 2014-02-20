argument
  plated_cells: sample("Transformed E coli Strain") array, "An array of THREE agarose-streaked colonies to grow in glucose media"
end #note that 'plated_cells' is an array of integers, representing sample ID numbers

step
  description: "This protocol will grow multiple cell cultures in glucose."
end

strains = length(plated_cells)
n = strains * 4 #this could be "repeats"


take
  note: "Be sure to grab a tube rack to hold all of the culture tubes"
  plate_array = item plated_cells
  culture_tubes = n "14 mL Test Tube"
  media_tubes = 2 "30 mL M9 liquid Glucose + amp + kan"
  pipette = 1 "Serological Pipette"
  tip = 1 "5 mL Serological Pipette Tips"
end

incubated_cells = []#a sample reference array of culture tubes to be incubated 
return_array = []#an array of id numbers for each culture tube sample
i = 0
while i<strains
  id = plated_cells[i]
  a = []
  produce
    a = 1 "Overnight suspension culture" of plate_array[i]
    new_id = a[0]
    note: "Label a set of 4 culture tubes with '%{new_id} R1', '%{new_id} R2', '%{new_id} R3', and '%{new_id} R4'. This set of tubes will contain cells from %{id}."
    location: "Bench"
  end
  i = i + 1
  incubated_cells = append(incubated_cells, a)
  return_array = append(return_array, a[:id])
end

step
  description: "Add 3mL media to each culture tube"
  check: "Use the electric serological pipette to add 3ml of the previously prepared antibiotic media to each culture tube."
  check: "Dispose of your serological pipette tip in tip waste"
end

release [pipette[0]]

i = 0
while i<strains
  id = plated_cells[i]
  new_id = return_array[i]
  step
    description: "Add cells from plate %{id} to four seperate culture tubes"
    check: "Clean your gloves with ethanol to avoid contamination"
    check: "Use a 100uL pipette tip (held in your hand) to extract cells from a single colony from plate %{id}.  Drop the whole tip into the culture tube marked '%{new_id} R1'"
    check: "Use a new 100uL pipette tip extract cells from a different single colony from the same plate, and drop the whole tip into the culture tube labeled '%{new_id} R2'"
    check: "Repeat the above procedure for '%{new_id} R3' and '%{new_id} R4'."
  end
end

step
  description: "Place the tubes in the 37C shaker"
  note: "You should now have a tube rack containing 4 repeats of each cell colony, in a total of %{n} culture tubes" 
  check: "Load the %{n} cell culture tubes into the 37C shaker."
  note: "This will incubate for 18hrs (overnight)"
end

i=0
while i<length(incubated_cells)
  modify
    incubated_cells[i]
    location: "B13.425 37C Shaker" 
  end
  i=i+1
end

release concat(plate_array, media_tubes)

log
  return: { incubated_cells_id: return_array}
end


