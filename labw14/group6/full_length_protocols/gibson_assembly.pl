argument
  fragments: sample array, "Choose the fragments you want to combine"
end

take
  x = 1 "Gibson Aliquot"
  y = item fragments
  molecular_g_h2o = 1 "Molecular Biology Grade Water"
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "Label the Gibson aliquot tube, write you initials and date on it."
end

y1 = fragments[0]
y2 = fragments[1]
step
  description: "Prepare the Gibson reaction"
  check: "Add 2 µL of molecular grade water to the labeled tube."
  check: "Add 1.5 µL of fragment stock 1 with id %{y1} to the tube."
  check: "Add 1.5 µL of fragment stock 2 with id %{y2} to the tube."
  note: "Gently mix with pipette tip."
end

step
  description: "Incubate the tube in a 50 C heat block at B3.340"
  note: "Wait 25 minutes for your the Gibson to complete."
end

step
  description: "WAIT HERE for 25 MINUTES. Hit Next after 25 minutes."
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
release molecular_g_h2o


log
  return: {Gibson_Reaction_Result_id: r[:id]}
end
