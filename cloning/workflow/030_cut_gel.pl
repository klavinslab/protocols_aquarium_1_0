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

#TODO: account for case where no band is cut out
ii = 0
while ii < length(gel)
  tube_name = ii + 1
  lane_name = ii + 2
  lane_size = sizes[ii]
  step
    description: "Cut out a gel slice from lane %{lane_name}"
    check: "Cut out a band of %{lane_size} bp and leave it on the transilluminator."
    check: "Trim the gel slice, removing as much that doesn't have DNA as possible."
    check: "Put the gel slice into 1.5 mL tube labeled %{tube_name}."
    image: "cut_gel"
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
    release y[jj]
  end
  r = append(r,product[:id])
  jj = jj + 1
end

log
  return: {Gel_Slice_id: r}
end
