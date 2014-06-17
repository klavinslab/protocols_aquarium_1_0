argument
  strains: sample array, "Strain(s) to plate"
  plate_type: object, "LB plate type"
end

# TODO: Can you take an exact batch id of plates? Want to do QA on a specific batch.

n = length(strain)

take
  taken_strains = item strains
  plates = n plate_type
end

plate_id = plates[:id]

step
  description: "Label the plates"
  note: "Label each plate with the following:"
  bullet: "Your initials"
  bullet: "The date"
  bullet: "The plate id - %{plate_id}"
  bullet: "Line(s) that split(s) the plate into n partitions labeled with the strain ids: %{strains}"
end

step
  description: "Streak plates"
  note: "Place 5 μL of each culture at the edge of the appropriate sector. Using a 10 μL pipet tip, streak until it covers the sector."
end

i = 0
produced_plates = []
while i < n
  produce
    current_strain = taken_strains[i]
    current_plate = plates[i]
    plate = 1 "Agar Plate" from current_strain
    release plate

    produced_plates = append(produced_plates, plate)

    i = i + 1
  end
end

log
  return: {plates: produced_plates}
end

release taken_strains
