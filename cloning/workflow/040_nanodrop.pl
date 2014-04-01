information "Measure DNA concentration using Nanodrop spectrophotometer."

argument
  fragment: sample array, "The DNA samples that you want to quantify."
end

take
  y = item fragment
end

step
  description: "Go the location B3.405, find the Nanodrop"
end

step
  description: "Is the Nanodrop in Nucleic Acids mode?"
  note: "If the Nanodrop is in Nucleic Acids mode, it should look similar to the picture shown: a title bar that said Nucleic Acids, Sample Type of DNA-50, and options to measure and blank."
  image: "nanodrop_nucleic_acids_mode"
  getdata
    na_mode: string, "Is the Nanodrop in Nucleic Acids mode?", ["Yes", "No"]
  end
end

if na_mode == "No"
  step
    description: "Set the Nanodrop to Nucleic Acids mode"
    note: "If the Nanodrop software is not running, open it. The icon looks like a black and blue hourglass."
    check: "If applicable, click 'Exit' on the current nanodrop screen"
    check: "Click the Nucleic Acids button"
  end

  step
    description: "Initialize the Nanodrop"
    check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
    check: "Add 2 µL of molecular grade water on the lower pedestal."
    check: "Close the pedestal."
    check: "Click 'OK' in the software."
    check: "Wait for the measurement to complete and the pop-up to go away"
  end

  step
    description: "Clean the Nanodrop"
    check: "Open the pedestal"
    check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  end
end

step
  description: "Blank the Nanodrop"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 2 µL of Buffer EB on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Blank in the software."
end

ii = 0
n = length(fragment)
while ii < n
  current_sample = fragment[ii]
  step
    description: "Measure sample %{current_sample}"
    check: "Open the pedestal"
    check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
    check: "Add 2 µL of your sample with id %{current_sample} on the lower pedestal."
    check: "Close the pedestal."
    check: "Click Measure in the software and wait for the measurement to appear."
  end

  step
    description: "Record the concentration shown on the nanodrop computer"
    note: "The concentration appears on a green background in the lower right of the window and is followed by ng/µL.\n\nWrite the number on the side of the tube, followed by ng/µL."
    getdata
      conc: number, "Write down the number shown on the computer after ng/µL"
    end
  end

  step
    description: "Clean the Nanodrop"
    check: "Open the pedestal"
    check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  end

  ii = ii + 1
end

release y
