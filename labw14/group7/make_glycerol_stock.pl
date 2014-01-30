argument
  Transformed_E_coli_Strain_id: sample, "Choose the overnight suspension culture you incubated yesterday"
end

take
  cells_to_store = item Transformed_E_coli_Strain_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = 1 "Vryo Tube"
end

step
  description: 
    "This protocol describes how to create a long-lasting glycerol stock from an overnight colony suspension"
end

step
  description: "Label a sterile tube with your initials AND date"
  note: "Place the tube in a test tube rack.\n
  This tube will be stored in the -80C Freezer."
end

step
  description: "Pipette 900ul of glycerol into the sterile tube"
  note: "Be careful not to contaminate the glycerol bottle.  Use the 1000 μL pipetter."
  note: "Next: Pipette 900ul of cell suspension into the sterile tube"
end

step
  description: "Pipette 900ul of cell suspension into the sterile tube"
  note: "Next: Vortex the sample for 15s on high power."
end

step
  description: "Vortex the sample"
  note: "Use the more powerful VWR analog vortex mixer at speed 10"
  note: "Next: Store the sample in the -80C fridge"

produce
  s = 1 "Overnight suspension culture" from cells_to_store[0]
  note: "Place in -80 degree freezer, at location:"
  location: "Bench"
end

step
  description: "Return all equipment"
  check: "Return test tube rack to Bench"
end

release concat(cells_to_store, glycerol)
