argument
  yeast_susp: sample, "Choose the Yeast Sample from which to Isolate RNA"
  iScript: sample, "iScript RT-qPCR sample preparation reagent at bench"
  #yeast_conc: number, "Enter the Starting Cell Concentration of Yeast Sample (i.e. cells/mL)"
end

take
  y = item yeast_susp
  z = item iScript
end

step
  description: "Label a 1.5mL Tube"
  note: "Write your initials and date on it."
end

step
  description: "Transfer 100µL of the Yeast Sample to the 1.5mL Tube"
  note: "Tube content volume is 100 µL."
end

step
  description: "Centrifuge at 2,000 rcf (Make sure to balance the centrifuge!)"
  bullet: "Place the tube into centrifuge at B14.320, balance with another column."
  bullet: "Select 4560 rpm and 4°C for 1 minute, press start."
end

step
  description: "Take the column out of the centrifuge and remove supernatant"
  note: "Remove/aspirate the supernatant, not leaving more than 5µL of PBS" 
  warning: "Do NOT disturb the cell pellet"
end

step
  description: "Add iScript RT-qPCR sample prep reagent and vortex "
  check: "Add 100 µL of iScript to cell pellet"
  check: "Vortex on medium (6/10) for 30 seconds"
end

step
  description: "Centrifuge lysate at 15,000 rcf"
  bullet: "Place the tube into centrifuge at B14.320, balance with another column."
  bullet: "Select 12,500 rpm and 2 minutes, press start."
end

step
  description: "Take the tube out of centrifuge and store supernatant"
  note: "Aspirate the supernatant and place in new 1.5mL Tube."
  warning: "The supernatant is your isolated RNA!!! Don't throw away."
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
end

produce
  rna_sus= 1 "Isolated RNA" from y[0]
  location: "Bench"
  note: "Place in Aluminum Tube Rack on Ice Block"
end

step
  description: "Discard the cell pellet tube"
  bullet: "Can go in the tip waste collector."
end

release [y[0]]
release [z[0]]

log
  return: {rna_suspension: rns_sus}
end
