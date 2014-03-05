argument
  aTc_inducer_in: object, "The aTc inducer to add"
  plate_chart: string, "The filename of the chart to use"
end

take
  aTc_inducer = 1 aTc_inducer_in
end

#step
#  description: "Fetch your aTc inducer"
#  check: "You should have a 1mL aliquot of '200ng/ml aTc' in MG water on your bench to start this protocol"
#  check: "You should be working near the 'Biotech Synergy HT' plate reader at location B9.355"
#  check: "You should see the 'Biotech Gen5 1.11 program' running on the accompanying computer"
#end

step
  description: "Pause the program"
  check: "Click the 'Abort read' button on in the 'Biotech Gen5 1.11 program'"
  bullet: "This should automatically open the plate reader door.
          If it does not open, just follow the instructions on the next page"
  image: "plate_reader_abort"
end

step
  description: "Remove the 96-well plate"
  check: "Push the black button on the side of the plate reader to open the loading tray (marked '1')"
  image: "plate_reader_open_button"
end

step
  description: "Add the inducer to the wells indicated in the chart"
  check: "Pipette 1uL of aTc solution into each well shown in orange in the chart"
  bullet: "The already induced wells are shown in yellow, the un-induced wells are shown in green"
  note: "Use a new tip each time to avoid contamination"
  image: "%{plate_chart}"
  #image: "induce_2"
end

step
  description: "Load the plate back into the reader"
  check: "Push the black button on the side of the plate reader to close the loading tray"
  image: "plate_reader_loaded"
end

step
  description: "Resume the program"
  check: "Click the 'Run' button in the 'Biotech Gen5 1.11 program', then click 'okay' to resume collecting data"
  image: "plate_reader_confirm"
end

release aTc_inducer
