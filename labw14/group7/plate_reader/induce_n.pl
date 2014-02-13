argument
  loaded_plate:
  aTc inducer:
  iteration: int, "The number of times that the cells have previously been induced"
end

take
  loaded_plate:
  aTc inducer:
end

step
  description: "Add the inducer to the specified cells"
  check: "Pause the program (click abort)"
  check: "Remove the plate from the plate reader"
  check: "Remove the lid, and set aside the foil shim"
  check: "Pipette 1uL of inducer into the wells labeled %(iteration)"
  check: "Replace the lid (with foil shim), and reload into the plate reader"
  check: "Start the program again"
end

produce?

release [aTc inducer]?

return?
