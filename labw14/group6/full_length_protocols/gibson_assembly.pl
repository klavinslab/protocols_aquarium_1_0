argument
  fragments: sample array, "Choose the fragments you want to combine"
  backbone_fragments: sample array, "Choose the backbone fragments you want to combine with your main fragments."
end

take
  x = 1 "Gibson Aliquot"
  y = item fragments
  z = item backbone fragments
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "Label the Gibson aliquot tube, write you initials and date on it."
  image: "Group6_GibsonAliquot"
end

y1 = fragments[0]
y2 = fragments[1]
z1 = backbone_fragments[0]
z2 = backbone_fragments[1]
z3 = backbone_fragemnts[2]

step
  description: "Prepare the Gibson reaction"
  check: "Add 1 µL of backbone fragment 1 with id %{z1} to the labeled Gibson aliquot tube."
  check: "Add 1 µL of backbone fragment 2 with id %{z2} to the labeled Gibson aliquot tube."
  check: "Add 1 µL of backbone fragment 3 with id %{z3} to the labeled Gibson aliquot tube."
  check: "Add 1 µL of fragment stock 1 with id %{y1} to the labeled Gibson aliquot tube."
  check: "Add 1 µL of fragment stock 2 with id %{y2} to the labeled Gibson aliquot tube."
  note: "Gently mix with pipette tip."
end

step
  description: "Incubate the tube in a 50 C heat block at B3.340"
  note: "Wait 25 minutes for your the Gibson to complete."
  image: "Group6_heat_block"
end

step
  description: "WAIT HERE for 25 MINUTES. Hit Next after 25 minutes."
  timer: { hours: 0, minutes: 25, seconds: 0 }
end

step
  description: "Pick up the tube you incubated on the 50 C heat block"
  note: "Place in the M20 box slot specified in next page."
end

produce
  r = 1 "Gibson Reaction Result" of "pGA"
  release x
end

release y
release z


log
  return: {Gibson_Reaction_Result_id: r[:id]}
end
