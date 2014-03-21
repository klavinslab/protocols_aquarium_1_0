argument
  #glucose_media?
  cells_to_assay_in: sample array, "The strains to assay.  4 copies of each strain"
end

step
  description: "Loading the plate reader"
  note: "In this protocol you will load glucose media and cell cultures into a 96 well plate reader"
  note: "Be prepared for a lot of pipetting! You will need to pipette around 150 times during this process"
  note: "Be sure to keep your 96 well plate sterile, and do not bump it too much.
         You do not want the liquid in the wells to touch the lid."
  image: "96_well_plate"
end

step
  description: "A 96 well plate"
  note: "This is the box of 96 well plates you will use.  It should have the following label:"
  bullet: "'3904' - Assay Plate, With Lid -
         Flat Bottom, Tissue Culture Treated - Black with Clear Bottom - Sterile, Polystyrene"
  note: "Be sure to put on a clean pair of gloves before taking a 96 well plate from the box"
  image: "96_well_plate_box"
end

take
  note: "'3904' - Assay Plate, With Lid -
         Flat Bottom, Tissue Culture Treated - Black with Clear Bottom - Sterile, Polystyrene"
  plate = 1 "96 Well Flat Clear Bottom Plate"
end

take
  #DI_water = 1 "DI Water, Sterile"
  cells = item cells_to_assay_in
  media = 1 "30 mL M9 liquid Glucose + amp + kan"
  note: "Now gather your cells from the shaker.
         The leftover media should be in the fridge where you stored it yesterday"
#  antifog = 1 "Antifog Solution"
end


step
  description: "Load the outermost edges of the plate with water"
  note: "It can be helpful to have your partner hold onto the media tube during this process
         to warm it up to room temperature"
  check: "Grab a clean falcon tube from your station, and fill it up with 10~15mL DI water
          (NOT 'double-refined'!) from location B15.320.J1"
  #TODO location of DI water
  bullet: "Loading water into the outer edge of the plate reader
         helps prevent evaporation of the samples, which will be in the middle of the plate"
  check: "Pipette 200uL of DI water into the outer edge of the 96 well plate, in the wells marked 'H20' in blue."
  image: "plate_reader_water"
end

step
  description: "Load the middle area of the plate with the glucose medium"
  check: "Pipette 200uL of 'M9 liquid Glucose + amp + kan' into the wells marked 'media' in green"
  note: "You are now done with the media.  Please dispose of it in the next step (into the red 'biohazard' box)"
  image: "plate_reader_media"
end

release media

cell0 = cells[0][:id]
cell1 = cells[1][:id]
cell2 = cells[2][:id]
step
  description: "Load the cell cultures into the wells"
  note: "Load the cells according to the chart"
  bullet: "Avoid touching the pipetter to the insides of the culture tube!
           This can cause cross-contamination!"
  bullet: "Best practice is to tilt the culture tube way over to the side,
           and allow the luid to flow up to (near) the rim before pipetting it out."
  check: "S1 = Cell culture tube ID %{cell0}"
  check: "S2 = Cell culture tube ID %{cell1}"
  check: "S3 = Cell culture tube ID %{cell2}"
  note: "You should pay attention to the time once you load the cells into the plate reader,
         as they may start to grow once they are diluted in fresh media
         (though they will grow much faster when heated up to 37C)."
  image: "plate_reader_sample_locations"
end

#step 
#  description: "Fetch defogger solution and aluminium foil"
#  check: "Retrieve the 'Fog Tech anti-fog solution' from location B5.530"
#  image: "anti_fog"
#end
take
  antifog = 1 "Antifog Solution"
end

step
  description: "Wipe down the plate lid with defogger solution"
  note: "This prevents condensation from disrupting the measurements"
  check: "Squirt a small amount of anti-fog solution onto a Kimwipe,
          and use it to wipe the inside of the lid"
  image: "anti_fog"
end

step
  description: "Seal the plate"
  check: "Cut out a small (3x5cm) piece of aluminum foil from location A8.400"
  check: "Fold the piece of aluminum foil over 3~4 times to construct a small (3mm thick) shim"
  check: "Insert the small foil shim into the (bent) corner of the assay plate,
          and close the lid.  There should be a tight fit.
          (This shim will keep the lid from rattling while it is shaken during the run)"
  #TODO: include picture of shim
end

step
  description: "Next steps..."
  note: "The sample must be induced at t = 0Hr, 1Hr, 1.5Hr, 2Hr, and 24Hr.  You will be done for today
         after the 2Hr induction; you'll need to come back tomorrow for the 24Hr induction and the day after that
         to finish the run."
  note: "Wait to dispose of your culure tubes until afer you've completed 'induce_atc_zero.pl' (the first inuction step)
         and 'begin_run.pl'. You will have plenty of time to soak your culture tubes in bleach 
         after you have started your run"
  image: "soak_bleach"
end

release concat(cells, antifog)
#return statement
