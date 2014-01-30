argument
  Transformed_E_coli_Strain_id: sample, "Choose the overnight suspension culture you incubated yesterday"
end

step
  description: 
    "This protocol describes how to create a long-lasting glycerol stock from an overnight colony suspension"
end

take
  cells_to_store = item Transformed_E_coli_Strain_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = 1 "Cryo Tube"
end

step
  description: "Label the sterile cryo tube with your initials AND date"
  note: "Place the tube in a test tube rack.  This tube will be stored in the -80C Freezer."
  #Want to label this tube with a number now
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
end

produce
  s = 1 "Transformed E coli Glycerol Stock" from sterile_tube[0]
end


release concat(cells_to_store, glycerol)
