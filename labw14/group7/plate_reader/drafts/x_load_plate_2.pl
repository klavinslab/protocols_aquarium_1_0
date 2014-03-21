argument
  #glucose_media?
  cells_to_assay_in: sample array, "The strains to assay.  4 copies of each strain"
end


step
  description: "This protocol loads the plate reader with the samples to be assayed"
  note: "This is the box of 96 well plates"
  image: "96_well_plate_box"
end
step
  description: "A 96 well plate"
  note: "This is an individual 96 well plate from the box (you will take one of these in the next step)"
  image: "96_well_plate"
end

take
  #DI_water = 1 "DI Water, Sterile"
  cells = item cells_to_assay_in
  media = 1 "30 mL M9 liquid Glucose + amp + kan"
  plate = 1 "96 Well Flat Clear Bottom Plate"
#  antifog = 1 "Antifog Solution"
end


step
  description: "Load the outermost edges of the plate with water"
  note: "This helps prevent evaporation of the samples, which will be in the middle of the plate"
  check: "Pipette 200uL of DI water into the outer edges"
  note: "It can be helpful to have someone hold onto the media tube during this process to warm it up to room temperature"
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
  check: "S1 = Cell culture tube ID %{cell0}"
  check: "S2 = Cell culture tube ID %{cell1}"
  check: "S3 = Cell culture tube ID %{cell2}"
  image: "sample_locations"
end


#step 
#  description: "Fetch defogger solution and aluminium foil"
#  check: "Retrieve the 'Fog Tech anti-fog solution' from location B5.530"
#  image: "anti_fog"
#  check: "Fetch the aluminium foil from location A8.400"
#end
take
  antifog = 1 "Antifog Solution"
  foil = 1 "Aluminum Foil"
end

step
  description: "Wipe down the plate lid with defogger solution"
  note: "This prevents condensation from disrupting the measurements"
  check: "Squirt a small amount of anti-fog solution onto a Kimwipe, and use it to wipe the inside of the lid"
end

step
  description: "Seal the plate"
  check: "Cut out a small (3x3cm) square of aluminum, and fold it over 3~4 times
          to construct a small (3mm thick) shim"
  check: "Insert the small foil shim into the corner of the assay plate,
          and close the lid (This shim will keep the lid from rattling during the run)"
  #TODO: include picture
end

release concat(cells, concat(antifog, foil))
#return statement

step
  description: "Next steps..."
  note: "You should see two jobs in your queue after completing this protocol.
         Be sure to proceed with 'induce_atc_zero.pl' (the first inuction step),
         then 'begin_run.pl' before you dispose of your culure tubes.
         You will have plenty of time to do thisafter you have started you run"
end
