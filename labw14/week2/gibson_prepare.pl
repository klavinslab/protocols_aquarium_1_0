argument
  fragment1: sample, "Fragment 1 for Gibson reaction"
  fragment2: sample, "Fragment 2 for Gibson reaction"
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "Label the Gibson aliquot tube, write you initials and date on it."
end

step
  description: "Prepare the Gibson reaction"
  check: "Add 1 µL of molecular grade water to the labeled tube."
  check: "Add 2 µL of fragment 1 with id %{fragment1} to the tube."
  check: "Add 2 µL of fragment 2 with id %{fragment2} to the tube."
  note: "Gently mix with pipette tip."
end

step
  description: "Incubate the tube in a 50 C heat block."
  note: "Wait 30 minutes for your next gibson_finish protocol."
end

