

step #The flllowing two steps should be a "take" instead, but the antifog solution and assay plates are not in the Aquarium inventory
  description: "Fetch the assay plate"
  check: "Retrieve one '96 well plate', black with clear bottom and lid (item number 3904) from location B5.745"
end

step 
  description: "Fetch defogger solution"
  check: "Retrieve the 'Fog Tech anti-fog solution' from location B5.530"
end

step
  description: "Wipe down the plate lid with defogger solution"
  note: "This prevents condensation from disrupting the measurements"
  check: "Squirt a small amount of anti-fog solution onto a Kimwipe, and use it to wipe the inside of the lid"
end

step
  description: "Seal the plate"
  check: "Retrieve a box of aluminum foil from location x.x"
  check: "Cut out a small (3x3cm) square of aluminum, and fold it over 3~4 times to construct a small (3mm thick) shim"
  check: "Insert the small foil shim on the corner of the assay plate, and close th lid (This shim will keep the lid from rattling during the run)"
  #TODO: include picture
end

step
  description: "Start the plate reader software"
  check: "Move to the 'Biotech Synergy HT' plate reader at location B9.355"
  check: "On the accompanying computer, click the start menu, type in 'Gen5 1.11', and hit enter to run the 'Biotech Gen5' software"
end

step
  description: "Clear the previous data"
  check: "Go to 'File->Open...', and open the file 'Lab B Sample Run'"
  check: "Immediately go to 'File->Save As...', and save this into a new file name"
  check: "Click on 'Procedure->change run time' to clear all previous data"
  check: "Click on the 'Run Procedure' button to start.  This should cause the door to open up"
end

step
  description: "Insert the plate into the plate reader"
  check: "Load the assay plate into the plate reader"
  check: "Click the 'read' button to start the program"
  check: "You will now wait 30minute until your first induction step"
end
