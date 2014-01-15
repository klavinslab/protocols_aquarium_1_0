argument
  gel: sample, "Choose the Gel Slice you need to purify."
end

take
  gel_slice = item gel
end

step
  description: "Weigh the gel slice on a scale"
  note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
  getdata
    gel_weight: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
  end
end

QG_volume = 3 * gel_weight

QG_volume_plus = QG_volume + 100

step
  description: "Add %{QG_volume} µL buffer QG into the gel slice tube with id %{gel}"
end

step
  description: "Incubate the tube in a 50 C heat block at B3.340 for 10 minutes."
  note: "Vortex after 5 minutes of incubation and put back in the 50 C until 10 minutes totoal time reached"
end

step
  description: "Take out the tube from 50 C heat blcok"
  note: "Place it on bench in a tube rack."
end

step
  description: "Label a pink Qiagen column"
  note: "Write you initials on it."
end

step
  description: "Add the tube content to the labeled Qiagen column"
  note: "Tube content volume shoud be around %{QG_volume_plus} µL."
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
    
produce
  r = 1 "Fragment Stock" of "fLAB1"
  location: "Bench"
  release gel_slice
end

log
  return: {Fragment_Stock_id: r[:id]}
end
