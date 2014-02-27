argument
  fragment: sample,"The sample that you want to spec its concentration"
end

take
  y = item fragment
end

information "Measure DNA concentration using Nanodrop spectrophotometer."

step
  description: "Go the location B3.405, find the Nanodrop"
end

step
  description: "Blank the Nanodrop"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 2 µL of Buffer EB on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Blank in the software."
end



step
  description: "Measure your sample"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  check: "Add 2 µL of your sample with id %{fragment} on the lower pedestal."
  check: "Close the pedestal."
  check: "Click Measure in the software."
end

step
  description: "Record the concentration shown on the nanodrop computer"
  getdata
    conc: number,"Write down the number shown on the computer after ng/µL"
  end
end

step
  description: "Clean the Nanodrop"
  check: "Open the pedestal"
  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
end

release y


