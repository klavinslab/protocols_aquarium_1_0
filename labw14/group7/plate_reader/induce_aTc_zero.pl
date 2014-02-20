argument
  aTc_inducer_in: object, "The aTc inducer to add"
  plate_chart: string, "The filename of the chart to use"
end

take
  aTc_inducer = 1 aTc_inducer_in
end

step
  description: "Add the inducer to the wells indicated in the chart"
  check: "Pipette 1uL of aTc solution into each well"
  note: "Use a new tip each time to avoid contamination"
  image: "%{plate_chart}"
end

release aTc_inducer
