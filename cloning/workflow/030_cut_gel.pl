argument
  gel: sample array, "Gel lanes (after gel has been run) in the order they were run, starting from lane 2."
  sizes: number array, "The expected size for each band."
end

take
  y = item gel
end

n = length(y)
step
  description: "Take out and label 1.5 mL tubes"
  note: "Take out %{n} 1.5 mL tubes and label them (ON THE SIDE) 1 through %{n}."
end

step
  description: "Take razor blade from shelf above station"
  note: "Razor blades are located in a petri dish next to the goggles. Take one out and carefully
  clean the blade using ethanol and a kimwipe"
  image: "spray_blade"
end

ii = 0
while ii < length(gel)
  tube_name = ii + 1
  lane_name = ii + 2
  lane_size = sizes[ii]
  step
    description: "Remove the camera hood, cut out a gel slice from lane %{lane_name}"
    note: "The lane should be %{lane_size} bp.\n\nIt may help to turn the romm lights off during this step. Use the ladder to locate where
    the band is. Use the razor blade to cut around the band."
    image: "cut_gel"
  end

  step
    description: "Trim the gel slice"
    note: "Try to remove as much excess gel as possible. Do not remove any gel that contains the band
    as this will limit the amount of DNA that can be extracted. In essence, try to cut away everything
    that is not glowing. It is important to trim the gel as excess gel will complicate the next protocol."
  end

  step
    description: "Put the gel slice into 1.5 mL tube labeled %{tube_name}"
    note: "Slide the gel slice onto the razor blade, open the tube and push the slice in. If the
    slice is to big, trim down excess gel. Again, do not trim gel that contains the band, only
    excess gel around the band."
    image: "slice_tube"
  end

  step
    description: "Clean the razor with ethanol spray and a kim wipe"
  end

  ii = ii + 1
end

step
  description: "Clean up the transilluminator and gel station"
  note: "Turn off the transilluminator. Dispose of the gel and any gel fragments by placing it in the waste container. Spray the surface of the transilluminator with ethanol and wipe until dry using kimwipes or paper towel. If the lights in the room are turned off, turn the lights back on. Remove the blue light goggles and put them back where you found them."
end

jj = 0
r = []
while jj < length(gel)
  n = jj + 1
  step
    description: "The next produce is for tube %{n}"
    note: "Remember to write the id on top"
  end
  produce
    product = 1 "Gel Slice" from y[jj]
  end
  r = append(r,product[:id])
  jj = jj + 1
end

log
  return: {Gel_Slice_id: r}
end
