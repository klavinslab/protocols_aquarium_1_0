argument
  #glucose_media?
  cells_to_assay_in: sample("Transformed E coli Strain") array, "The strains to assay.  4 copies of each strain"
end
q = [1,1,1]
take
  #DI_water = 1 "DI Water, Sterile"
  cells = q cells_to_assay_in
  #glucose media
end

step
  description: "This protocol loads the plate reader with the samples to be assayed"
end

step
  description: "Load the outermost edges of the plate with water"
  note: "This helps prevent evaporation of the samples, which will be in the middle of the plate"
  check: "Pipette 200uL of DI water into the outer edges"
  #todo: include a picture of this
end

step
  description: "Load the middle area of the plate with the glucose medium"
  check: "Pipette 200uL of glucose media (prepared earlier) into each open well"
  #TODO: include a picture
end

cell0 = cells[0]
cell1 = cells[1]
cell2 = cells[2]
step
  description: "Load the cells into the wells"
  check: "Load the cells according to the chart"
  note: "%{cell0}: R1 => A; R2 => B; R3 => C; R4 => D"
  note: "%{cell1}: R1 => E; R2 => F; R3 => G; R4 => H"
  note: "%{cell2}: R1 => I; R2 => J; R3 => K; R4 => L"
  #todo: include chart
  #todo: identify which cells correspond to which type.  Generalize.
end


#return statement

