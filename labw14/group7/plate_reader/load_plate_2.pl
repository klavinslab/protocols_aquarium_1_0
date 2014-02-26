argument
  #glucose_media?
  cells_to_assay_in: sample array, "The strains to assay.  4 copies of each strain"
end

take
  #DI_water = 1 "DI Water, Sterile"
  
  cells = item cells_to_assay_in
  media = 1 "30 mL M9 liquid Glucose + amp + kan"
end

step
  description: "This protocol loads the plate reader with the samples to be assayed"
end

step
  description: "Load the outermost edges of the plate with water"
  note: "This helps prevent evaporation of the samples, which will be in the middle of the plate"
  check: "Pipette 200uL of DI water into the outer edges"
  image: "plate_water"
end

step
  description: "Load the middle area of the plate with the glucose medium"
  check: "Pipette 200uL of glucose media (prepared earlier) into each open well"
  image: "plate_media"
end

cell0 = cells[0][:id]
cell1 = cells[1][:id]
cell2 = cells[2][:id]
step
  description: "Load the cells into the wells"
  note: "Load the cells according to the chart"
  check: "%{cell0}:   R1 => A;  R2 => B;  R3 => C;  R4 => D"
  check: "%{cell1}:   R1 => E;  R2 => F;  R3 => G;  R4 => H"
  check: "%{cell2}:   R1 => I;  R2 => J;  R3 => K;  R4 => L"
  image: "sample_locations"
end


step 
  description: "Fetch defogger solution and aluminium foil"
  check: "Retrieve the 'Fog Tech anti-fog solution' from location B5.530"
end

step
  description: "Wipe down the plate lid with defogger solution"
  note: "This prevents condensation from disrupting the measurements"
  check: "Squirt a small amount of anti-fog solution onto a Kimwipe, and use it to wipe the inside of the lid"
end

step
  description: "Seal the plate"
  check: "Retrieve a box of aluminum foil from location A8.400"
  check: "Cut out a small (3x3cm) square of aluminum, and fold it over 3~4 times to construct a small (3mm thick) shim"
  check: "Return the aluminium foil to location A8.400"
  check: "Insert the small foil shim into the corner of the assay plate, and close the lid (This shim will keep the lid from rattling during the run)"
  #TODO: include picture
end

release cells
#return statement

