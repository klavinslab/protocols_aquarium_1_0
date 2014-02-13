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

