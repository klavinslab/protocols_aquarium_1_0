argument
  fragment: sample,"The nucleic acid sample that you want to spec its concentration"
end

take
  y = item fragment
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
  check: "Add 1.5 μL of Molecular Grade Water on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Initialize in the software."
end

step
  description: "Blank the Nanodrop"
  note: "If Initialization was necessary, the same water sample can be used to blank."
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 μL of Molecular Grade Water on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Blank in the software."
end

step
  description: "Measure the Ssample"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 1.5 μL of your sample with id %{fragment} on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Measure in the software."
end

step
  description: "Record the concentration shown on the nanodrop computer"
  getdata
    conc: number,"Write down the number shown on the computer after ng/μL"
  end
end

step
  description: "Clean the Nanodrop"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
end

release y
