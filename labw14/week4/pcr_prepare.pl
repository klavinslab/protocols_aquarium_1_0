argument
  primer_f: sample array, "forward primer list"
  primer_r: sample array, "reverse primer list"
  plasmid_id: sample, "The plasmid stock"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

num_samples = length(primer_f)


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
  description: "Label %{num_samples} 0.2mL PCR tubes from 0 to %{num_samples}."
end

ii = 0
while ii< num_samples
  step
    description: "Prepare Reaction"
    check: "Pipet 19 µL molecular grade water into the labeled PCR tube."
    check: "Pipet 1 µL of plasmid with id %{plasmid_id} into the tube."
    check: "Pipet 2.5 µL of primer with id %{primer_f[ii]} into the tube."
    check: "Pipet 2.5 µL of primer with id %{primer_r[ii]} into the tube."
    check: "Pipet 25 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
    check: "Use the tip to gently mix."
    note: "Be careful to pipette into the liquid, not the side of the tube."
  end
  ii = ii+1
end

step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler and run"
  note: ""
  image: "thermal_cycler_home"
end

release primer_f
release primer_r
release [plasmid_stock[0],phusion_stock[0]]


