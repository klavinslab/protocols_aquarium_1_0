#argument
#   fragment: sample, "The purified fragment that needs to be digested"
#  neb: sample, "Choose NEB4 buffer"
#  bsa: sample, "Choose BSA buffer"
#  dpn: sample, "Choose DpnI enzyme"
#end

take
#  y = item fragment
#  neb4 = item neb
#  bsa_buffer = item bsa
   neb4 = 1 "NEB Buffer 4"
   bsa  = 1 "BSA"
#   pmei =  "Enzyme: PmeI"
end

step
  description: "Use a -20 C blue ice block tube holder to grab the enzyme"
  note: "The enzyme are temperature sensitive."
end

take
   ice_block = 1 "Styrofoam Ice Block"
   alum_rack = 1 "Aluminum Tube Rack"
   pmei      = 1 "PmeI"
end

step 
  description: "Prepare PmeI digestion reaction"
#  check: "Pipet 42.3 µL molecular grade water into fragment tube with id %{fragment}."
  check: "Pipet 5 µL NEB4 buffer with id %{neb4} into the tube."
  check: "Pipet 0.5 µL BSA buffer with id %{bsa} into the tube."
  check: "Pipet 0.3 µL PmeI enzyme with id %{pmei} into the tube."
  note: "Be careful to pipet into the liquid, not the side of the tube."
end

step
  description: "Put the tube in a small green tube holder."
  image: "green_tube_holder"
end

step
  description: "Place in the 37°C incubator for 40 minutes, location is B14.310."
  image: "put_green_tube_holder_to_incubator"
end

#modify
#  y[0]
#  location:"B14.310"
#  inuse:0
#end

release [neb4[0],bsa[0],pmei[0], ice_block[0], alum_rack[0]]
