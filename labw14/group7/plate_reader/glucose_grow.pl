argument
  plated_cells: sample("Transformed E coli Strain") array, "An array of THREE agarose-streaked colonies to grow in glucose media"
  #media_label: string, "The label on the tube of media prepared previously, which will be used to grow the cells in"
  #repeats: num, "The number of repeats of each cell culture to grow"
  #We tried to make this a more generalized protocol, but the (lack of) capabilities in the language defeated us!
end

step
  description: "This protocol will grow multiple cell cultures in glucose."
end

strains = length(plated_cells)
n = strains * 4 #this could be "repeats"


take
  culture_tubes = n "14 mL Test Tube"
  note: "Be sure to grab a tube rack to hold all of the culture tubes"
end

#i = 0
#while i<strains
  #id = plated_cells[i]
  step
    description: "Label culture tubes"
    note: "You will need 12 tubes in total: 4 repetitions for each of 3 strains"
    check: "Label a set of 4 culture tubes with 'R1', 'R2', 'R3', 'R4'"
    check: "Label another set of 4 culture tubes with 'R1', 'R2', 'R3', 'R4'"
    check: "Label a final set of 4 culture tubes with 'R1', 'R2', 'R3', 'R4'"
    note: "Keep the sets separate"
  end
 # i = i + 1
#end

take
  pipette = 1 "Serological Pipette"
  tip = 1 "5 mL Serological Pipette Tips"
end

step
  description: "Add 3mL media to each culture tube"
  check: "Use the electric serological pipette to add 3ml of the previously prepared antibiotic media to each culture tube."
  check: "Dispose of your serological pipette tip in tip waste"
end

release [pipette[0]]

take
  plate_array = item plated_cells
end

incubated_cells = []
return_array = []
i = 0
while i<strains
  id = plated_cells[i]
  step
    description: "Add cells from plate %{id} to four seperate culture tubes"
    check: "Use a 100uL pipette tip (held in your hand) to extract a single colony from plate %{id}, and swish it around in the culture tube marked 'R1'"
    check: "Use a new 100uL pipette tip extract another single colony from the same plate, and swirl it around in the culture tube labeled 'R2'"
    check: "Repeat the above procedure for R3 and R4."
#TODO: Repace the above code with something more modular, based on an arbitrary number of cycles and strains
  end
  
  a = []
  produce
    a = 1 "Overnight suspension culture" from plate_array[i]
    note: "This item refers to all 4 copies of the cells from %{id}. Label them all with this number"
    location: "Bench"
  end
  i = i + 1
  incubated_cells = append(incubated_cells, a)
  return_array = append(return_array, a[:id])
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
    location: "B13.425 37C Shaker" #TODO: get address
  end
  i=i+1
end

release plate_array

#TODO: Figure out how to release an array of samples
#add log -> return to provide an array of culture tubes for the metacol
log
  return: { incubated_cells_id: return_array}
end


