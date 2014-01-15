argument
  fragment: sample, "Choose the fragment to purify"
end

take
  y = item fragment
end

step
  description: "Add 250 µL buffer PB into the fragment tube with id %{fragment}"
end

step
  description: "Label a pink Qiagen column"
  note: "Write you initials on it."
end

step
  description: "Add the tube content to the labeled Qiagen column"
  note: "Tube content volume is 300 µL."
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
  description: "Add 750 µL PE buffer to column and wait 5 minutes"
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
  bullet: "Write id number %{fragment} on the tube."
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

modify
  y[0]
  location:"Bench"
  inuse:0
end
