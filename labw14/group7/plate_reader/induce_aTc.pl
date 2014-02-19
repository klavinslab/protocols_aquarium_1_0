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
  description: "Pause the program and remove the 96-well plate"
  check: "Click the 'Abort read' button on in the 'Biotech Gen5 1.11 program'"
  check: "Push the black button on the side of the plate reader to open the loading tray"
  #TODO: details on pausing the program
end

step
  description: "Add the inducer to the wells indicated in the chart"
  check: "Pipette 1uL of aTc solution into each well indicated in the plate chart"
  note: "Use a new tip each time to avoid contamination"
  image: "%{plate_chart}"
  #image: "induce_2"
end

step
  description: "Load the plate back into the reader and resume the program"
  check: "Push the black button on the side of the plate reader to close the loading tray"
  check: "Click the 'Run' button in the 'Biotech Gen5 1.11 program' to resume collecting data"
end

#release aTc_inducer
