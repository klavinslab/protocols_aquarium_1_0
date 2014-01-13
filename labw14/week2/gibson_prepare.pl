argument
  fragment1: sample, "Fragment 1 for Gibson reaction"
  fragment2: sample, "Fragment 2 for Gibson reaction"
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "Label the Gibson aliquot tube, write you initials and date on it."
end

step
  description: "Add 2.5 µL of fragment 1 with id %{fragment1} to the labeled tube."
end

step
  description: "Add 2.5 µL of fragment 2 with id %{fragment2} to the labeled tube."
  note: "Gently mix with pipette tip."
end

step
  description: "Incubate the tube in an 50 C heat block."
  note: "Wait 40 minutes for your next gibson_finish protocol."
end

