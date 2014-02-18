argument
  aTc_inducer_in: object, "The aTc inducer to add"
  plate_chart: string, "The filename of the chart to use"
end

take
  aTc_inducer: 1 aTc_inducer_in
end

step
  description: "Pause the program and remove the 96-well plate"
  #TODO: details on pausing the program
end

step
  description: "Add the inducer to the wells indicated in the chart"
  check: "Pipette 1uL of aTc solution into each well"
  note: "Use a new tip each time to avoid contamination"
  image: plate_chart
end

step
  description: "Load the plate back into the reader and resume the program"
  #TODO: details on resuming the program
end

release aTc_inducer
