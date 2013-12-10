information "Spread cells onto a 25mL petri dish containing ~25mL agar media."

argument
   e_coli_strain_id: sample, "A sample"
   volume: number, "The volume (µL) to plate"
   plate_type: object, "Type of plate (from the solidmedia categoy)"
end

take
  strain = item e_coli_strain_id
  plate = 1 plate_type
  beads = 1 "Glass Bead Aliquot (sterile)"
  collector = 1 "Glass Bead Waste Collector"
  note: "Do not take plate from top of the stack if there is a date stick on it, take from the middle of the stack."
end

step
  description: "Write down your initials and date on the plate"
  image: "write_on_the_plate"
end

step
  description: "Add sterile glass beads to the plate"
  note: "Invert the plate so that the lid is on the bench. 
         Add 5-10 beads to the inside of the lid (lift the plate up). 
         Place the plate back on the lid afterwards."
  image: "pour_beads_on_plate"
end

step
  description: "Transfer the sample to the center of the plate"
  note: "Invert the plate so the beads are on the agar surface. Lift the lid and 
         pipette %{volume} µL of sample on the agar surface
         and put the lid back on the plate."
  warning: "Do not place the plate lid on lab bench while you do this."
  image: "pipette_culture_on_plate"
end

step
  description: "Shake the plate to spread the sample over the surface."
  note: "Use 4 sharp shakes, turn 90 degrees between two shakes, then pour the beads out into the waste bead container. 
         When done, place the plate lid down on the bench in preparation for incubation."
  image: "spread_beads_on_plate"
end

produce
  r = 1 "Agar plate" from strain[0]
  note: "Keep the plate on the bench to use in the next protocol (incubating)."
  location: "Bench"
  release plate
end

log
  return: { plate_id: r[:id] }
end
  
release [ strain[0], beads[0], collector[0] ]
 
