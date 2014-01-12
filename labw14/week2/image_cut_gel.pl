argument
  Gel_Lane_id: sample, "The gel lane you got after run the gel"
end

step
  description: "Wear the UV protection glass"
end

step
  description: "Take the gel out of gel box and put it on transilluminator"
end

step
  description: "Turn on the transilluminator, put on the camera hood"
end

step
  description: "Turn on the camera, center around the gel and take a picture"
end

step
  description: "Remove the camera hood, cut out the gel slice with length 1799bp"
end

step
  description: "Put the gel slice into a 1.5 mL tube"
end

step
  description: "Clean up the transilluminator and gel station"
end

produce
  r = "Gel Slice" of "fLAB2"
  location = "Bench"
end

log
  return: {Gel_Slice_id: r[:id]}
end
