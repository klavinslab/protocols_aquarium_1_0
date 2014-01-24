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


primer_f_items = []
primer_r_items = []

ii=0
while ii<length(primer_f)
  take
    p1 = item primer_f[ii]
    p2 = item primer_r[ii]
  end
  primer_f_items = append(primer_f_items,p1)
  primer_r_items = append(primer_r_items,p2)
  ii = ii+1
end


step
  description: "This protocol prepares the PCR mix in
    PCR tube and starts it in thermal cycler."
end

step
  description: "Put everything in each tube. "
  check: "Pipet 7.5 µL molecular grade water into the labeled PCR tube."
  check: "Pipet 0.5 µL of plasmid into the tube."
  check: "Pipet 1 µL of primer fwd into the tube."
  check: "Pipet 1 µL of primer rev into the tube."
  check: "Pipet 10 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
end

step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler and run Tm=63"
  note: ""
  image: "thermal_cycler_home"
end

release primer_f_items
release primer_r_items
release [plasmid_stock[0],phusion_stock[0]]


