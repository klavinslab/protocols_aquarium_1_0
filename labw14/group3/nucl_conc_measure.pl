argument
  fragment1: sample,"The nucleic acid sample that you want to spec its concentration"
  fragment2: sample,"The second nucleic acid"
end

take
  y1 = item fragment1
  y2 = item fragment2
end

information "Measure Nucleic Acid Concentration using Nanodrop Spectrophotometer."

step
  description: "Go to location B3.405, and find the Nanodrop"
end

step
  description: "Open Nanodrop Software and Initialize"
  check: "Verify the Nucleic Acid program is selected"
  note: "If initialization is necessary proceed with this step, if not skip ahead."
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 µL of Molecular Grade Water on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Initialize in the software."
end

step
  description: "Blank the Nanodrop"
  note: "If Initialization was necessary, the same water sample can be used to blank."
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 µL of Molecular Grade Water on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Blank in the software."
end

step
  description: "Measure the first Sample"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 µL of your sample with id %{fragment1} on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Measure in the software."
  check: "Write down the concentration"
end

step
  description: "Measure the second Sample"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 µL of your sample with id %{fragment2} on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Measure in the software."
  check: "Write down the concentration"
end

step
  description: "Record the concentrations shown on the nanodrop computer"
  getdata
    conc1: number, "Write down the concentration of the second sample"
    conc2: number, "Write down the concentration of the second sample"
  end
end

step
  description: "Clean the Nanodrop"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
end

log
  return:{conc_rna1: conc1, conc_rna2: conc2}
end

release concat(y1,y2)
