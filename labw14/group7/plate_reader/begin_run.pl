step #The flllowing two steps should be a "take" instead, but the antifog solution and assay plates are not in the Aquarium inventory
  description: "Fetch your loaded assay plate"
  note: "You should try to move quickly through these steps, as your cells will continue to grow as they are sitting there!"
  check: "You should have a pre-loaded 96 well assay plate in your posession to start this protocol"
  image: "96_well_plate"
end

step
  description: "Make sure the plate reader is warmed up"
  note: "You should have the program running from the previous step, with the lamp warmed up to 37 degrees"
  note: "If the heating step is not complete, please wait until it is finished heating up before proceeding"
  image: "plate_reader_confirm"
  #TODO: Check for accuracy
end

step
  description: "Open the plate reader door"
  check: "Press the small black button on the left side of the plate reader to upen the door (marked with '1')"
  image: "plate_reader_open_button"
end

step
  description: "Insert the plate into the plate reader"
  check: "Load the assay plate into the plate reader"
  image: "plate_reader_loaded"
end


step
  description: "Start the run"
  check: "Click the 'Okay' button to start the program"
  image: "plate_reader_confirm"
  note: "You will now wait (1 hour) until your next induction step"
end
