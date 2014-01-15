argument
  fragment: sample, "The purified fragment that needs to be digested"
  neb: sample, "Choose NEB4 buffer"
  bsa: sample, "Choose BSA buffer"
  dpn: sample, "Choose DpnI enzyme"
end

take
  y = item fragment
  neb4 = item neb
  bsa_buffer = item bsa
  dpn_enzyme = item dpn
end

step 
  description: "Prepare DpnI digestion reaction"
  check: "Pipet 18.2 µL molecular grade water into fragment tube with id %{fragment}."
  check: "Pipet 5 µL NEB4 buffer into the tube."
  check: "Pipet 0.5 µL BSA buffer into the tube."
  check: "Pipet 0.3 µL DpnI enzyme into the tube."
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

modify
  y[0]
  location:"B14.310"
  inuse:0
end
