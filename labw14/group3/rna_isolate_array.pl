argument
  yeast_susp_array: sample array, "Choose the Yeast Samples from which to Isolate RNA"
  iscript: sample, "iScript RT-qPCR sample preparation reagent at bench"
end

n = length(yeast_susp_array)

take
  yeast_susp = item yeast_susp_array
  z = item iscript
  note: "Allow the RT-qPCR Sample Prep Reagent to thaw"
end

step
  description: "Label %{n} 1.5mL Tubes"
  note: "Write your initials and date on them."
end

i = 0
while i<n
  step
    description: "Transfer 100µL of the Yeast Sample %{yeast_susp[i]} to one 1.5mL Tube"
    bullet: "Yeast cell concentration should be approximately 10^6 cells/µL"
    note: "Tube content volume is 100 µL."
  end
  i = i+1
end

step
  description: "Centrifuge at 2,000 rcf (Make sure to balance the centrifuge!)"
  bullet: "Place the tube sinto centrifuge at B14.320, balance with blanks if needed."
  bullet: "Select 4,600 rpm and 4°C for 1 minute, press start."
  note: "Centrifuge is in x1000 rpm. Set to 4.6"
end

step
  description: "Take the tubes out of the centrifuge and remove supernatant"
  note: "Remove/aspirate the supernatant, not leaving more than 5µL of PBS" 
  warning: "Do NOT disturb the cell pellet"
end

step
  description: "Add iScript RT-qPCR sample prep reagent and vortex "
  check: "Add 100 µL of iScript RT-qPCR prep reagent to cell pellets"
  warning: "Be sure you are using the correct reagent!"
  check: "Vortex on medium (6/10) for 30 seconds"
end

step
  description: "Centrifuge lysate at 15,000 rcf"
  bullet: "Place the tubes into centrifuge at B14.320, balance centrifuge."
  bullet: "Select 12,500 rpm and 2 minutes, press start."
  note: "Centrifuge is in x1000 rpm. Set to 12.5"
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
end

step
  description: "Take the tubes out of centrifuge and store supernatant"
  note: "Aspirate the supernatant and place in new 1.5mL Tube."
  warning: "The supernatant is your isolated RNA!!! Don't throw away."
end

return_array = []

i = 0
while i<n
  produce
      s = 1 "Isolated RNA" from yeast_susp[i]
      note: "Place in Aluminum Tube Rack on Ice Block"
      note: "You may wish to keep this at your bench."
      location: "B13.425"
      return_array = append(return_array,s[:id])
  end
  i = i+1
end

step
  description: "Discard the cell pellet tubes"
  bullet: "These tubes can go in the tip waste collector."
end

release concat(yeast_susp, x, iceblock, alrack)
#release concat(iceblock, alrack)

log
  return: {rna_suspension_array: return_array}
end
