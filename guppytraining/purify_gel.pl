argument
  gel: sample array, "Choose the Gel Slice you need to purify."
end

take
  gel_slice = item gel
end

size = length(gel)
i = 0
foreach i in gel
step
  description: "Weigh the gel slice tube with id %{i} on a scale at A5.300"
  note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
  getdata
    gel_weight: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
  end
end

while gel_weight > 200 
  step
    description: "Go back to Gel room to trim you gel slice"
    note: "Wait for the gel slice to thaw, put on the transiluminator, trim the non DNA part of your gel."
  end
  step
    description: "Weigh the gel slice on a scale at A5.300"
    note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
    getdata
      gel_weight: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
    end
  end
end

QG_volume = 3 * gel_weight

step
  description: "Add %{QG_volume} µL buffer QG into the gel slice tube with id %{i}"
end

i = i + 1
end

step
  description: "Incubate all %{size} tubes in a 50 C heat block at B3.340 for 10 minutes."
  note: "Vortex after 5 minutes of incubation and put back in the 50 C until 10 minutes totoal time reached"
end

step
  description: "Take out all tubes from 50 C heat block"
  note: "Place on bench in a tube rack."
end

step
  description: "Label %{size} pink QIAquick Spin columns from 1 to %{size}"
  note: "Write you initials on each."
end

step
  description: "Add the tube content in tubes with id %{gel} to each labeled QIAquick Spin column"
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place tubes into centrifuge at B14.320, make sure to balance."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the columns out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end

step
  description: "Add 750 µL PE buffer to column and wait 3 minutes"
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place the tube into centrifuge, make sure to balance."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the column out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end

step
  description: "Remove the residual PE buffer by centrifuge"
  bullet: "Place the tube into centrifuge, make sure to balance."
  bullet: "Select 17,000 g and 1 minutes, press start."
  warning: "Make sure to balance in the centrifuge!"
end

step
  description: "Take the column out of centrifuge and empty collection tube"
  note: "Empty the waste in collection tube into a liquid waster collector on bench, put the collection tube back on afterwards."
end

step
  description: "Label %{size} 1.5 mL tubes with number 1 to %{size} and place column into each"
  bullet: "Write you date and initials on the side of each tube."
  bullet: "Place the column into the labeled 1.5 mL tube."
end

step
  description: "Add 30 µL of EB buffer to the center of each column membrane and wait for 1 minutes."
  warning: "Be very careful to not pipette on the wall of the tube."
end

step
  description: "Centrifuge at top speed"
  bullet: "Place labeled tube with the column into centrifuge, make sure to balance."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Dicard the column and place the tube on the bench"
  bullet: "Column can go to the tip waster collector."
end
    
ii = 0
r = []
while ii < length(gel)
  produce
    product = 1 "Fragment Stock" from gel_slice[ii]
  end
  r = append(r,product[:id])
  ii = ii + 1
end


log
  return: {Fragment_Stock_id: r}
end
