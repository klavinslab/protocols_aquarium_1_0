argument
  primer_f: sample array, "forward primer list"
  primer_r: sample array, "reverse primer list"
  plasmid_id: sample, "The plasmid stock"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

num_samples = length(primer_f)


take
  plasmid_stock = item plasmid_id
  phusion_stock = item enzyme_id
end



take
  primer1_stock0 = item primer_f[0]
  primer2_stock0 = item primer_r[0]
  primer1_stock1 = item primer_f[1]
  primer2_stock1 = item primer_r[1]
#  primer1_stock[2] = item primer_f[2]
#  primer2_stock[2] = item primer_r[2]
#  primer1_stock[3] = item primer_f[3]
#  primer2_stock[3] = item primer_r[3]
#  primer1_stock[4] = item primer_f[4]
#  primer2_stock[4] = item primer_r[4]
#  primer1_stock[5] = item primer_f[5]
#  primer2_stock[5] = item primer_r[5]
#  primer1_stock[6] = item primer_f[6]
#  primer2_stock[6] = item primer_r[6]
#  primer1_stock[7] = item primer_f[7]
#  primer2_stock[7] = item primer_r[7]
end

primer_f_items = [primer1_stock0[0],primer1_stock1[0]]
primer_r_items = [primer2_stock0[0],primer2_stock1[0]]


step
  description: "This protocol prepares the PCR mix in
    PCR tube and starts it in thermal cycler."
end

step
  description: "Label %{num_samples} 0.2mL PCR tubes
    from 0 to %{num_samples}."
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

release primer_f_items
release primer_r_items
release [plasmid_stock[0],phusion_stock[0]]


