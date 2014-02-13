argument
  fragment1: sample, "Fragment 1 for Gibson reaction"
  fragment2: sample, "Fragment 2 for Gibson reaction"
end

take
  x = 1 "Gibson Aliquot"
  y1 = item fragment1
  y2 = item fragment2
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "Label the Gibson aliquot tube, write you initials and date on it."
end

step
  description: "Prepare the Gibson reaction"
  check: "Add 2 µL of molecular grade water to the labeled tube."
  check: "Add 1.5 µL of fragment 1 with id %{fragment1} to the tube."
  check: "Add 1.5 µL of fragment 2 with id %{fragment2} to the tube."
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
  r = 1 "Gibson Reaction Result" of "pLAB3"
  release x
end

release [y1[0],y2[0]]

