information "Load and run an agarose gel."


argument
  fragment_in_pcr: sample
  ladder_1_kb: sample
  fragment_volume: number, "The volume of PCR fragment to load in µL."
end


take
  gel = 1 "1% Agarose Gel in box"
  fragment = item fragment_in_pcr
  ladder = item ladder_1_kb
  loading_dye = 1 "6X Loading Dye"
end


step
  description: "Set up the power supply."
  note: "In the gel room, obtain a power supply and set it to 100 V and with a 40 minute timer.\n\nAttach the electrodes of an appropriate gel box lid to the power supply."
end


step
  description: "Set up the gel box."
  bullet: "Carefully remove the casting tray from the gel box, keeping it level (the gel can slide off)."
  bullet: "Fill the gel box with 1X TAE until it just covers the center of the gel box."
  bullet: "With the gel box electrodes facing away from you, place the gel (in casting tray) back in the gel box such that the top lane is on your left."
end


step
  description: "Load the ladder"
  note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) into the first (top-left) well of the gel."
end


dye_volume = fragment_volume / 5.0
step
  description: "Add loading dye to the PCR fragment"
  note: "Using a 10 µL or 100 µL pipetter, add %{dye_volume} µL of loading dye to the PCR fragment."
end


step
  description: "Load the PCR"
  note: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the PCR fragment (containing loading dye) into the first (top-left) well of the gel."
end


step
  description: "Start electrophoresis"
  note: "Carefully attach the gel box lid to the gel box, being careful not to bump the samples out of the wells. Hit the start button on the gel boxes - usually a small running person icon."
end


produce
  gel_lane = 1 "Gel Lane" of "Fragment" from fragment[0]
end
