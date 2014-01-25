argument
  gel: sample array, "Choose the Gel Slice you need to purify."
end

ii=0
slices = []
while ii<length(gel)
  take
    gel_slice = item gel[ii]
  end
  slices = append(slices,gel_slice[0])
  ii = ii+1
end

step
  description: "Add equal parts w/v buffer QG into the gel slice tube"
end

step
  description: "Incubate the tube in a 50 C heat block at B3.340 for 10 minutes."
  note: "Vortex after 5 minutes of incubation and put back in the 50 C until 10 minutes totoal time reached"
end

step
  description: "Take out the tube from 50 C heat block"
  note: "Place it on bench in a tube rack."
end

step
  description: "Label a pink QIAquick Spin column"
  note: "Write you initials on it."
end

step
  description: "Add the tube content to the labeled QIAquick Spin column"
  note: "."
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place the tube into centrifuge at B14.320, balance with another team's column."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the column out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end

step
  description: "Add 750 µL PE buffer to column and wait 3 minutes"
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place the tube into centrifuge, balance with another team's column."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the column out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end


step
  description: "Remove the residual PE buffer by centrifuge"
  bullet: "Place the tube into centrifuge, balance with another team's column."
  bullet: "Select 17,000 g and 1 minutes, press start."
  warning: "Make sure to balance in the centrifuge!"
end

step
  description: "Take the column out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end

step
  description: "Label a 1.5 mL tube and place column into it"
  bullet: "Write you date and initials on the side of the tube."
  bullet: "Place the column into the labeled 1.5 mL tube."
end

step
  description: "Add 30 µL of EB buffer to the center of column membrane and wait for 1 minutes."
  warning: "Be very careful to not pipette on the wall of the tube."
end

step
  description: "Centrifuge at top speed"
  bullet: "Place labeled tube with the column into centrifuge, balance with another team's column."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Dicard the column and place the tube on the bench"
  bullet: "Column can go to the tip waster collector."
end


ii = 0
while ii < length(slices)
  produce
    r = 1 "Fragment Stock" from slices[ii]
    location: "Bench"
    release gel_slice
  end
  ii = ii+1
end

