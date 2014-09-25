argument
  plasmid_ids: sample array, "Transformed aliquots of E. coli."
  plate_type: object, "The (probably LB) plate type."
  initials: string, "Your 2 letter initials so you can be contacted with information about colony status"
end

volume=250
n = length(plasmid_ids)

take
  # FIXME: uniquify
  strains = item plasmid_ids
  plates = n plate_type
  #note: "Do not take plate from top of the stack if there is a date stick on it, take from the middle of the stack."
end

step
  description: "Write down your initials and date on each plate. Also write down %{initials} clearly."
  image: "write_on_the_plate"
end

step
  description: "Add sterile glass beads to each plate"
  note: "Invert each plate so that the lid is on the bench. Add 5-10 beads to the inside of the lid (lift the plate up). Place the plate back on the lid afterwards."
  image: "pour_beads_on_plate"
end

ii = 0
returned_items = []
while ii < n
  plasmid = plasmid_ids[ii]
  strain = strains[ii]
  plate = plates[ii]

  step
    description: "Transfer %{volume} µL of transformation to the center of a fresh plate"
    note: "Invert the plate so the beads are on the agar surface. Lift the lid and pipette %{volume} µL of sample %{plasmid} on the agar surface and put the lid back on the plate."
    warning: "Do not place the plate lid on lab bench while you do this."
    image: "pipette_culture_on_plate"
  end

  step
    description: "Shake the plate to spread the sample over the surface."
    note: "Use 4 sharp shakes, turn 90 degrees between two shakes (keep the plate level while turning), then pour the beads out into the waste bead container. When done, place the plate lid down on the bench in preparation for incubation."
    image: "spread_beads_on_plate"
  end

  produce
    r1 = 1 "E coli Plate of Plasmid" from strain
    note: "Place the plate in 37C incubator."
    location: "37C incubator"
    release plate
  end
  
  rid = r1[:id]
  returned_items = append(returned_items, rid)
  

  ii = ii + 1
end


log
  return: { transformed_plates: returned_items }
end


release strains
