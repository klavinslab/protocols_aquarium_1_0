# Protocol for Yeast RNA extraction (Day 1 of process)

argument
  strain_id: sample("Yeast Strain") array, "Yeast sample(s) to be extracted"
end

take
  overnight = item strain_id
end

step
  check: "Collect cells by centrifugation at 3000 RPM for 5 minutes."
  check: "Discard all of the liquid supernatent by pouring."
  check: "Flash freeze by storing at -80C."
  note: "Samples can be removed from -80C storage and used as soon as they have frozen."
end

take
  a = 1 "TES Buffer"
  b = 1 "Acid Phenol"
  c = 1 "Chloroform"
  d = 1 "3M NaOAc"
  e = 1 "100%% Ethanol"
end

step
  description: "RNAse-free room etiquette"
  note: "Wear gloves at all times."
  #note: "Spray any items from outside the room with 
end

step
  check: "Remove samples from -80C storage."
  check: "Resuspend cells in 400 uL TES buffer."
  warning: "Always handle acid phenol under fume hood!"
  check: "Transfer to a 1.5 mL tube containing 400 uL acid phenol, while under fume hood."
end 

step
  check: "Vortex 10 seconds and then incubate at 65C for 60 minutes, vortexing a few times during the incubation."
  timer: { hours: 1, minutes: 0, seconds: 0 }
  note: "While samples are incubating, prepare phase lock gel (PLG) tubes: spin down PLG tubes so gel is at the bottom."
  check: "Centrifuge PLG tubes at 13 kRPM for 30 seconds."
end

step
  check: "Once incubation is complete, place samples on an ice block for 5 minutes."
  timer: { hours: 0, minutes: 5, seconds: 0 }
  note: "If samples freeze, thaw them before centrifugation."
  check: "Centrifuge at 13 kRPM for 10 minutes at 4C."
end 

step
  warning: "Always handle acid phenol under fume hood!"
  check: "Transfer top aqueous layer to new 1.5 mL tube containing 400 uL acid phenol, while under fume hood."
  check: "Vortex briefly and centrifuge at 13 kRPM for 10 minutes at 4C."
end

step
  check: "Transfer 350uL of top aqueous layer of samples to the PLG tubes."
  warning: "Always handle chloroform under fume hood!"
  check: "Add 350uL chloroform, while under fume hood."
  note: "Mix by inverting; do not vortex!"
end

step
  check: "Centrifuge at 13 kRPM for 10 minutes at 4C."
  check: "Transfer 200-300uL top aqueous layer to a new 1.5 mL tube."
  check: "Add a volume of 3M NaOAc equal to 1/10 that of transferred aqueous solution."
  check: "Add a volume of 100%% EtOH equal to 3 times that of transferred aqueous solution."
  check : "Place on dry ice for appx. 1 hour or at -20C overnight (keep EtOH cold)."
end

count=0
while count < length(strain_id)
  strain = overnight[count]
  produce
    p = 1 "Precipitated Yeast RNA" from strain
  end
  count = count + 1
end

release [ a[0], b[0], c[0], d[0], e[0]]

step
  description: "Proceed to Day 2 protocol"
end
