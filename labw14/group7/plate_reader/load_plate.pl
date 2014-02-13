argument
  glucose_media
  ce
end

take
  glucose_media: 
  MG_water:
  cells
end

step
  description: "This protocol loads the plate reader with the samples to be assayed"
end

step
  description: "Load the outermost edges of the plate with water"
  note: "This helps prevent evaporation of the samples, which will be in the middle of the plate"
  check: "pipette 200uL of DI water into the outer edges"
  #todo: include a picture of this
end

step
  description: "Load the middle area of the plate with the glucose medium"
  check: "pipette 200uL of glucose media into each open well"
  #todo: generalize this step
end

step
  description: "Load the cells into the wells"
  check: "Load the cells according to the chart"
  #todo: include chart
  #todo: identify which cells correspond to which type.  Generalize.
end

produce
 a = 1 "loaded plate" from cells[]
 Location: "Bench"
end

#return statement
