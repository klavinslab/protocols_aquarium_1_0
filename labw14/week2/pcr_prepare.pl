argument
  primer1: sample, "The first primer"
  primer2: sample, "The second primer"
  plasmid_id: sample, "The plasmid stock"
end

step
  description: "This protocol prepares the PCR mix in PCR tube and starts it in thermal cycler"
end

step
  description: "Label a 0.2mL PCR tube. Write your initials on it."
end

step
  description: "Pipet 19 µL molecular grade water into the labeled PCR tube."
end

step
  description: "Pipet 1 µL of plasmid with id %{plasmid_id} into the tube."
end

step
  description: "Pipet 2.5 µL of primer with id %{primer_1_id} into the tube."
end

step
  description: "Pipet 2.5 µL of primer with id %{primer_2_id} into the tube."
end

step
  description: "Pipet 25 µL of 2X Phusion Master Mix into the tube."
end





