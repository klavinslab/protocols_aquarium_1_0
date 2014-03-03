argument
  gel1: sample, "Choose the first Gel Slice you need to purify."
  gel2: sample, "Choose the second Gel Slice you need to purify."
end

take
  gel_slices1 = item gel1
  gel_slices2 = item gel2
end

T1 = gel1
T2 = gel2

step
  description: "Weigh the gel slice with id %{T1} on a scale at A5.300"
  note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
  getdata
    gel_weight1: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
  end
end


while gel_weight1 > 200 
  step
    description: "Go back to Gel room to trim you gel slice"
    note: "Wait for the gel slice to thaw, put on the transiluminator, trim the non DNA part of your gel."
  end
  step
    description: "Weigh the gel slice with id %{T1} on a scale at A5.300"
    note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
    getdata
      gel_weight1: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
    end
end
end

step
  description: "Weigh the gel slice with id %{T2} on a scale at A5.300"
  note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
  getdata
    gel_weight2: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
  end
end

while gel_weight2 > 200 
  step
    description: "Go back to Gel room to trim you gel slice"
    note: "Wait for the gel slice to thaw, put on the transiluminator, trim the non DNA part of your gel."
  end
  step
    description: "Weigh the gel slice with id %{T2} on a scale at A5.300"
    note: "Use an empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
    getdata
      gel_weight2: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
    end
end
end

QG_volume1 = 3 * gel_weight1
QG_volume2 = 3 * gel_weight2

QG_volume_plus = QG_volume1 + 100


step
  description: "Purification"
  note: "Add %{QG_volume1} µL buffer QG into the gel slice tube with id %{T1}"
  note: "Add %{QG_volume2} µL buffer QG into the gel slice tube with id %{T2}"
end

step
  description: "Incubate the tubes in a 50 C heat block at B3.340 for 10 minutes."
  note: "Vortex after 5 minutes of incubation and put back in the 50 C until 10 minutes total time reached"
end

step
  description: "Take out the tubes from 50 C heat block"
  note: "Place them on bench in a tube rack."
end

step
  description: "Label two pink QIAquick Spin columns"
  note: "Write your initials on it."
end

step
  description: "Add each tube content to seperate labeled QIAquick Spin columns"
  note: "Tube content volume shoud be around %{QG_volume_plus} µL."
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place the tubes into centrifuge at B14.320."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the columns out of centrifuge and empty collection tubes"
  note: "Empty the waste in collection tubes into a liquid waster collector on bench, put the collection tubes back on afterwards."
end

step
  description: "Add 750 µL PE buffer to columns and wait 3 minutes"
end

step
  description: "Centrifuge at top speed (Make sure to balance in the centrifuge!)"
  bullet: "Place the tubes into centrifuge."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Take the columns out of centrifuge and empty collection tubes"
  note: "Empty the waste in collection tubes into a liquid waster collector on bench, put the collection tubes back on afterwards."
end


step
  description: "Remove the residual PE buffer by centrifuge"
  bullet: "Place the tubes into centrifuge."
  bullet: "Select 17,000 g and 1 minutes, press start."
  warning: "Make sure to balance in the centrifuge!"
end

step
  description: "Take the columns out of centrifuge and empty collection tubes"
  note: "Empty the waste in collection tubes into a liquid waster collector on bench, put the collection tubes back on afterwards."
end

step
  description: "Label two 1.5 mL tubes and place columns into it"
  bullet: "Write you date and initials on the side of the tubes."
  bullet: "Place the columns into the labeled 1.5 mL tubes."
end

step
  description: "Add 30 µL of EB buffer to the center of column membrane and wait for 1 minutes."
  warning: "Be very careful to not pipette on the wall of the tube."
end

step
  description: "Centrifuge at top speed"
  bullet: "Place labeled tubes with the columns into centrifuge."
  bullet: "Select 17,000 g and 1 minutes, press start."
end

step
  description: "Dicard the columns and place the tubes on the bench"
  bullet: "Columns can go to the tip waster collector."
end
    
produce
  r = 1 "Fragment Stock" of "fGA"
  location: "Bench"
  release gel_slices1
end

produce
  t = 1 "Fragment Stock" of "fGA"
  location: "Bench"
  release gel_slices2
end

log
  return: {Fragment_Stock_id1: r[:id]}
end

log
  return: {Fragment_Stock_id2: t[:id]}
end
