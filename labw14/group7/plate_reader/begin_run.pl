step #The flllowing two steps should be a "take" instead, but the antifog solution and assay plates are not in the Aquarium inventory
  description: "Fetch your loaded assay plate"
  note: "You should try to move quickly through these steps, as your cells will continue to grow as they are sitting there!"
  check: "You should have a pre-loaded 96 well assay plate in your posession to start this protocol"
  image: "96_well_plate"
end

step
  description: "Insert the plate into the plate reader"
  check: "Load the assay plate into the plate reader"
  image: "plate_reader_loaded"
end

step
  description: "Start the run"
  note: "You should have the program running from the previous step, with the lamp warmed up to 37 degrees"
  note: "If the heating step is not complete, please wait until it is finished before proceeding"
  check: "Click the 'read plate' button to start the program"
  image: "Read_plate"
  note: "You will now wait (1 hour) until your next induction step"
end
