argument
  suspension_array: sample array, "Choose the overnight suspension culture you incubated yesterday"
end

step
  description: 
    "This protocol describes how to create a long-lasting glycerol stock from an overnight colony suspension"
end

n = length(suspension_array)

take
  cells_to_store_array = item suspension_array
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = n "Cryo Tube"
end

step
  description: "Label the sterile cryo tube with your initials AND date"
  note: "Place the tube in a test tube rack.  This tube will be stored in the -80C Freezer."
end

whil i < n 
  id = suspension_array[i]
  step
    description: "Pipette the glycerol and cell suspension into the sterile tube, then vortex it"
    note: "Be careful not to contaminate the glycerol bottle.  Use the 1000 μL pipetter."
    check: "Pipette 900ul of glycerol into the sterile tube"
    check: "Pipette 900ul of cell suspension into the sterile tube"
    check: "Next: Vortex the sample for 15s on high power. Use the more powerful VWR analog vortex mixer at speed 10"
  end

  produce
    s = 1 "Transformed E coli Glycerol Stock" from cells_to_store_array[i]
    note: "Be sure to add your intials and todays date as well as the item id"
  end
  i = i+1
end


release concat(cells_to_store_array, glycerol)
