argument
  primer1: sample, "The first primer"
  primer2: sample, "The second primer"
  plasmid_id: sample, "The plasmid stock"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

take
  primer1_stock = item primer1
  primer2_stock = item primer2
  plasmid_stock = item plasmid_id
  phusion_stock = item enzyme_id
end

step
  description: "This protocol prepares the PCR mix in PCR tube and starts it in thermal cycler."
end

step
  description: "Label a 0.2mL PCR tube. Write your initials on it."
end

step 
  description: "Prepare Reaction"
  check:"Pipet 19 µL molecular grade water into the labeled PCR tube."
  check: "Pipet 1 µL of plasmid with id %{plasmid_id} into the tube."
  check: "Pipet 2.5 µL of primer with id %{primer1} into the tube."
  check: "Pipet 2.5 µL of primer with id %{primer2} into the tube."
  check: "Pipet 25 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
  check: "Use the tip to gently mix."
  note: "Be careful to pipette into the liquid, not the side of the tube."
end

step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program to run on the thermal cycler"
  note: "Click saved protocol, choose LABW14 folder, choose CLONEPCR."
end

step
  description: "Hit 'run' on the thermal cycler and select 50µL setting."
  note: "Coordinate with your fellow classmates to put all their samples before hit run."
end


release [primer1_stock[0],primer2_stock[0],plasmid_stock[0],phusion_stock[0]]


