argument
  yeast_susp1: sample, "Choose the Yeast Sample from which to Isolate RNA"
  yeast_susp2: sample, "Choose the Yeast Sample from which to Isolate RNA"
  iscript: sample, "iScript RT-qPCR sample preparation reagent at bench"
  #yeast_conc: number, "Enter the Starting Cell Concentration of Yeast Sample (i.e. cells/mL)"
end

take
  x = item yeast_susp1
  y = item yeast_susp2
  z = item iscript
  note: "Allow the RT-qPCR Sample Prep Reagent to thaw"
end

step
  description: "Label two 1.5mL Tubes"
  note: "Write your initials and date on them."
end

step
  description: "Transfer 100µL of the Yeast Sample 1 to one 1.5mL Tube"
  bullet: "Yeast cell concentration should be approximately 10^6 cells/µL"
  note: "Tube content volume is 100 µL."
end

step
  description: "Transfer 100µL of the Yeast Sample 2 to the other 1.5mL Tube"
  bullet: "Yeast cell concentration should be approximately 10^6 cells/µL"
  note: "Tube content volume is 100 µL."
end

step
  description: "Centrifuge at 2,000 rcf (Make sure to balance the centrifuge!)"
  bullet: "Place the tube into centrifuge at B14.320, balance with another column."
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

produce
  rna_sus1= 1 "Isolated RNA" from x[0]
  location: "Bench"
  note: "Place in Aluminum Tube Rack on Ice Block"
end

produce
  rna_sus2= 1 "Isolated RNA" from y[0]
  location: "Bench"
  note: "Place in Aluminum Tube Rack on Ice Block"
end

step
  description: "Discard the cell pellet tubes"
  bullet: "These tubes can go in the tip waste collector."
end

release [y[0], x[0], z[0]]


log
  return: {rna_suspension1: rna_sus1, rna_suspension2: rna_sus2}
end
