argument
  fragments: sample array, "The purified fragments that needs to be digested"
  neb: sample, "Choose NEB4 buffer"
  bsa: sample, "Choose BSA buffer"
  dpn: sample, "Choose DpnI enzyme"
end

take
  neb4 = item neb
  bsa_buffer = item bsa
end

y = []
ii = 0
while ii<length(fragments)
  take
    temp = item fragments[ii]
  end
  ii = ii+1
  y=append(y,temp[0])
end

step
  description: "Use a -20 C blue ice block tube holder to grab the enzyme"
  note: "The enzyme are temperature sensitive."
end

take
  dpn_enzyme = item dpn
end

step
  description: "Prepare DpnI digestion reaction"
  check: "Pipet 5 µL NEB4 buffer with id %{neb} into the tube."
  check: "Pipet 0.5 µL BSA buffer with id %{bsa} into the tube."
  check: "Pipet 0.2 µL DpnI enzyme per µg dna with id %{dpn} into the tube."
  note: "Be careful to pipet into the liquid, not the side of the tube."
end

step
  description: "Put the tube in a small green tube holder."
  image: "green_tube_holder"
end

step
  description: "Place in the 37°C incubator, location is B14.310."
  image: "put_green_tube_holder_to_incubator"
end


ii = 0
while ii<length(y)
  modify
    y[ii]
    location:"B14.310"
    inuse:0
  end
  ii = ii + 1
end


release [neb4[0],bsa_buffer[0],dpn_enzyme[0]]
