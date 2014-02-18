argument
  aTc_inducer_in: object, "The aTc inducer to add"
end

take
  aTc_inducer: 1 aTc_inducer_in
end

step
  description: "Add the inducer to the zero-delay wells"
  check: "Pipette 1uL of aTc solution into each of the indicated wells"
  note: "Use a new tip each time to avoid contamination"
  #TODO: include chart: induce_0
end

release aTc_inducer
