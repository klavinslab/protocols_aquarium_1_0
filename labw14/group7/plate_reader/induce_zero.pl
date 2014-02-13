argument
  loaded_plate:
  aTc inducer:
end

take
  loaded_plate:
  aTc inducer:
end

step
  description: "Add the inducer to the zero-delay wells"
  check: "Pipette 1uL of aTc solution into each of the indicated wells"
  note: "Use a new tip each time to avoid contamination"
  #todo: include chart
  #todo: generalize
end

produce
  b = 1 "zero_induced_plate" from loaded_plate
  Location: "Bench"
end

#return
